package pages;

import constants.Constant;
import driverConfig.DriverContext;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.PageFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import util.MetodosGenericos;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.fail;

public class BciPage {

    private WebDriver driver;

    private static final Logger log = LoggerFactory.getLogger(GooglePage.class);

    public BciPage(){
        this.driver = DriverContext.getDriver();
        PageFactory.initElements(this.driver, this);
    }

    @FindBy(id = "intro-step1")
    WebElement BtnMenu;

    @FindBy(xpath = "//p[text()=\"Beneficios\"]")
    WebElement BtnBeneficios;

    @FindBy(xpath = "//h2[contains(text(),\"Categorías\")]")
    WebElement TextCategorias;

    @FindBys({@FindBy(xpath = "//h3[@class=\"h2 h2-lg card-favorite__title color-white d-flex align-items-end pr-2\"]")})
    List<WebElement> CardsCategorias;

    public void IngresarMenu(){
        try {
            boolean validarBtnMenu = MetodosGenericos.visualizarObjeto(BtnMenu, 10);
            if(validarBtnMenu){
                BtnMenu.click();
            }
            else {
                fail("no se logro realizar el click");
            }
        }catch (Exception e){
            fail("no fue posible ingresar al menú de persona ");
        }

    }

    public void IngresarMenuOpcion(String opcion){
        WebElement btn = null;
        switch(opcion){
            case ("Beneficios"):
                btn = BtnBeneficios;
        }
        try {
            boolean validarBtnMenu = MetodosGenericos.visualizarObjeto(btn, 10);
            if(validarBtnMenu){
                btn.click();
            }
            else {
                fail("no se logro realizar el click");
            }
        }catch (Exception e){
            fail("no fue posible ingresar al menú de" + opcion + " de persona ");
        }

    }

    public void verificarFuncionalidad(String opcion){
        WebElement text = null;
        switch(opcion){
            case ("Categorias"):
                text = TextCategorias;
        }
        try {
            boolean validarTextCategoria = MetodosGenericos.visualizarObjeto(text, 10);
            if(validarTextCategoria){
                Assert.assertEquals("Categorías que te pueden interesar",text.getText());
            }
            else {
                fail("no se encontro elemento ");
            }
        }catch (Exception e){
            fail("no fue posible encontrar las" + opcion + " banca de persona ");
        }
        try {
            boolean validarCardsCategorias = MetodosGenericos.visualizarObjeto(CardsCategorias.get(0), 10);
            if(validarCardsCategorias){
                String[] categoriasActuales = {
                        CardsCategorias.get(0).getText(),
                        CardsCategorias.get(1).getText(),
                        CardsCategorias.get(2).getText(),
                        CardsCategorias.get(3).getText(),
                        CardsCategorias.get(4).getText(),
                        CardsCategorias.get(5).getText()
                };
                System.out.println("se validan las categorias" + Arrays.toString(categoriasActuales));
                Assert.assertArrayEquals(Constant.categorias, categoriasActuales);
            }
            else {
                fail("no se encontro elemento");
            }
        }catch (Exception e){
            fail("no fue posible ver las categorias ");
        }

    }
}
