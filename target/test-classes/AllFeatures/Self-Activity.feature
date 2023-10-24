Feature: Adding new information to the account
  Background:
    Given url BASE_URL
    * def validNewToken = callonce read('GenerateValidToken.feature')
    * def token = "Bearer " + getToken.response.token

    Scenario: Adding a new car to the account
    Given path "/api/accounts/add-account-car"
      When header Authorization = token
      And param primaryPersonId = 200
      And request
      """
      {"make": "Toyota",
  "model": "Supra",
  "year": "2023",
  "licensePlate": "string"
      }
      """
      When method post
      Then status 201
      And print response
