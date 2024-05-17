# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

require 'spec_helper'


describe GroupAbility do

  let(:role) { Fabricate(role_name.to_sym, group: group) }
  let(:ability) { Ability.new(role.person.reload) }

  subject { ability }

  describe 'Ortsjungschar' do
    let(:group) { groups(:js_arcus) }

    context 'Hauptleiter' do
      let(:role_name) { 'Group::Ortsjungschar::Hauptleiter' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.not_to be_able_to(:index_invoices, group)
      end
    end

    context 'Adressverwalter' do
      let(:role_name) { 'Group::Ortsjungschar::Leiter' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.not_to be_able_to(:index_invoices, group)
      end
    end

    context 'Adressverwalter' do
      let(:role_name) { 'Group::Ortsjungschar::Adressverwalter' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.not_to be_able_to(:index_invoices, group)
      end
    end

    context 'Coach' do
      let(:role_name) { 'Group::Ortsjungschar::Coach' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.not_to be_able_to(:index_invoices, group)
      end
    end

    context 'Kassier' do
      let(:role_name) { 'Group::Ortsjungschar::Kassier' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.not_to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.to be_able_to(:index_invoices, group)
      end
    end

    context 'Materialverantwortlicher' do
      let(:role_name) { 'Group::Ortsjungschar::Materialverantwortlicher' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.not_to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end
    end

    %w(Aktivmitglied Passivmitglied).each do |role_class|
      context role_class do
        let(:role_name) { "Group::Ortsjungschar::#{role_class}" }

        it 'may read on same group' do
          is_expected.to be_able_to(:show, group)
        end

        it 'may not index people on same group' do
          is_expected.not_to be_able_to(:index_people, group)
        end

        it 'may not update on same group' do
          is_expected.not_to be_able_to(:update, group)
        end

        it 'may not destroy same group' do
          is_expected.not_to be_able_to(:destroy, group)
        end

        it 'may read invoices on same group' do
          is_expected.not_to be_able_to(:index_invoices, group)
        end
      end
    end
  end

  describe 'OrtsjungscharVorstand' do
    let(:group) { groups(:vorstand_13) }

    %w(Praesident Sekretaer Mitglied).each do |role_class|
      context role_class do
        let(:role_name) { "Group::OrtsjungscharVorstand::#{role_class}" }

        it 'may read on same group' do
          is_expected.to be_able_to(:show, group)
        end

        it 'may not index people on same group' do
          is_expected.to be_able_to(:index_people, group)
        end

        it 'may not update on same group' do
          is_expected.to be_able_to(:update, group)
        end

        it 'may not destroy same group' do
          is_expected.not_to be_able_to(:destroy, group)
        end

        it 'may read invoices on same group' do
          is_expected.not_to be_able_to(:index_invoices, group)
        end
      end
    end
  end

  describe 'OrtsjungscharGremium' do
    let(:group) { groups(:gremium_projektgruppe_14) }

    context 'Leiter' do
      let(:role_name) { 'Group::OrtsjungscharGremium::Leiter' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.not_to be_able_to(:index_invoices, group)
      end
    end

    context 'Mitglied' do
      let(:role_name) { 'Group::OrtsjungscharGremium::Mitglied' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.not_to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.not_to be_able_to(:index_invoices, group)
      end
    end
  end

  describe 'OrtsjungscharMitglieder' do
    let(:group) { groups(:mitglieder_15) }

    context 'Leiter' do
      let(:role_name) { 'Group::OrtsjungscharMitglieder::Leiter' }

      it 'may read on same group' do
        is_expected.to be_able_to(:show, group)
      end

      it 'may not index people on same group' do
        is_expected.to be_able_to(:index_people, group)
      end

      it 'may not update on same group' do
        is_expected.to be_able_to(:update, group)
      end

      it 'may not destroy same group' do
        is_expected.not_to be_able_to(:destroy, group)
      end

      it 'may read invoices on same group' do
        is_expected.not_to be_able_to(:index_invoices, group)
      end
    end

    %w(Aktivmitglied Passivmitglied).each do |role_class|
      context role_class do
        let(:role_name) { "Group::OrtsjungscharMitglieder::#{role_class}" }

        it 'may read on same group' do
          is_expected.to be_able_to(:show, group)
        end

        it 'may not index people on same group' do
          is_expected.not_to be_able_to(:index_people, group)
        end

        it 'may not update on same group' do
          is_expected.not_to be_able_to(:update, group)
        end

        it 'may not destroy same group' do
          is_expected.not_to be_able_to(:destroy, group)
        end

        it 'may read invoices on same group' do
          is_expected.not_to be_able_to(:index_invoices, group)
        end
      end
    end
  end

end
