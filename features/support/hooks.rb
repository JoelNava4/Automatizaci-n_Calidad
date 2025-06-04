
After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

Before('@checkpoint') do
  visit 'https://www.saucedemo.com/'
  fill_in 'user-name', with: 'standard_user'
  fill_in 'password', with: 'secret_sauce'
  click_button 'Login'
  expect(page).to have_current_path('/inventory.html')
end