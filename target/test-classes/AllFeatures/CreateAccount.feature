Feature: Creating new accounts here
  Background:
    Given url BASE_URL
    * def validNewToken = callonce read('GenerateValidToken.feature')
    * def usableToken = "Bearer " + validNewToken.response.token

  Scenario: Adding an account with existing email addresses
    Given path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('Data.DataGenerator')
    * def autoEmail = dataGenerator.getEmail()
    And request
    """
    {"email": "#(autoEmail)",
  "firstName": "Elondfas",
  "lastName": "Maskdsf",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "CEO",
  "dateOfBirth": "2023-10-18T23:26:17.746Z"}
    """
    And method post
    Then status 201
    And print response

