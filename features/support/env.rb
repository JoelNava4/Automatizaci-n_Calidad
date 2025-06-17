begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'

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

class CapybaraDriverRegistrar
  # Register a Selenium driver for the given browser to run on the localhost
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
   
      options = case browser
                when :chrome
                  Selenium::WebDriver::Chrome::Options.new.tap do |opts|
                    opts.add_argument('--incognito')
                    opts.add_argument('--disable-popup-blocking') # Para pruebas, esto a veces ayuda a que no se bloqueen nuestros propios pop-ups
                    opts.add_argument('--disable-notifications') # Bloquea notificaciones tipo navegador
                    opts.add_argument('--disable-infobars') # Elimina el mensaje de "Chrome is being controlled by automated test software"
                    opts.add_argument('--disable-extensions') # Por si alguna extensión genera alertas
                    opts.add_argument('--disable-translate') # Evita alertas de traducción
                    opts.add_preference('profile.default_content_setting_values.notifications', 2) # Bloquea notificaciones del sitio
                    opts.add_preference('profile.default_content_setting_values.automatic_downloads', 1)
                    opts.add_preference('profile.default_content_setting_values.popups', 2)
                    opts.add_preference('credentials_enable_service', false)
                    opts.add_preference('profile.password_manager_enabled', false)

                  end
                when :firefox
                  Selenium::WebDriver::Firefox::Options.new.tap do |opts|
                    opts.add_argument('-private')
                  end
                else
                  raise ArgumentError, "Unsupported browser: #{browser}"
                end

      Capybara::Selenium::Driver.new(app, browser: browser, options: options)
    end
  end
end

# Register various Selenium drivers
#CapybaraDriverRegistrar.register_selenium_driver(:internet_explorer)
#CapybaraDriverRegistrar.register_selenium_driver(:firefox)
CapybaraDriverRegistrar.register_selenium_driver(:chrome)
Capybara.run_server = false
#World(Capybara)

