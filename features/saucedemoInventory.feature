Feature: Inventory Page Functionality
As a user
I want to interact with the inventory page
So I can view and manage products

Background:
Given I am logged in as "standard_user" with password "secret_sauce"
And I am on the inventory page

Scenario: Verify inventory page title
Then I should see the page title "Swag Labs"

Scenario: Add one product to the cart
When I click "Add to cart" button for product "Sauce Labs Backpack"
Then the cart icon should display "1"

@smoke
Scenario: View product details
When I click on product "Sauce Labs Backpack"
Then I should be redirected to the product details page for "Sauce Labs Backpack"