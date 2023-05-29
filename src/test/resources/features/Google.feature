Feature: Prueba-docker

	Background:
		#@PRECOND_XRAY-21
		Given Ingresar a google

	@TEST_PX-3
	Scenario: Prueba-docker
		When introduzco la palabra "Tsoft"
		  And selecciono el resultado de la busqueda "Tsoft"
		  Then se visualiza la pagina "https://www.tsoftglobal.com/"
