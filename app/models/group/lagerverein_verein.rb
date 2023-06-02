# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::LagervereinVerein < ::Group
  class Leiter < ::Role
    self.permissions = [:layer_read, :group_and_below_full, :contact_data]
  end

  class Kassier < ::Role
    self.permissions = [:layer_read, :finance]
  end

  class Mitglied < ::Role
    self.permissions = [:layer_read]
  end

  roles Leiter, Kassier, Mitglied
end
