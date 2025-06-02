When('I select {string} from the product sort dropdown') do |option|
  handle_browser_alert # por si una alerta interrumpe
  expect(page).to have_selector('[data-test="product_sort_container"]', visible: true, wait: 10)
  find('[data-test="product_sort_container"]').select(option)
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

def handle_browser_alert
  begin
    sleep 1
    alert = page.driver.browser.switch_to.alert
    puts "Alerta detectada: #{alert.text}"
    alert.accept
  rescue Selenium::WebDriver::Error::NoAlertOpenError, Selenium::WebDriver::Error::NoSuchAlertError
    puts "No se detectó ninguna alerta"
  end
end
