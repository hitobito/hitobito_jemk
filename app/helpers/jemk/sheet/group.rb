# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

module Jemk::Sheet::Group
  extend ActiveSupport::Concern

  included do
    tabs.insert(4,
      Sheet::Tab.new("activerecord.models.event/camp.other",
        :camp_group_events_path,
        params: {returning: true},
        if: lambda do |view, group|
          group.event_types.include?(::Event::Camp) &&
            view.can?(:"index_event/camps", group)
        end))
  end
end
