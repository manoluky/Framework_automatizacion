Feature: Test Docker

	Background:
		#@PRECOND_XRAY-21
		Given Ingresar a google

	@TEST_XRAY-20
	Scenario: Test Docker
		When introduzco la palabra "Tsoft"
		  And selecciono el resultado de la busqueda "Tsoft"
		  Then se visualiza la pagina "https://www.tsoftglobal.com/"
