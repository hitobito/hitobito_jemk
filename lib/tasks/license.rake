# frozen_string_literal: true

namespace :app do
  namespace :license do
    task :config do # rubocop:disable Rails/RakeEnvironment
      @licenser = Licenser.new('hitobito_jemk',
                               'Jungschar EMK',
                               'https://github.com/hitobito/hitobito_jemk')
    end
  end
end
