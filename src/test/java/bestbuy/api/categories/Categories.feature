Feature: To Test the Categories API
  As a user i want to test the Categories API.

  Background: Set Basic Configuraions
    Given url "http://localhost:3030"
    * def validationData = read('file:src/test/resources/testdata/validation.json')
    * def categoryValidationData = validationData.Categories

  Scenario: Get all Categories
    Given path "/categories"
    When method GET
    Then status 200
    Then print categoryValidationData
    * def subcategoriesArray = categoryValidationData.data[0].subCategories[0]
    * def categoryPathArray = categoryValidationData.data[0].categoryPath[0]
    * def dataArray = categoryValidationData.data[0]
    * set dataArray.subCategories = "#[] subcategoriesArray"
    * set dataArray.categoryPath = "#[] categoryPathArray"
    * def expectedCategorySchema = categoryValidationData
    * set expectedCategorySchema.data = "#[] dataArray"
    Then match response == expectedCategorySchema

