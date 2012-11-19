require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

And /^A (.*) user exists$/ do |username|
  
  User.create!({:login => 'user53',
                :password => 'test1',
                :email => 'joe1@snow.com',
                :profile_id => 1,
                :name => 'publisher',
                :state => 'active'})
end

And /^I am logged in as publisher$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user53'
  fill_in 'user_password', :with => 'test1'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
