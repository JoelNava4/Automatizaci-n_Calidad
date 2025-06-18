require_relative '../pages_objects/inventory_page'
require_relative '../pages_objects/cart_page'

Before do
  @inventory_page = InventoryPage.new
  @cart_page = CartPage.new
end

When('I click on the {string} button for {string}') do |button_text, product_name|
  @inventory_page.click_product_button(product_name, button_text)
end

Then('the {string} button for {string} should change to {string}') do |_label, product_name, expected_text|
  @inventory_page.product_button_should_be(product_name, expected_text)
end

Then('the shopping cart icon should display {string} item') do |count|
  expect(@inventory_page.cart_count).to eq(count)
end

Then('the shopping cart icon should display {string} items') do |count|
  expect(@inventory_page.cart_count).to eq(count)
end

Then('the shopping cart icon should display {string}') do |count|
  expect(@inventory_page.cart_count).to eq(count)
end

Then('the {string} button for {string} should be {string}') do |_label, product_name, expected_text|
  @inventory_page.product_button_should_be(product_name, expected_text)
end

Then('the "Remove" button should be visible for {string}') do |product_name|
  expect(@inventory_page.has_remove_button?(product_name)).to be true
end

Then('the "Add to cart" button should be visible for {string}') do |product_name|
  expect(@inventory_page.has_add_to_cart_button?(product_name)).to be true
end

When('I click on the shopping cart icon') do
  @inventory_page.click_cart_icon
end

Then('I should be on the cart page') do
  expect(@cart_page.on_cart_page?).to be true
end

Then('the cart should contain {string}') do |product_name|
  expect(@cart_page.has_product?(product_name)).to be true
end

When('I add the following products to the cart: {string}') do |products_string|
  products_string.split(',').map(&:strip).each do |product_name|
    @inventory_page.add_product_to_cart(product_name)
  end
end

Then('the cart should contain the following products: {string}') do |products_string|
  products = products_string.split(',').map(&:strip)
  expect(@cart_page.has_all_products?(products)).to be true
end