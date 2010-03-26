require 'capybara/cucumber'

Before('@facebook') do
  Capybara.current_driver = :facebook
end