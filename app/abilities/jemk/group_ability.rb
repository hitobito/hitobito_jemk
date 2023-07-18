# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.


module Jemk::GroupAbility
  extend ActiveSupport::Concern

  included do
    on(Group) do
      permission(:any).may(:'index_event/camps').all

      permission(:group_full).may(:'export_event/camps').in_same_group
      permission(:group_and_below_full).may(:'export_event/camps').in_same_group_or_below
      permission(:layer_read).may(:'export_event/camps').in_same_layer
      permission(:layer_and_below_read).may(:'export_event/camps').in_same_layer_or_below
    end
  end
end
