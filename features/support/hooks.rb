
After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end


Before('@clean_session') do
  page.driver.browser.manage.delete_all_cookies
end

