When('I select {string} from the product sort dropdown') do |option|
expect(page).to have_selector('#header_container > div.header_secondary_container > div > span > select > option:nth-child(1)')
end


Then('the second product should be {string}') do |expected_name|
  product_names = all('.inventory_item_name').map(&:text)
  expect(product_names[1]).to eq(expected_name)
end

Then('the third product should be {string}') do |expected_name|
  product_names = all('.inventory_item_name').map(&:text)
  expect(product_names[2]).to eq(expected_name)
end

Then('the last product should be {string}') do |expected_name|
  product_names = all('.inventory_item_name').map(&:text)
  expect(product_names.last).to eq(expected_name)
end

When('I select the {string} option') do |option|
  find('select.product_sort_container').select(option)
end



Then('the products should be sorted in {string} order') do |expected_order|
  product_names = all('.inventory_item_name').map(&:text)
  product_prices = all('.inventory_item_price').map { |price| price.text.delete('$').to_f }

  case expected_order
  when 'alphabetical ascending'
    expect(product_names).to eq(product_names.sort)
    puts "First product: #{product_names.first}"
    puts "Last product: #{product_names.last}"
  when 'alphabetical descending'
    expect(product_names).to eq(product_names.sort.reverse)
    puts "First product: #{product_names.first}"
    puts "Last product: #{product_names.last}"
  when 'price ascending'
    expect(product_prices).to eq(product_prices.sort)
    puts "Cheapest product: #{product_prices.first}"
    puts "Most expensive product: #{product_prices.last}"
  when 'price descending'
    expect(product_prices).to eq(product_prices.sort.reverse)
    puts "Most expensive product: #{product_prices.first}"
    puts "Cheapest product: #{product_prices.last}"
  else
    raise "Unknown order type: #{expected_order}"
  end
end


