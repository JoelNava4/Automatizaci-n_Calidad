Feature: Saucedemo Verify Registration

Background:
  Given I am logged into the Saucedemo site
  And I am on the inventory page
    

@checkpoint
Scenario: successfully logout from Saucedemo site
    When I open the side menu
    And I click on the "Logout" link
    Then I should be redirected to the login page

@checkpoint
Scenario: add Sauce Labs Backpack to the cart
    When I click the "Add to cart" button for the "Sauce Labs Backpack"
    Then the shopping cart badge should display "1"

@checkpoint
Scenario: remove Sauce Labs Backpack from the cart
  And I have added the "Sauce Labs Backpack" to the cart
  When I click the "Remove" button for the "Sauce Labs Backpack"
  Then the shopping cart badge should not be visible


