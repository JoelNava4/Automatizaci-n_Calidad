Feature: Saucedemo Product Interaction and Cart Functionality  
  As a QA automation student  
  I want to test product-related actions on the Saucedemo site  
  So I can understand how to use Capybara for adding items to the cart and verifying their presence

Background:
  Given I am logged into the Saucedemo site
  And I am on the inventory page

@checkpoint
Scenario: Add a single product to the cart
  When I click on the "Add to cart" button for "Sauce Labs Backpack"
    Then the "Add to cart" button for "Sauce Labs Backpack" should change to "Remove"
    And the shopping cart icon should display "1"

@checkpoint
Scenario: Verify the product appears in the cart
 When I click the "Add to cart" button for the "Sauce Labs Backpack"
    Then the shopping cart badge should display "1"
    When I click on the shopping cart icon
    Then I should be on the cart page
    And the cart should contain "Sauce Labs Backpack"

@checkpoint
Scenario Outline: Successfully add multiple products to the cart and verify they are in the cart
  When I add the following products to the cart: "<Products>"
  Then the shopping cart icon should display "<Count>" items
  And the "Remove" button should be visible for "<Products>"
  When I click on the shopping cart icon
  Then I should be on the cart page
  And the cart should contain the following products: "<Products>"
Examples:
  | Products                                                            | Count |
  | Sauce Labs Backpack, Sauce Labs Bike Light, Sauce Labs Bolt T-Shirt | 3     |

@checkpoint
Scenario Outline: Successfully add a product to the cart and verify it's in the cart
  When I click on the "Add to cart" button for "<product>"
  Then the shopping cart icon should display "1" items
  And the "Add to cart" button for "<product>" should be "Remove"
  When I click on the shopping cart icon
  Then I should be on the cart page
  And the cart should contain "<product>"
Examples:
  | product                  |
  | Sauce Labs Backpack      |
  | Sauce Labs Bike Light    |
  | Sauce Labs Bolt T-Shirt  |
