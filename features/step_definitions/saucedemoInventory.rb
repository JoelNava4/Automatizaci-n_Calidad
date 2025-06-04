require 'capybara/cucumber'
require 'selenium-webdriver'

# Step Definitions para Inventory Feature

Given('I am logged in as {string} with password {string}') do |username, password|
  visit 'https://www.saucedemo.com/'
  fill_in 'user-name', with: username
  fill_in 'password', with: password
  click_button 'Login'
end

Given('I am on the inventory page') do
  expect(page).to have_current_path(/inventory\.html/)
end

Then('I should see the page title {string}') do |title|
  expect(page.title).to eq(title)
end

When('I click "Add to cart" button for product {string}') do |product_name|
  product = find('div.inventory_item', text: product_name)
  product.click_button('Add to cart')
end

When('I click "Remove" button for product {string}') do |product_name|
  product = find('div.inventory_item', text: product_name)
  product.click_button('Remove')
end

Then('the cart icon should display {string}') do |count|
  badge = find('.shopping_cart_badge')
  expect(badge.text).to eq(count)
end

Then('the cart icon should not be visible') do
  expect(page).not_to have_css('.shopping_cart_badge')
end

When('I click on product {string}') do |product_name|
  find('div.inventory_item_name', text: product_name).click
end

Then('I should be redirected to the product details page for {string}') do |product_name|
  title = find('.inventory_details_name')
  expect(title.text).to eq(product_name)
end
