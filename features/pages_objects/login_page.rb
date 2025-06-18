class LoginPage
  include Capybara::DSL

  LOGIN_URL = 'https://www.saucedemo.com/'.freeze
  INVENTORY_URL = 'https://www.saucedemo.com/inventory.html'.freeze

  def visit_page
    visit LOGIN_URL
  end

  def fill_username(username)
    fill_in 'user-name', with: username
  end

  def fill_password(password)
    fill_in 'password', with: password
  end

  def click_login
    click_button 'Login'
  end

  def login_as(username, password)
    visit_page
    fill_username(username)
    fill_password(password)
    click_login
  end

  def error_message
    find('.error-message-container', wait: 5).text
  end

  def on_login_page?
    page.has_current_path?(LOGIN_URL, url: true)
  end

  def on_inventory_page?
    page.has_current_path?(INVENTORY_URL, url: true)
  end
end
