# frozen_string_literal: true

#  Copyright (c) 2012-2024, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

require 'spec_helper'

describe InvoiceAbility do

  subject { ability }

  let(:ability) { Ability.new(role.person.reload) }
  let(:invoice) { Invoice.new(group: group) }

  describe 'Dachverband' do
    let(:group) { groups(:root) }

    context 'Geschaeftsleiter' do
      let(:role) do
        Fabricate(:'Group::DachverbandGeschaeftsstelle::Geschaeftsleiter',
                  group: groups(:geschaeftsstelle_3))
      end

      it 'may index invoices' do
        is_expected.to be_able_to(:index, Invoice)
      end

      it 'may show invoices in layer' do
        is_expected.to be_able_to(:show, invoice)
      end

      it 'may edit invoices in layer' do
        is_expected.to be_able_to(:edit, invoice)
      end
    end

    context 'Angestellter' do
      let(:role) do
        Fabricate(:'Group::DachverbandGeschaeftsstelle::Angestellter',
                  group: groups(:geschaeftsstelle_3))
      end

      it 'may index invoices' do
        is_expected.to be_able_to(:index, Invoice)
      end

      it 'may show invoices in group' do
        is_expected.to be_able_to(:show, invoice)
      end

      it 'may edit invoices in group' do
        is_expected.to be_able_to(:edit, invoice)
      end
    end
  end
end
