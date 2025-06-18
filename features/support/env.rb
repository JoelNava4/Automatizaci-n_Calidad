begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'webdrivers' # <--- Esta línea es esencial


#PTravel Settings
ENV['USER']="Pepazo"
ENV['PSW']="ILoveQA"

Capybara.default_driver = :selenium

# Set the host the Capybara tests should be run against
Capybara.app_host = ENV["CAPYBARA_HOST"]

# Set the time (in seconds) Capybara should wait for elements to appear on the page
Capybara.default_max_wait_time = 15
Capybara.default_driver = :selenium_chrome
Capybara.app_host = "https://www.saucedemo.com/"

Capybara.register_driver :chrome do |app|Add commentMore actions
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--disable-features=PasswordLeakDetection')
  options.add_argument('--no-default-browser-check')
  options.add_argument('--no-first-run')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-notifications')
  options.add_argument('--incognito')
  options.add_argument('--start-maximized')
  options.add_argument('--disable-gpu') # Para evitar problemas en algunos sistemas

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
# Register various Selenium drivers
#CapybaraDriverRegistrar.register_selenium_driver(:internet_explorer)
#CapybaraDriverRegistrar.register_selenium_driver(:firefox)
Capybara.default_driver = :selenium_chrome
Capybara.run_server = false
#World(Capybara)

