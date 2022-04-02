Feature: To Test Stores API
  As a user i wants to test stores api

  Background: Set Basic Configuration
    Given url "http://localhost:3030"
    * def validationData = read('file:src/test/resources/testdata/validation.json')
    * def storesData = validationData.Stores

  Scenario: Get all Services
    Given path "/stores"
    When method GET
    Then status 200
    And print storesData
    * def servicesArray = storesData.data[0].services[0]
    * def dataArray = storesData.data[0]
    * set dataArray.services = "#[] servicesArray"
    * def expectedServicesSchema = storesData
    * set expectedServicesSchema.data = "#[] dataArray"
    And match response == expectedServicesSchema
