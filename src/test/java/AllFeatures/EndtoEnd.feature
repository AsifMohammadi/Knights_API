Feature: End to end account creation
  Background:
    Given url BASE_URL
    * def getToken = callonce read('GenerateValidToken.feature')
    * def token = "Bearer " + getToken.response.token

  Scenario: Doing all in once scenario
   Given path "api/accounts/add-primary-account"
    * def data = Java.type('Data.DataGenerator')
    * def email = data.getEmail()
    And request
    """
    {"email": "#(email)",
  "firstName": "Elon",
  "lastName": "Mask",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "CEO",
  "dateOfBirth": "2023-10-18T23:26:17.746Z"}
    """
    When method post
    Then status 201
    And print response
