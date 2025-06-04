Given('I am on the inventory page') do
  expect(page).to have_current_path('https://www.saucedemo.com/inventory.html', url: true)
end

When('I click on the {string} button for {string}') do |button_text, product_name|
    sleep 3 # Espera para que el botón esté disponible
  product = find('.inventory_item', text: product_name)
  product.click_button(button_text)
end

Then('the {string} button for {string} should change to {string}') do |_, product_name, expected_text|
sleep 3 # Espera para que el botón cambie de estad
  product = find('.inventory_item', text: product_name)
  expect(product).to have_button(expected_text)
end

Then('the shopping cart icon should display {string} item') do |count|
    sleep 3
  expect(find('.shopping_cart_badge').text).to eq(count)
end

Then('the shopping cart icon should display {string} items') do |count|
     sleep 3
  expect(find('.shopping_cart_badge').text).to eq(count)
end

When('I click on the shopping cart icon') do
  # Aceptar alerta del navegador si está presente
  begin
     sleep 3
    alert = page.driver.browser.switch_to.alert
    puts "Alerta detectada: #{alert.text}"
    alert.accept
  rescue Selenium::WebDriver::Error::NoSuchAlertError
    puts "No se detectó ninguna alerta"
  end

  # Ahora clic en el ícono del carrito
  find('a.shopping_cart_link', match: :first).click
  expect(page).to have_current_path(/cart\.html/, wait: 5)
end

Then('I should be on the cart page') do
     sleep 3
     expect(page).to have_current_path(/cart\.html/, wait: 5)
end

Then('the cart should contain {string}') do |product_name|
     sleep 3
  expect(page).to have_css('.inventory_item_name', text: product_name)
end

Then('the {string} button for {string} should be {string}') do |_, product_name, expected_text|
  product = find('.inventory_item', text: product_name)
  expect(product).to have_button(expected_text)
end

Then('the shopping cart icon should display {string}') do |count|
  expect(find('.shopping_cart_badge').text).to eq(count)
end

When('I add the following products to the cart: {string}') do |products_string|
  products_string.split(',').map(&:strip).each do |product_name|
    find('.inventory_item_name', text: product_name).ancestor('.inventory_item').click_button('Add to cart')
  end
end

Then('the cart should contain the following products: {string}') do |products_string|
  products_string.split(',').map(&:strip).each do |product_name|
    expect(page).to have_css('.inventory_item_name', text: product_name)
  end
end

#escenarios mas expresivos
#añadir mas validaciones
#