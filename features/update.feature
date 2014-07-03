@disable-bundler
Feature: Update sassinox files

  Scenario: Updating updates an existing sassinox installation
    Given sassinox is already installed
    When I write to "sassinox/_sassinox.scss" with:
      """
      foobar
      """
    And I run `bundle exec sassinox update`
    Then the output should contain "Sassinox files updated."
    And the file "sassinox/_sassinox.scss" should not contain "foobar"

  Scenario: Updating with a --path option
    Given I install sassinox to "custom_path"
    When I write to "custom_path/sassinox/_sassinox.scss" with:
      """
      foobar
      """
    And I run `bundle exec sassinox update`
    Then the output should contain "No existing sassinox installation found, doing nothing."

    When I run `bundle exec sassinox update --path=custom_path`
    Then the output should contain "Sassinox files updated."
    And the file "custom_path/sassinox/_sassinox.scss" should not contain "foobar"

  Scenario: Updating does not generate a new sassinox install
    And I run `bundle exec sassinox update`
    Then sassinox should not have been generated
    And the output should contain "No existing sassinox installation found, doing nothing."
