Feature: Busqueda de google, se esperar realizar e ingresar a una pagina utilizando el buscador de google.


  Background:
  Given Ingresar a google

  @google @tsoft
  Scenario: Busqueda google
    When introduzco la palabra "Bci"
    And selecciono el resultado de la busqueda "Bci"
    Then se visualiza la pagina "https://www.bci.cl/personas"

  @google @parametrico
  Scenario Outline: Busqueda google parametrizada
    When introduzco la palabra "<Busqueda>"
    And selecciono el resultado de la busqueda "<Busqueda>"
    Then se visualiza la pagina "<Url>"

    Examples:
      | Busqueda | Url                                        |
      | Tsoft    | https://www.tsoftglobal.com/               |
      | Bci      | https://www.bci.cl/personas |