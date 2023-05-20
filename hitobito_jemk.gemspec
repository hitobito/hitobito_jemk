$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your wagon's version:
require 'hitobito_jemk/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'hitobito_jemk'
  s.version     = HitobitoJemk::VERSION
  s.authors     = ['Matthias Viehweger']
  s.email       = ['viehweger@puzzle.ch']
  # s.homepage    = 'TODO'
  s.summary     = 'Hitobito JEMK'
  s.description = 'Hitobito der Jungschar der Evangelisch-Methodistischen Kirche'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile']
  s.test_files = Dir['test/**/*']
end
