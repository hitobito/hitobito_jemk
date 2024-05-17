# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::DachverbandGeschaeftsstelle < Group
  class Geschaeftsleiter < ::Role
    self.permissions = [:admin, :layer_and_below_full, :impersonation, :contact_data, :finance]
    self.two_factor_authentication_enforced = true
  end

  class Angestellter < ::Role
    self.permissions = [:admin, :layer_and_below_full, :impersonation, :contact_data, :finance]
    self.two_factor_authentication_enforced = true
  end

  roles Geschaeftsleiter, Angestellter
end
