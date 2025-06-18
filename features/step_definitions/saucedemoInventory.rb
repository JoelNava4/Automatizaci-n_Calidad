require_relative '../pages_objects/inventory_page'

inventory_page = InventoryPage.new

Given('I am logged in as {string} with password {string}') do |username, password|
  inventory_page.login(username, password)
end

Given('I am on the inventory page') do
  expect(inventory_page.on_inventory_page?).to be true
end

Then('I should see the page title {string}') do |expected_title|
  expect(inventory_page.title).to eq(expected_title)
end

When('I click "Add to cart" button for product {string}') do |product_name|
  inventory_page.add_product_to_cart(product_name)
end

When('I click "Remove" button for product {string}') do |product_name|
  inventory_page.remove_product_from_cart(product_name)
end

Then('the cart icon should display {string}') do |count|
  expect(inventory_page.cart_count).to eq(count)
end

Then('the cart icon should not be visible') do
  expect(inventory_page.cart_has_no_items?).to be true
end

When('I click on product {string}') do |product_name|
  inventory_page.open_product_detail(product_name)
end

Then('I should be redirected to the product details page for {string}') do |product_name|
  expect(inventory_page.current_product_name).to eq(product_name)
end
