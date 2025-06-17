Feature: Product sorting functionality  
  As a QA automation student  
  I want to test the product sorting options on Saucedemo  
  So I can understand how to verify that products are ordered correctly by name and price

Background:
  Given I am logged into the Saucedemo site
  And I am on the inventory page


Scenario: Sort products by Name (A to Z)
  When I select "Name (A to Z)" from the product sort dropdown
  Then the first product should be "Sauce Labs Backpack"
  And the second product should be "Sauce Labs Bike Light"
  And the third product should be "Sauce Labs Bolt T-Shirt"


Scenario Outline: Filter products by different criter
  When I select the "<filter>" option
  Then the products should be sorted in "<expectedOrder>" order
  Examples: Filter types
    | filter              | expectedOrder           |
    | Name (A to Z)       | alphabetical ascending  |
    | Name (Z to A)       | alphabetical descending |
    | Price (low to high) | price ascending         |
    | Price (high to low) | price descending        |





