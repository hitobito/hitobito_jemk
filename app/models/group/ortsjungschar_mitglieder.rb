# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::OrtsjungscharMitglieder < ::Group
  class Leiter < ::Role
    self.permissions = [:group_and_below_full, :contact_data]
  end

  class Aktivmitglied < ::Role
    self.permissions = []
  end

  class Passivmitglied < ::Role
    self.permissions = []
  end

  roles Leiter, Aktivmitglied, Passivmitglied
end
