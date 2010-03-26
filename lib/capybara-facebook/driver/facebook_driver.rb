require 'capybara-facebook/driver/base'
require 'capybara/driver/rack_test_driver'

class Capybara::Driver::Facebook < Capybara::Driver::RackTest

  def visit(path, attributes = {})    
    return if path.gsub(/^#{current_path}/, '') =~ /^#/
    get(path, facebook_default_params.merge(attributes), env)
    follow_redirects!
    cache_body
  end
  
  def facebook_parameters!(params={})
    facebook_default_params.merge!(params)
  end

private
  def facebook_default_params
    @facebook_default_params ||= {
      "fb_sig_added" => "1", 
      "fb_sig_session_key" => "facebook_session_key", 
      "fb_sig_user" => "1234", 
      "fb_sig_expires" => "0",
      "fb_sig_in_canvas" => "1",
      "fb_sig_time" => Time.now.to_f
    }
    @facebook_default_params
  end
end
