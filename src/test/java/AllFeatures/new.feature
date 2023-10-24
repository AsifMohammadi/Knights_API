Feature: Verifying the plan codes

  Background: Setup tests
    Given url BASE_URL



    Scenario: Get account with primaryPersonId does not exist
      * def newToken = callonce read('GenerateValidToken.feature')
      * def validToken = "Bearer "+newToken.response.token
      Given path "/api/accounts/get-account"
      And param primaryPersonId = 45000
      And header Authorization = validToken
      When method get
      Then status 404
      And print response
      Then assert response.httpStatus == "NOT_FOUND"