Feature: Product sorting functionality  
  As a QA automation student  
  I want to test the product sorting options on Saucedemo  
  So I can understand how to verify that products are ordered correctly by name and price

@check
Scenario: Sort products by Name (A to Z)
  Given I am logged into the Saucedemo site
  And I am on the inventory page
  When I select "Name (A to Z)" from the product sort dropdown
  Then the first product should be "Sauce Labs Backpack"
  And the second product should be "Sauce Labs Bike Light"
  And the third product should be "Sauce Labs Bolt T-Shirt"

@checka
Scenario: Sort products by Name (Z to A)
  Given I am logged into the Saucedemo site
  And I am on the inventory page
  When I select "Name (Z to A)" from the product sort dropdown
  Then the first product should be "Test.allTheThings() T-Shirt (Red)"
  And the last product should be "Sauce Labs Backpack"

@checka
Scenario: Sort products by Price (low to high)
  Given I am logged into the Saucedemo site
  And I am on the inventory page
  When I select "Price (low to high)" from the product sort dropdown
  Then the first product should be "Sauce Labs Onesie"
  And the last product should be "Sauce Labs Fleece Jacket"

@checka
Scenario: Sort products by Price (high to low)
  Given I am logged into the Saucedemo site
  And I am on the inventory page
  When I select "Price (high to low)" from the product sort dropdown
  Then the first product should be "Sauce Labs Fleece Jacket"
  And the last product should be "Sauce Labs Onesie"
