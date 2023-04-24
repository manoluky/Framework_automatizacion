package steps;


import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.BciPage;

public class Bci {

    BciPage bciPage = new BciPage();

    @When("Entro a {string}")
    public void entroA(String menu) {
        bciPage.IngresarMenu();
        bciPage.IngresarMenuOpcion("Beneficios");
    }

    @Then("Valido las {string}")
    public void validoLas(String funcionabilidad) {
        bciPage.verificarFuncionalidad(funcionabilidad);
    }
}
