Feature:  Gmail Login Funcationality

  Background: User navigate to Gmail Longin page
    Given     User is on Gmail login Page

  Scenario: User should be able to login with valid login credential
    When User enter "hitesh@gmail.com" into username field
    And  User enter "hitesh123" into password field
    And  User click on login button
    Then User is logged into Gmail account successfully

  Scenario Outline: User should be able to login with invalid credential
    When  User enter "<username>" into username field
    And   User enter "<password>" into password field
    And   User click on login button
    Then  User should not be able to login ito Gmail account
    And   Error message "<errormsg>" should be displayed

    Examples:
      | username         | password  | errormsg                                 |
      | nitesh@gmail.com | hitesh123 | Username does not exist                  |
      | hitesh@gmail.com | nitesh123 | Password is incorrect                    |
      | ""               | hitesh123 | Please enter valid username              |
      | hitesh@gmail.com | ""        | Please enter valid password              |
      | nitesh@gmail.com | nitesh123 | Please enter valid username and password |
      | ""               | ""        | Please enter username and password       |




