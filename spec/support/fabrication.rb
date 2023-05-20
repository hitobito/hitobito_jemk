# frozen_string_literal: true

Fabrication.configure do |config|
  config.fabricator_path = ['spec/fabricators',
                            '../hitobito_jemk/spec/fabricators']
  config.path_prefix = Rails.root
end
