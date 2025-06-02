Feature: Swag Labs Login Page
  As a QA automation student
  I want to test the Swag Labs login page
  So I can learn to use Capybara for login scenarios

@maximize
Scenario: Login with empty username and password
  Given I am on the Swag Labs login page
  When I leave username and password empty
  And I press the "Login" button on Swag Labs
  Then I should see the error message "Epic sadface: Username is required"

@maximize
Scenario: Login with valid standard_user credentials
  Given I am on the Swag Labs login page
  When I enter "standard_user" as username
  And I enter "secret_sauce" as password
  And I press the "Login" button on Swag Labs
  Then I should be redirected to the inventory page

@maximize
Scenario Outline: Login with multiple valid users
  Given I am on the Swag Labs login page
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
