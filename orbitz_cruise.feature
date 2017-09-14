Feature: Orbitz Cruise Functionality - 32424

  Background:
    Given user is on Orbitz home page
    And user selects round trip button under flights tab

    #Imperative
  Scenario: verify the user gets the list of cruise available for the dates specified
    When user enter columbus in flying from edit box and selects Columbus, OH option
    When user enter cleveland in flying to edit box and selects Cleveland, OH option
    And user enters future date in Departing edit box
    And user enters future date in Arrival edit box
    And click on search button
    Then verify flight search results page is displayed

