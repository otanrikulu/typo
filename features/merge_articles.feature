Feature: Merge Articles
  As an admin
  In order to gift my thoughts to the world
  I want to merge articles with the same topic and similar content

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


  Scenario: An admin can merge articles
    Given I am logged into the admin panel
    When I follow "All Articles"
    Then I should see "Manage articles"
    When I follow "Star Wars"
    Then I should see "Merge Articles"
    And I should see "Article ID"
    And I should see "Merge"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the edit article "Star Wars" page
    And I should see "successfully merged"

  Scenario: A non-admin cannot merge articles
    Given A publisher user exists
    And I am logged in as publisher
    When I follow "All Articles"
    Then I should see "Manage articles"
    When I follow "Edit"
    Then I should see "Error"
    When I follow "New Article"
    Then I should see "New article"
    And I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles

  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the two original articles)

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article

  Scenario: The title of the new article should be the title from either one of the merged articles

  Scenario: The form field containing the ID of the article to merge with must have the HTML attribute name set to merge_with. This requirement is present for the sole purpose of allowing the autograder to identify the merge functionality in your deployed application and is not something you would normally do in Rails. There should be exactly one input element with the name merge_with on the edit article page


