# capybara-facebook

capybara-facebook is a Facebook Driver for Capybara. It aims to easily test a Facebook application in your integration tests.


## Installation


    $ [sudo] gem install capybara-facebook


## How to use it with Cucumber ?

Add these lines on your `features/support/env.rb` file : 

    require 'capybara-facebook'
    require 'capybara-facebook/cucumber'
    
Important, if you use Cucumber with Rails you must require `capybara/rails` after the lines above.

For more information see [http://github.com/jnicklas/capybara](http://github.com/jnicklas/capybara)

Capybara Facebook added the method `facecebook_parameters!` to manage the facebook parameters sent with request.

For instance you can add a Cucumber step like this one :

    Given /^I am logged in with Facebook uid "(\d+)"$/ do |facebook_uid|
      facebook_parameters!({ "fb_sig_user" => facebook_uid })
    end

And in your feature :

	Feature: My Feature
		@facebook
		Scenario: My Scenario
			Given I am logged in with Facebook uid "123456"
			When I go to "the homepage"
			Then I should see "Hello"
		

It's important to add the `@facebook` tag before your feature in order to switch on the Facebook Driver.


## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Mathieu Fosse. See LICENSE for details.
