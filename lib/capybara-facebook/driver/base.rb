require 'capybara/driver/base'

Capybara::Driver::Base.class_eval do
  def facebook_parameters!(params={})
    raise NotImplementedError
  end
end
