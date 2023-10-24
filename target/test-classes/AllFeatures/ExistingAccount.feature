Feature: Adding new account

  Background:
    Given url BASE_URL
    * def validNewToken = callonce read('GenerateValidToken.feature')
    * def usableToken = "Bearer " + validNewToken.response.token
  Scenario: Adding an account with existing email addresses
    Given path "/api/accounts/add-primary-account"
    When header Authorization = usableToken
    * def email = "someone@some.com"
    And request
    """
    {"email": "someone@some.com",
  "firstName": "Elon",
  "lastName": "Mask",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "CEO",
  "dateOfBirth": "2023-10-18T23:26:17.746Z"}
    """
    And method post
    Then status 400
    Then assert response.httpStatus == "BAD_REQUEST"
    Then assert response.errorMessage == "Account with email someone@some.com is exist"

