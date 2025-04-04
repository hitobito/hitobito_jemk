# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

require "spec_helper"

describe :self_registration do
  subject { page }

  class Group::SelfRegistrationGroup < Group # rubocop:disable Lint/ConstantDefinitionInBlock
    self.layer = true

    class Guest < ::Role
      self.permissions = []
    end

    roles Guest
  end

  let(:group) do
    Group::SelfRegistrationGroup.create!(name: "Self-Registration Group")
  end

  let(:self_registration_role) { group.decorate.allowed_roles_for_self_registration.first }

  before do
    group.self_registration_role_type = self_registration_role
    group.save!

    allow(Settings.groups.self_registration).to receive(:enabled).and_return(true)
  end

  it "self registers and creates new person" do
    visit group_self_registration_path(group_id: group)

    fill_in "Vorname", with: "Max"
    fill_in "Nachname", with: "Muster"
    fill_in "Haupt-E-Mail", with: "max.muster@hitobito.example.com"

    expect do
      click_on "Registrieren"
      expect(page).to have_text(
        "Du hast Dich erfolgreich registriert. Du erhältst in Kürze eine E-Mail mit der Anleitung, " \
        "wie Du Deinen Account freischalten kannst."
      )
    end.to change { Person.count }.by(1)
      .and change { ActionMailer::Base.deliveries.count }.by(1)

    person = Person.find_by(email: "max.muster@hitobito.example.com")
    expect(person).to be_present

    person.confirm # confirm email

    person.password = person.password_confirmation = "really_b4dPassw0rD"
    person.save!

    fill_in "Haupt-E-Mail", with: "max.muster@hitobito.example.com"
    fill_in "Passwort", with: "really_b4dPassw0rD"

    click_button "Anmelden"

    expect(person.roles.map(&:type)).to eq([self_registration_role.to_s])
    expect(current_path).to match(/#{group_person_path(group_id: group, id: person)}.html\z/)
  end
end
