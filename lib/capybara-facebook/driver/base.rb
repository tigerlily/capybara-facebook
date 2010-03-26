require 'capybara/driver/base'

Capybara::Driver::Base.class_eval do
  def merge_params!(params={})
    raise NotImplementedError
  end
end
