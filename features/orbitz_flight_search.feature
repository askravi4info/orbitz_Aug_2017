Feature: Flight Search Functionality

  Background:
    Given user is on Orbitz home page
    And user selects round trip button under flights tab

    #Imperative
  Scenario: verify the user gets the list of flights available for the dates specified
    When user enter columbus in flying from edit box and selects Columbus, OH option
    When user enter cleveland in flying to edit box and selects Cleveland, OH option
    And user enters future date in Departing edit box
    And user enters future date in Arrival edit box
    And click on search button
    Then verify flight search results page is displayed


  Scenario Outline: verify the user gets the list of airport that matches the city name
    When user enter <dep_city_name> in flying from edit box and selects <dep_airport_name> option
    When user enter <arr_city_name> in flying to edit box and selects <arr_airport_name> option
    And user enters future date in Departing edit box
    And user enters future date in Arrival edit box
    And click on search button
    Then verify flight search results page is displayed

    Examples:
      | dep_city_name | arr_city_name | dep_airport_name | arr_airport_name |
      | columbus      | cleveland     | Columbus, OH     | Cleveland, OH    |
      | chicago       | indianapolis  | Chicago, IL      | Indianapolis, IN |


  Scenario: verify the user is warned when searching for past date flights
#    When user enter columbus in flying from edit box and selects Columbus, OH option
#    When user enter cleveland in flying to edit box and selects Cleveland, OH option
    And user enters past date in Departing edit box
    And user enters past date in Arrival edit box
    And click on search button
    Then user should see the following message
      | error_messages                                           |
      | Please complete the highlighted origin field below.      |
      | Please complete the highlighted destination field below. |
      | The start or end date is prior to the current adate.      |


  Scenario: verify the list of airports displayed should not be more than 5
    When user enter "chicago" in flying from edit box
    Then verify the list of airports count is more than 5


#Declarative
  Scenario: verify the user gets the list of flights available for the date specified
    When user searches for a valid airports for the future date
    And verify the list of airports should match the dates specified

