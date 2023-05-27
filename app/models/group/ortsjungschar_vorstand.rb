# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::OrtsjungscharVorstand < ::Group
  class Praesident < ::Role
    self.permissions = [:layer_full, :contact_data]
  end

  class Sekretaer < ::Role
    self.permissions = [:layer_full, :contact_data]
  end

  class Mitglied < ::Role
    self.permissions = [:layer_full, :contact_data]
  end

  roles Praesident, Sekretaer, Mitglied
end
