require_relative '../pages_objects/products_page'

products_page = ProductsPage.new

When('I select {string} from the product sort dropdown') do |option|
  expect(products_page.selected_sort_option(option)).to be true
end

When('I select the {string} option') do |option|
  products_page.select_sort_option(option)
end

Then('the second product should be {string}') do |expected_name|
  expect(products_page.product_names[1]).to eq(expected_name)
end

Then('the third product should be {string}') do |expected_name|
  expect(products_page.product_names[2]).to eq(expected_name)
end

Then('the last product should be {string}') do |expected_name|
  expect(products_page.product_names.last).to eq(expected_name)
end

Then('the products should be sorted in {string} order') do |expected_order|
  names = products_page.product_names
  prices = products_page.product_prices

  case expected_order
  when 'alphabetical ascending'
    expect(names).to eq(names.sort)
    puts "First product: #{names.first}"
    puts "Last product: #{names.last}"
  when 'alphabetical descending'
    expect(names).to eq(names.sort.reverse)
    puts "First product: #{names.first}"
    puts "Last product: #{names.last}"
  when 'price ascending'
    expect(prices).to eq(prices.sort)
    puts "Cheapest product: #{prices.first}"
    puts "Most expensive product: #{prices.last}"
  when 'price descending'
    expect(prices).to eq(prices.sort.reverse)
    puts "Most expensive product: #{prices.first}"
    puts "Cheapest product: #{prices.last}"
  else
    raise "Unknown order type: #{expected_order}"
  end
end
