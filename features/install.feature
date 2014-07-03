@disable-bundler
Feature: Install sassinox files

  Scenario: Sassinox generates a new sassinox installation
    When I run `bundle exec sassinox install`
    Then the sass directories should have been generated
    And the following directories should exist:
      | sassinox |
    And the master sassinox partial should have been generated
    And the output should contain "Sassinox files installed to sassinox/"


    Scenario: Generating does not overwrite an existing sassinox directory
      Given sassinox is already installed
      When I run `bundle exec sassinox install`
      Then the output should contain "Sassinox files already installed, doing nothing."

    Scenario: Install Sassinox into a custom path
      When I run `bundle exec sassinox install --path=custom_path`
      Then the sass directories with "custom_path" prefix should have been generated
      And the following directories should exist:
        | custom_path/sassinox |
      And the master sassinox partial should have been generated within "custom_path" directory
      And the output should contain "Sassinox files installed to custom_path/sassinox/"

    Scenario: Forcing install of Sassinox
      Given sassinox is already installed
      When I run `bundle exec sassinox install --force`
      Then the output from "bundle exec sassinox install --force" should contain "Sassinox files installed to sassinox/"
      And the output should not contain "Sassinox files already installed, doing nothing."
