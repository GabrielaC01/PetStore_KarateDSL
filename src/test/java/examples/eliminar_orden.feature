Feature: Eliminaciones y validaciones de ordenes

  Background: precondiciones
    * call read('classpath:examples/crear_orden.feature@crear')
    * url 'https://petstore.swagger.io/v2/store/order/'

  @eliminar @test
  Scenario: Se elimina la orden creada
    Given path orderId
    And header Content-Type = 'application/json'
    When method delete
    Then status 200
    And match response.code == 200
    And print response

  @validar @test
  Scenario: Se valida que la orden eliminada ya no existe
    * call read('classpath:examples/eliminar_orden.feature@eliminar')
    * url 'https://petstore.swagger.io/v2/store/order/'

    Given path orderId
    And header Content-Type = 'application/json'
    When method get
    Then status 404
    And print response
