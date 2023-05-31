# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.


root = Group.roots.first

result = Group::Lagerverein.seed_once(:name, parent_id: root.id, name: 'Frühlingslager', short_name: 'FrüLa')
fruela = result.first
Group::LagervereinVerein.seed_once(:name, parent_id: fruela.id, name: 'Mädchen FrüLa', short_name: 'Mädchen')
Group::LagervereinVerein.seed_once(:name, parent_id: fruela.id, name: 'Knaben FrüLa', short_name: 'Knaben')

result = Group::Region.seed_once(:name, parent_id: root.id, name: 'Bärn', short_name: 'BE')
bern = result.first
Group::Ortsjungschar.seed_once(:name, parent_id: bern.id, name: 'JS Arcus')
Group::Ortsjungschar.seed_once(:name, parent_id: bern.id, name: 'JS Gilboa')
Group::Ortsjungschar.seed_once(:name, parent_id: bern.id, name: 'JS Terra Nova')

result = Group::Region.seed_once(:name, parent_id: root.id, name: 'Aargau', short_name: 'AG')
aargau = result.first
Group::Ortsjungschar.seed_once(:name, parent_id: aargau.id, name: 'JS Kyburg')
Group::Ortsjungschar.seed_once(:name, parent_id: aargau.id, name: 'JS Robi')

# require Rails.root.join('db', 'seeds', 'support', 'group_seeder')
# seeder = GroupSeeder.new
# srand(42)
# if root.address.blank?
#   root.update(seeder.group_attributes)
#   root.default_children.each do |child_class|
#     child_class.first.update(seeder.group_attributes)
#   end
# end

Group.rebuild!
