require 'capybara/session'

Capybara::Session.class_eval do
    
    def driver_with_facebook
      @driver = Capybara::Driver::Facebook.new(app) if mode == :rack_test
    end
    alias_method :driver_without_facebook, :driver
    alias_method :driver, :driver_with_facebook
    
    
    def merge_params!(params)
      driver.merge_params!(params)
    end
  end
end