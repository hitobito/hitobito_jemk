# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Group::Dachverband < Group
  self.layer = true

  children Group::DachverbandVorstand,
    Group::DachverbandGeschaeftsstelle,
    Group::DachverbandGremium,
    Group::DachverbandMitglieder,
    Group::Lagerverein,
    Group::Region

  self.default_children = [
    Group::DachverbandVorstand,
    Group::DachverbandGeschaeftsstelle,
    Group::DachverbandMitglieder
  ]

  self.event_types = [
    Event,
    Event::Course
  ]

  ### ROLES

  class Administrator < ::Role
    self.permissions = [:admin, :layer_and_below_full, :impersonation]
    self.two_factor_authentication_enforced = true
  end

  roles Administrator
end
