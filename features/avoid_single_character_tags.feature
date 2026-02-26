@avoid_single_character_tags
Feature: Avoid single string tag names

  As a tester
  I want to avoid single strings in tag names
  So that I can have more meaningful tags

  Background:
    Given chutney is configured with the linter "Chutney::AvoidSingleCharacterTags"

  Scenario: Avoid single character tags
    And a feature file contains:
      """
      @t
      Feature: Test
        Scenario: A
      """
    When I run Chutney
    Then 1 issue is raised
    And the message is:
      """
      Avoid using single character tags. Tags should have meaning.
      """
    And it is reported on:
      | line | column |
      | 2    | 1      |

  Scenario: Avoid single character tags: 2 singular letter tags
    And a feature file contains:
      """
      @a @b
      Feature: Test
        Scenario: B
      """
    When I run Chutney
    Then 1 issue is raised
    And the message is:
      """
      Avoid using single character tags. Tags should have meaning.
      """
    And it is reported on:
      | line | column |
      | 2    | 1      |

  Scenario: Avoid single character tags: Normal tag
    And a feature file contains:
      """
      @tag
      Feature: Test
        Scenario: C
      """
    When I run Chutney
    Then 0 issues are raised