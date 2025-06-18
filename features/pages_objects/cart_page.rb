class CartPage
  include Capybara::DSL

  CART_PATH = /cart\.html/

  def on_cart_page?
    page.has_current_path?(CART_PATH, wait: 5)
  end

  def has_product?(product_name)
    page.has_css?('.inventory_item_name', text: product_name)
  end

  def has_all_products?(product_list)
    product_list.all? { |product| has_product?(product) }
  end
end
