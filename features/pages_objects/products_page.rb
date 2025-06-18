class ProductsPage
  include Capybara::DSL

  PRODUCT_IDS = {
    "Sauce Labs Backpack" => "sauce-labs-backpack",
    "Sauce Labs Bike Light" => "sauce-labs-bike-light",
    "Sauce Labs Bolt T-Shirt" => "sauce-labs-bolt-t-shirt",
    "Sauce Labs Fleece Jacket" => "sauce-labs-fleece-jacket"
  }.freeze

  def on_products_page?
    page.has_content?('Products')
  end

  def select_sort_option(option)
    find('select.product_sort_container', visible: true).select(option)
  end

  def selected_sort_option?(option)
    has_selector?(
      '#header_container > div.header_secondary_container > div > span > select > option',
      text: option
    )
  end

  def product_names
    all('.inventory_item_name').map(&:text)
  end

  def product_prices
    all('.inventory_item_price').map { |price| price.text.delete('$').to_f }
  end

  def first_product_name
    all('.inventory_item_name').first.text
  end

  def add_product(product_name)
    id = product_id(product_name)
    find("#add-to-cart-#{id}").click unless has_css?("#remove-#{id}")
  end

  def remove_product(product_name)
    id = product_id(product_name)
    find("#remove-#{id}").click if has_css?("#remove-#{id}")
  end

  def click_cart_button(product_name, action)
    id = product_id(product_name)
    button_id = case action
                when "Add to cart" then "add-to-cart-#{id}"
                when "Remove" then "remove-#{id}"
                else raise "Acción '#{action}' no reconocida"
                end

    find("##{button_id}").click
  end

  def cart_badge_visible?
    has_css?('.shopping_cart_badge')
  end

  def cart_badge_count
    find('.shopping_cart_badge').text
  end

  def open_menu
    find('button[id="react-burger-menu-btn"]').click
  end

  def click_logout
    find('a#logout_sidebar_link').click
  end

  private

  def product_id(name)
    PRODUCT_IDS[name] || (raise "Producto '#{name}' no reconocido")
  end
end
