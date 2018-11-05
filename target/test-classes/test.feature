Feature: check for the weather of the given city

  Background:
    * url 'http://dummy.restapiexample.com/api/v1'

  Scenario: Check the status of the request
    #Given url 'http://dummy.restapiexample.com/api/v1/employees'
    Given path '/employees'
    When method get
    Then status 200

  Scenario: check if the exact record is retrieved from the api
    Given path 'employee/35'
    When method get
    Then status 200
    And match $.id == '35'

    #TodO: check on how to get the ID returned in the response to a variable
  Scenario: To add a record to the DB
    Given path '/create'
    And request {"name":"Sud","salary":"123","age":"23"}
    When method POST
    Then status 200
    And match $.name == "Sud"
    And match response == {name:'Sud',salary:'123',age:'23', "id": '#notnull'}

#ToDO: to update the record based on the ID we got from the previous request
#    Scenario: To update a record
#      Given path '/update'
#      And request {"name":"Sud","salary":"123","age":"25"}
#      When method PUT
#      Then status 200

  #ToDO: to delete the record that was added earlier
    #Scenario: To delete a record in the DB
     # Given path '/update'
      #When method DELETE
