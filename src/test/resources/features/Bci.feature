Feature: Beneficios exclusivos de Bci Personas
  Background:
    Given Ingresar a Bci personas

@TEST_RQBD-4
  Scenario: Verifico Categorias de Benificios
    When Entro a "Beneficios"
    Then Valido las "Categorias"