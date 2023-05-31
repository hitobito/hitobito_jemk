# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::Region < ::Group

  self.layer = true

  children Group::RegionVorstand,
           Group::RegionGeschaeftsstelle,
           Group::RegionGremium,
           Group::RegionMitglieder,
           Group::Ortsjungschar

  self.default_children = [
    Group::RegionVorstand,
    Group::RegionGeschaeftsstelle,
    Group::RegionMitglieder
  ]

  ### ROLES

  class Administrator < ::Role
    self.permissions = [:layer_and_below_full]
  end

  roles Administrator

end
