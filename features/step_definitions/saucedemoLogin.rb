require_relative '../pages_objects/login_page'

login_page = LoginPage.new

Given(/^I am on the Swag Labs login page$/) do
  page.driver.browser.manage.window.maximize
  login_page.visit_page
end

When(/^I enter "([^"]*)" as username$/) do |username|
  login_page.fill_username(username)
end

When(/^I enter "([^"]*)" as password$/) do |password|
  login_page.fill_password(password)
end

When(/^I press the "([^"]*)" button on Swag Labs$/) do |_|
  login_page.click_login
end

When(/^I leave username and password empty$/) do
  login_page.fill_username('')
  login_page.fill_password('')
end

Then(/^I should see the error message "([^"]*)"$/) do |expected_message|
  expect(login_page.error_message).to include(expected_message)
end

Then(/^I should be redirected to the inventory page$/) do
  expect(login_page.on_inventory_page?).to be true
  puts "Login successful and redirected to inventory page."
end
