Feature: Define Categories
  As an admin
  In order to help blog readers easily find what they are looking for
  I want to define categories for articles

  Background:
    Given the blog is set up
    And the following articles exist:
#      | id | type    | title        | author       | published_at |
#      | 1  | Article | Star Wars    | George Lucas |   1977-05-25 |
#      | 2  | Article | Blade Runner | Ridley Scott |   1982-06-25 |
#      | 3  | Article | Alien        |              |   1979-05-25 |
#      | 4  | Article | THX-1138     | George Lucas |   1971-03-11 |

      | id | title        | author       | published_at |
      | 1  | Star Wars    | George Lucas |   1977-05-25 |
      | 2  | Blade Runner | Ridley Scott |   1982-06-25 |
      | 3  | Alien        |              |   1979-05-25 |
      | 4  | THX-1138     | George Lucas |   1971-03-11 |


  Scenario: An admin can create or edit categories
    Given I am logged into the admin panel
    When I follow "Categories"
    Then I should see "Categories"
