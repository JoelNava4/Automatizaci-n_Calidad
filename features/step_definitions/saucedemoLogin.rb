Given(/^I am on the Swag Labs login page$/) do
    page.driver.browser.manage.window.maximize
    visit('https://www.saucedemo.com/')
  end
  
  When(/^I enter "([^"]*)" as username$/) do |username|
    fill_in 'user-name', with: username
  end
  
  When(/^I enter "([^"]*)" as password$/) do |password|
    fill_in 'password', with: password
  end
  
  When(/^I press the "([^"]*)" button on Swag Labs$/) do |button_text|
    click_button button_text
  end
  
  When(/^I leave username and password empty$/) do
    fill_in 'user-name', with: ''
    fill_in 'password', with: ''
  end
  
  Then(/^I should see the error message "([^"]*)"$/) do |expected_message|
    actual_message = find('.error-message-container').text
    expect(actual_message).to include(expected_message)
  end
  
  Then(/^I should be redirected to the inventory page$/) do
    expect(page).to have_current_path('https://www.saucedemo.com/inventory.html', url: true)
    puts "Login successful and redirected to inventory page."
  end
  
When('I press the {string} button') do |button_text|
find('#login-button').click
end
