Feature: Saucedemo Verify Registration

@checkpoint
Scenario: successfully login on Saucedemo site
    Given I am on the Saucedemo site
    And I enter my user and password
    When I press the "login" button
    Then I should see the products page

@checkpoint
Scenario: successfully logout from Saucedemo site
    Given I am logged into the Saucedemo site
    When I open the side menu
    And I click on the "Logout" link
    Then I should be redirected to the login page

@checkpoint
Scenario: add Sauce Labs Backpack to the cart
    Given I am logged into the Saucedemo site
    When I click the "Add to cart" button for the "Sauce Labs Backpack"
    Then the shopping cart badge should display "1"

@check
Scenario: remove Sauce Labs Backpack from the cart
  Given I am logged into the Saucedemo site
  And I have added the "Sauce Labs Backpack" to the cart
  When I click the "Remove" button for the "Sauce Labs Backpack"
  Then the shopping cart badge should not be visible


