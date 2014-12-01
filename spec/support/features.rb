require_relative 'features/session_helpers.rb'

RSpec.configure do |config|
  # Session helpers for Capybara
  config.include Features::SessionHelpers, type: :feature
end
