# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::Ortsjungschar < ::Group
  self.layer = true

  children Group::OrtsjungscharVorstand,
           Group::OrtsjungscharGremium,
           Group::OrtsjungscharMitglieder

  ### ROLES

  class Hauptleiter < ::Role
    self.permissions = [:layer_and_below_full, :contact_data]
  end

  class Leiter < ::Role
    self.permissions = [:group_and_below_full, :contact_data]
  end

  class Adressverwalter < ::Role
    self.permissions = [:group_and_below_full, :contact_data]
  end

  class Coach < ::Role
    self.permissions = [:layer_and_below_full, :approve_applications, :contact_data]
  end

  class Kassier < ::Role
    self.permissions = [:layer_read, :finance]
  end

  class Materialverwantwortlicher < ::Role
    self.permissions = [:layer_and_below_read, :contact_data]
  end

  class Aktivmitglied < ::Role
    self.permissions = [:group_and_below_read]
  end

  class Passivmitglied < ::Role
    self.permissions = []
  end

  roles Hauptleiter, Leiter, Adressverwalter, Coach, Kassier, Materialverwantwortlicher,
        Aktivmitglied, Passivmitglied
end
