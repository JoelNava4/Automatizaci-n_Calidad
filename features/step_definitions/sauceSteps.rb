require_relative '../pages_objects/login_page'
require_relative '../pages_objects/products_page'

login_page = LoginPage.new
products_page = ProductsPage.new

Given('I am on the Saucedemo site') do
  login_page.visit_page
end

Given('I enter my user and password') do
  login_page.fill_username('standard_user')
  login_page.fill_password('secret_sauce')
end

When('I press the {string} button') do |button_text|
  click_button(button_text)
end

Then('I should see the products page') do
  expect(products_page.on_products_page?).to be true
end

Given('I am logged into the Saucedemo site') do
  login_page.login_as('standard_user', 'secret_sauce')
  expect(products_page.on_products_page?).to be true
end

When('I open the side menu') do
  products_page.open_menu
  expect(page).to have_selector('a#logout_sidebar_link', wait: 5)
end

When('I click on the "Logout" link') do
  products_page.click_logout
end

Then('I should be redirected to the login page') do
  expect(login_page.on_login_page?).to be true
end

When('I click the {string} button for the {string}') do |button_text, product_name|
  products_page.click_cart_button(product_name, button_text)
end

Then('the shopping cart badge should display {string}') do |expected_count|
  expect(products_page.cart_badge_count).to eq(expected_count)
end

Then('the shopping cart badge should not be visible') do
  expect(products_page.cart_badge_visible?).to be false
end

Given('I have added the {string} to the cart') do |product_name|
  login_page.login_as('standard_user', 'secret_sauce') unless products_page.on_products_page?
  products_page.add_product(product_name)
end

When('I sort the products by {string}') do |sort_option|
  products_page.select_sort_option(sort_option)
end

Then('the first product should be {string}') do |expected_product|
  expect(products_page.first_product_name).to eq(expected_product)
end