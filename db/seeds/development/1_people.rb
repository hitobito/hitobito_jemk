# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.


require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class JemkPersonSeeder < PersonSeeder

  def amount(role_type)
    case role_type.name.demodulize
    when 'Mitglied' then 5
    when 'Aktivmitglied' then 5
    when 'Passivmitglied' then 5
    when 'Vorstandsmitglied' then 2
    when 'Angestellter' then 2
    when 'Coach' then 2
    else 1
    end
  end

end

puzzlers = [
  'Carlo Beltrame',
  'Matthias Viehweger',
  'Micha Lüdi',
  'Nils Rauch',
  'Olivier Brian',
  'Pascal Simon',
  'Thomas Ellenberger',
]

devs = {
  'Customer Name' => 'customer@email.com'
}
puzzlers.each do |puz|
  devs[puz] = "#{puz.split.last.downcase.gsub('ü', 'ue')}@puzzle.ch"
end

seeder = JemkPersonSeeder.new

seeder.seed_all_roles

root = Group.root
devs.each do |name, email|
  seeder.seed_developer(name, email, root, Group::Dachverband::Administrator)
end
