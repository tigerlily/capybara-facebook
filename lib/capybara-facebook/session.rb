require 'capybara/session'
require 'capybara-facebook/driver/facebook_driver'

Capybara::Session::DSL_METHODS << :facebook_parameters!

Capybara::Session.class_eval do
  def driver_with_facebook
    @driver ||= Capybara::Driver::Facebook.new(app) if mode == :facebook
    driver_without_facebook
  end
  
  alias_method :driver_without_facebook, :driver
  alias_method :driver, :driver_with_facebook
  
  def facebook_parameters!(params)
    driver.facebook_parameters!(params)
  end
end


