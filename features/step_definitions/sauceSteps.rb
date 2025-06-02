Given('I am on the Saucedemo site') do
  visit 'https://www.saucedemo.com/'
end
Given('I enter my user and password') do
  fill_in 'user-name', with: 'standard_user'
  fill_in 'password', with: 'secret_sauce' # Write code here that turns the phrase above into concrete actions
end
Then('I should see the products page') do
  expect(page).to have_content('Products')
end


#logout page
Given('I am logged into the Saucedemo site') do
  visit 'https://www.saucedemo.com/'
  fill_in 'user-name', with: 'standard_user'
  fill_in 'password', with: 'secret_sauce'
  click_button 'Login'
  expect(page).to have_content('Products')
end

When('I open the side menu') do
  find('button[id="react-burger-menu-btn"]').click
  expect(page).to have_selector('a#logout_sidebar_link', wait: 5)  # espera explícita
end


When('I click on the "Logout" link') do
  find('a#logout_sidebar_link').click
end

Then('I should be redirected to the login page') do
  expect(page).to have_current_path('https://www.saucedemo.com/', url: true, wait: 5)
end

#añadir al carrito polera

When('I click the {string} button for the {string}') do |button_text, product_name|
  case product_name
  when "Sauce Labs Backpack"
    find('#add-to-cart-sauce-labs-backpack').click
  when "Sauce Labs Bike Light"
    find('#add-to-cart-sauce-labs-bike-light').click
  when "Sauce Labs Bolt T-Shirt"
    find('#add-to-cart-sauce-labs-bolt-t-shirt').click
  when "Sauce Labs Fleece Jacket"
    find('#add-to-cart-sauce-labs-fleece-jacket').click
  else
    raise "Product '#{product_name}' not recognized"
  end# Write code here that turns the phrase above into concrete actions
end

Then('the shopping cart badge should display {string}') do |expected_count|
  badge = find('.shopping_cart_badge').text
  expect(badge).to eq(expected_count) # Write code here that turns the phrase above into concrete actions
end
#quitar del carrito

#validar que el producto ya no esta 
Then('the shopping cart badge should not be visible') do
  expect(page).not_to have_css('.shopping_cart_badge')
end

# agregar al carrito como paso previo
Given('I have added the {string} to the cart') do |product_name|
  # Solo hace login si aún no está en la página de productos
  unless page.has_css?('#inventory_container')
    visit 'https://www.saucedemo.com/'
    fill_in 'user-name', with: 'standard_user'
    fill_in 'password', with: 'secret_sauce'
    click_button 'Login'
    expect(page).to have_content('Products')
  end

  case product_name
  when "Sauce Labs Backpack"
    unless has_css?('#remove-sauce-labs-backpack') # ya está agregado
      find('#add-to-cart-sauce-labs-backpack').click
    end
  else
    raise "Producto '#{product_name}' no reconocido"
  end
end

When('I sort the products by {string}') do |sort_option|
    dropdown = nil
  using_wait_time 10 do
     dropdown = find('select[data-test="product_sort_container"]', visible: true)
  end
    dropdown.select(sort_option)
end


Then('the first product should be {string}') do |expected_product|
  first_product = all('.inventory_item_name').first.text
  expect(first_product).to eq(expected_product)
end

