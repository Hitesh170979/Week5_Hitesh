Feature: Book Category
  Background: I should be able to see homepage
    Given I enter utl "https://demo.mopcommerce.com/" in browser
    And   I am on home page

  Scenario Outline: I should be able to see top menu tabs on homepage with categories
    When I am on Home Page
    Then I should be able to see top menu tabs with "<categories>"

    Examples:
    |categories|
    |Computers |
    |Electronics|
    |Apparel    |
    |Digital Downloads |
    |Books             |
    |Jewellery         |
    |Gift card         |

    Scenario Outline: I should be able to see book page with filters
      When I select book category from top menu tabs from home page
      Then I should be navigated to book category
      And  I should be able to see "<filers>"

      Examples:
      |filers|
      |Short By|
      |Display  |
      |The Grid |
      |List Tab |

      Scenario Outline: I should be able to see list of terms of each filers
        Given I am on home page
        When I click on "<filters>"
        Then  I should be able to see "<list>" in dropdown menu

        Examples:
        |filters|list|
        |Short By|Name: A to Z, Name: Z To A, Price: Low to High, Price: High to Low, Created on|
        |Display |3,6,9                                                                         |

        Scenario Outline: I should be able to choose any filter option with specific result
          Given I am on book page
          When I click on "<filters>"
          And   I click on any "<option>"
          Then I should be able to choose any filter option from the list
          And I should be able to see "<result>"

          Examples:
          |filters            |option                      |result                                                          |
          |Short By           | Name: A to Z               |Short product with the product name in alphabetical order A to Z|
          |Sort by            | Name:Z to A                | sorted product with the product name in alphabetical order Z to A  |
          |Sort by            | price:low to high          | sorted product with the price in descending order                  |
          |Sort by            | price:High to low          | sorted product  with the price in ascending order                  |
          |Sort By            | Creaded On                 | Recently added product should be show first                       |
          |Display            | 3                          | 3 prodcut in a page                                               |
          |Display            | 6                          | 6 products in a page                                               |
          |Display            | 9                          | 9 products in a page                                               |

  Scenario Outline:  I should be able to see product display format according to display format type as per given picture in srs document

    Given  I am on book page
    When   I click on "<DisplayFormatIcon>"
    Then   I should be able to see  prodcut display format according display format type as per given picture in SRS document

    Examples:
      | DisplayFormatIcon  |
      | Grid               |
      | List               |


