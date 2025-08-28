# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

module Jemk::Event::ParticipationContactData
  extend ActiveSupport::Concern

  included do
    Event.possible_contact_attrs -= [:company_name, :company]
  end
end
