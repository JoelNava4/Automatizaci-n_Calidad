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

