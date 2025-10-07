Feature: Creaciones de ordenes

  @crear
  Scenario: Se crea una orden
    Given url 'https://petstore.swagger.io/v2/store/order'
    And header Content-Type = 'application/json'
    And request
    """
    {
      "petId": 501,
      "quantity": 1,
      "status": "placed",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match response ==
    """
    {
      id: '#number',
      petId: 501,
      quantity: 1,
      status: 'placed',
      complete: true }
    """
    And def orderId = response.id
    And print response