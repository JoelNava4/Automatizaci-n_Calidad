Feature: Swag Labs Login
  As a user
  I want to test valid and invalid login scenarios
  So I can ensure the login process works as expected

  Background:
    Given I am on the Swag Labs login page

  @maximize
  Scenario: Login with empty username and password
    When I leave username and password empty
    And I press the "Login" button on Swag Labs
    Then I should see the error message "Epic sadface: Username is required"

  @maximize
  Scenario: Login with valid standard_user credentials
    When I enter "standard_user" as username
    And I enter "secret_sauce" as password
    And I press the "Login" button on Swag Labs
    Then I should be redirected to the inventory page
  
  @maximize
  Scenario Outline: Login with multiple valid users
    When I enter "<username>" as username
    And I enter "secret_sauce" as password
    And I press the "Login" button on Swag Labs
    Then I should be redirected to the inventory page

    Examples:
      | username                |
      | standard_user           |
      | problem_user            |
      | performance_glitch_user |
      | visual_user             |