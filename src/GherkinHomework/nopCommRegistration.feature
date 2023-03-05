Feature: nopCommerce Registration functionality
  As a user I should be able to register on nopCommerce website

  Background: I am on nopCommerce registration page
    Given I open Google Chrome Browser
    When  I open the Url "https://demo.nopcommerce.com/register"
    Then  I am on nopCommerce Registration page

    Scenario Outline: : I should not be able to register with invalid data on mandatory field (*) of registration page
      When I enter my first name in "<firstname>" field
      And I enter my last name in "<lastname>" field
      And I enter email address in "<email>" field
      And I enter password in "<password>" field
      And I enter confirm password in "<confirmpassword>"
      And click on registration button
      Then I can see error message "<errormsg>"
      And  I am not able to register
            Examples:
      |firstname|lastname |email            |password |confirmpassword|errormsg               |
      |""       |vaghela  |hitesh@gmail.com |hitesh123|hitesh123      |Please enter First Name|
      |Hitesh   |""       |hitesh@gmail.com |hitesh123|hitesh123      |Please enter Last Name |
      |Hitesh   |Vaghela  |""               |hitesh123|hitesh123      |Please enter Valid email |
      |Hitesh   |Vaghela  |hitesh@gmail.com |""       |hitesh123      |Password is required |
      |Hitesh   |Vaghela  |hitesh@gmail.com |hitesh123|""             |Confirm Password is required |
      |Hitesh   |Vaghela  |hitesh@gmail.com |hitesh123|nitesh123      |Password and Confirm Password doesn't match |
      |Hitesh   |Vaghela  |hitesh@gmail.com |hit12    |""             |Minimum 6 Character password required |
      |""       |""       |""               |""       |""             |Mandatory fields (*) are required     |

      Scenario: I should be able to select only one radio button from Gender label in your personal details section
        Given 	I am on Gender label of Your personal detail section
        When 	I select "Male" radio button
        And	 	I select "Female" radio button
        Then 	I am able to select any one of the radio button

  Scenario Outline: I should be able to select Day, Month and Year from drop down list of Date of birth field
    Given 	I am on Date of Birth field of Your Personal Detail section
    When  	I select day "<Day>"
    And 	I select month "<Month>"
    And 	I select Year "<Year>"
    Then 	I am able to select Day, Month and year from drop down list

    Examples:
      |Day  |Month    |Year|
      |25	|January  |1975|

  Scenario: I should be able to check and uncheck the Newsletter box on Options section
    Given 	I am on Newsletter label on Options section
    When 	I click on Newsletter checkbox
    And 	I again click on Newsletter Checkbox
    Then 	I was able to check and uncheck the box next to Newsletter label

  Scenario: I should be able to register with valid mandatory (*) field data on registration page
    When 	I enter First name "Hitesh"
    And	 	I enter Last name "Vaghela"
    And 	I enter Email "hitesh@gmail.com"
    And 	I enter Password "123456"
    And 	I enter Confirm Password "123456"
    And 	I click on Register button
    Then 	I was able to register successfully

