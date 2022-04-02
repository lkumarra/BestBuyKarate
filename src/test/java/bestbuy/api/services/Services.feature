Feature: To Test Services API
  As a user i want to test services API.

  Background: SetUp Basic Configurations
    Given url "http://localhost:3030"
    * def validationData = read('file:src/test/resources/testdata/validation.json')
    * def servicesData = validationData.Services

  Scenario: Get all Services
    Given path "/services"
    When method GET
    Then status 200
    And print servicesData
    * def dataArray = servicesData.data[0]
    * def expectedServicesSchema = servicesData
    * set expectedServicesSchema.data = "#[] dataArray"
    And match response == expectedServicesSchema
