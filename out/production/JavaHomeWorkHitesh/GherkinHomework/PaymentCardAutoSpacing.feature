Feature: Credit Card and Debit Card Number Auto Spacing
          As a user I should be able to view credit card and debit card auto spacing once I enter the card number
  Background: User is on payment page
    Given I am on Google Chrome Browser
    When  I enter url https://www.Tesco.com
    And   I am able to login successfully
    Then  I am on payment page
    And   I am on card number field

  Scenario Outline: User should be able to enter Valid Visa card number with Autospacing
    When  I enter Visa Card Number "<VisaCardNumber>"
    And   I enter expiry date "<ExpiryDate>"
    And   I enter CVV "<CVV>"
    And   I click on pay button
    Then  I am able to see the Visa card number with Auto Spacing <"AutoSpacing">
    And   I was able to see message "Payment Successful"


      Examples:
    |VisaCardNumber   |ExpiryDate     |CVV    |AutoSpacing      |
    |4135698745623    |10/25          |123    |4135 6987 45623  |
    |4365489789632146 |06/ 24         |968    |4365 4897 8963 2146|

  Scenario Outline: User should be able to enter invalid card number with autospacing
    When  I enter visa card number "<VisaCardNumber>"
    And   I enter expiry date "<ExpiryDate">
    And   I enter CVV "<CVV>"
    And   I click on pay button
    Then  I am able to see error message "<ErrorMessage>"

    Examples:
    |VisaCardNumber     |ExpiryDate     |CVV    |ErrorMessage       |
    |413569874562       |10/25          |123    |too small number   |
    |436548978963214625 |06/24          |968    |too big number     |
    |0000000000000000   |00/00          |000    |invalid card details|

    Scenario Outline: User should be able to enter valid master card number with autospacing
      When  I enter master card number "<MasterCardNumber>"
      And   Enter Expiry date "<ExpiryDate>"
      And   Enter CVV "<CVV>"
      And   I click on pay button
      Then  I enter the master card number with autospacing at 4th, 8th and 12th number
      And   I am able to see message "Payment Successful"

      Examples:
      |MasterCardNumber  |ExpiryDate |CVV|
      |5123654789658746  |10/25      |569|
      |5236987896548965  |06/24      |968|
      |5369874562147895  |07/23      |874|
      |5478965412369874  |08/24      |456|
      |5587963214569832  |09/22	     |234|
