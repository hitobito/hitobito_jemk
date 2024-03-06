# frozen_string_literal: true

#  Copyright (c) 2012-2024, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

require 'spec_helper'

describe Event::ApplicationMarketController, js: true do

  context 'camp' do
    let(:fruela_admin) do
      Fabricate(Group::Lagerverein::Administrator.name.to_sym, group: group).person
    end
    let(:group) { groups(:fruela) }
    let(:camp) { Fabricate(:jemk_camp, name: 'FrüLa 2033', groups: [group]) }

    let!(:participation) do
      event_application = Event::Application.create!(
        priority_1: camp)

      Fabricate(:event_participation,
                event: camp,
                active: true,
                application: event_application)
    end

    it 'moves participation from applied to assigned and back' do
      sign_in(fruela_admin)
      visit group_event_application_market_index_path(group.id, camp.id)

      expect(page).to have_text('FrüLa 2033')
      expect(page).to have_css("#applications a", text: participation.person.to_s(:list))
      all("#applications #event_participation_#{participation.id} td").first.find('a').click
      expect(page).not_to have_css("#participants a", text: participation.person.to_s(:list))

      expect(page).to have_css("#participants a", text: participation.person.to_s(:list))
      all("#participants #event_participation_#{participation.id} td").last.find('a').click

      expect(page).not_to have_css("#participants a", text: participation.person.to_s(:list))
      expect(page).to have_css("#applications a", text: participation.person.to_s(:list))
    end

  end
end
