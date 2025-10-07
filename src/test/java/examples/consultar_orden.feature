Feature: Consultas y validaciones de ordenes

  Background: precondiciones
    * call read('classpath:examples/crear_orden.feature@crear')

  @consultar
  Scenario: Consultar y validar la orden creada
    Given url 'https://petstore.swagger.io/v2/store/order/' + orderId
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    And match response.petId == 501
    And match response.status == 'placed'
    And match response.complete == true
    And print response