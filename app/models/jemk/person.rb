# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

module Jemk::Person
  extend ActiveSupport::Concern

  included do
    used_attributes.delete(:company)
    used_attributes.delete(:company_name)

    Person::FILTER_ATTRS.delete(:company_name)
  end
end
