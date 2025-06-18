class InventoryPage
  include Capybara::DSL

  INVENTORY_PATH = /inventory\.html/

  def login(username, password)
    visit 'https://www.saucedemo.com/'
    fill_in 'user-name', with: username
    fill_in 'password', with: password
    click_button 'Login'
  end

  def on_inventory_page?
    page.has_current_path?(INVENTORY_PATH)
  end

  def title
    page.title
  end

  def add_product_to_cart(product_name)
    find('div.inventory_item', text: product_name).click_button('Add to cart')
  end

  def remove_product_from_cart(product_name)
    find('div.inventory_item', text: product_name).click_button('Remove')
  end

  def click_product_button(product_name, button_text)
    find('div.inventory_item', text: product_name).click_button(button_text)
  end

  def product_button_should_be(product_name, expected_text)
    product = find('div.inventory_item', text: product_name)
    raise "Expected button to be #{expected_text}" unless product.has_button?(expected_text)
  end

  def has_remove_button?(product_name)
    find('div.inventory_item', text: product_name).has_button?('Remove')
  end

  def has_add_to_cart_button?(product_name)
    find('div.inventory_item', text: product_name).has_button?('Add to cart')
  end

  def cart_count
    find('.shopping_cart_badge', wait: 5).text
  rescue Capybara::ElementNotFound
    nil
  end

  def cart_has_no_items?
    has_no_css?('.shopping_cart_badge')
  end

  def click_cart_icon
    find('a.shopping_cart_link', match: :first).click
  end

  def open_product_detail(product_name)
    find('div.inventory_item_name', text: product_name).click
  end

  def current_product_name
    find('.inventory_details_name').text
  end
end
