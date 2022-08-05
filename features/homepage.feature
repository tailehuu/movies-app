@javascript
Feature: Home page
  Scenario: Can see a list of movies
    When I go to Home page
    Then I can see "Funny Movies" brand name
