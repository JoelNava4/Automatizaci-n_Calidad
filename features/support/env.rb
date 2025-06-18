require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  # Evitar advertencias de seguridad y ventanas emergentes
  options.add_argument('--disable-features=PasswordLeakDetection')
  options.add_argument('--no-default-browser-check')
  options.add_argument('--no-first-run')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-notifications')
  options.add_argument('--incognito')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :chrome
Capybara.default_max_wait_time = 5