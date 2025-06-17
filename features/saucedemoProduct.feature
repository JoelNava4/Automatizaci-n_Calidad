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

@check
Scenario: Successfully add multiple products to the cart and verify they're in the cart
  When I click on the "Add to cart" button for "Sauce Labs Backpack"
  And I click on the "Add to cart" button for "Sauce Labs Bike Light"
  And I click on the "Add to cart" button for "Sauce Labs Bolt T-Shirt"
  Then the shopping cart icon should display "3" items
  And the "Add to cart" button for "Sauce Labs Backpack" should be "Remove"
  And the "Add to cart" button for "Sauce Labs Bike Light" should be "Remove"
  And the "Add to cart" button for "Sauce Labs Bolt T-Shirt" should be "Remove"
  When I click on the shopping cart icon
  Then I should be on the cart page
  And the cart should contain "Sauce Labs Backpack"
  And the cart should contain "Sauce Labs Bike Light"
  And the cart should contain "Sauce Labs Bolt T-Shirt"




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
