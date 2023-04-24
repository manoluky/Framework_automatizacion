package steps;

import constants.Navegador;
import driverConfig.DriverContext;
import io.cucumber.java.en.Given;
import util.MetodosGenericos;

import static constants.Constant.URL_BCI;
import static org.junit.Assert.assertEquals;

public class BackgroundBci {

    @Given("Ingresar a Bci personas")
    public void ingresarABciPersonas() {
        DriverContext.setUp(Navegador.Chrome, URL_BCI);
        MetodosGenericos.esperar(2);
        String url = DriverContext.getDriver().getCurrentUrl();
        assertEquals(URL_BCI, url);
    }

}
