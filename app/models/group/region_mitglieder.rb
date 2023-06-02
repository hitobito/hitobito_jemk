# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::RegionMitglieder < ::Group
  class Adressverwalter < ::Role
    self.permissions = [:group_and_below_full]
  end

  class Mitglied < ::Role
    self.permissions = []
  end

  roles Adressverwalter, Mitglied
end
