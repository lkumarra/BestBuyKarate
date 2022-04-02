Feature: To Test the Product API
  As a user i want to test the Product API.

  Background: Set Basic Configuration
    Given url "http://localhost:3030"
    * def inputData = read('file:src/test/resources/testdata/validation.json')
    
  Scenario: Get all Products
    Given path "/products"
    When method GET
    Then status 200
    Then print inputData
    * def categoriesArray = inputData.Products.data[0].categories[0]
    * def dataArray = inputData.Products.data[0]
    * def expectedSchema = inputData.Products
    * set dataArray.categories = "#[] categoriesArray"
    * set expectedSchema.data = "#[] dataArray"
    * print expectedSchema
    And match response == expectedSchema
