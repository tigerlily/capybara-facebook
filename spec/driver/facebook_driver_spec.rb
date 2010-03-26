require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe Capybara::Driver::Facebook do
  before do
    @driver = Capybara::Driver::Facebook.new(TestApp)
  end
  
  it_should_behave_like "driver"
  it_should_behave_like "driver with header support"
  
  
  describe "Facebook parameters" do
    before do
      @default_keys = %w(fb_sig_added fb_sig_session_key fb_sig_user fb_sig_expires fb_sig_in_canvas fb_sig_time)
    end
    
    it "should have Facebook default params" do
      @driver.visit('/')
      @driver.last_request.env["rack.request.query_hash"].should include(*@default_keys)
    end

    it "should be able to add a param to Facebook default params" do
      @driver.facebook_parameters!({ :fb_sig_is_fan => "1" })
      @driver.visit('/')
      query_hash = @driver.last_request.env["rack.request.query_hash"]
      query_hash.should have_key("fb_sig_is_fan")
      query_hash["fb_sig_is_fan"].should == "1"
    end

    it "should be able to change a Facebook default param value" do
      @driver.facebook_parameters!({ :fb_sig_in_canvas => "0" })
      @driver.visit('/')
      
      @driver.last_request.env["rack.request.query_hash"].should include(*@default_keys)

      query_hash = @driver.last_request.env["rack.request.query_hash"]
      query_hash.should have_key("fb_sig_in_canvas")
      query_hash["fb_sig_in_canvas"].should == "0"
    end
  end
  
  
end
