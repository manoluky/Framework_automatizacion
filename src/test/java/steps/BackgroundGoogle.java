package steps;

import constants.Navegador;
import driverConfig.DriverContext;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import pages.GooglePage;
import util.MetodosGenericos;

import static constants.Constant.URL_GOOGLE;
import static org.junit.Assert.assertEquals;

public class BackgroundGoogle {

    GooglePage googlePage = new GooglePage();
    @Given("Ingresar a google")
    public void ingresarAGoogle() {
        DriverContext.setUp(Navegador.Chrome, URL_GOOGLE);
        MetodosGenericos.esperar(2);
        String url = DriverContext.getDriver().getCurrentUrl();
        assertEquals(URL_GOOGLE, url);
    }



}
