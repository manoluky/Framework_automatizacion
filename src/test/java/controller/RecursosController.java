
package controller;

import org.junit.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RecursosController {

    private static final Logger log = LoggerFactory.getLogger(RecursosController.class);

    public static String getDataTest(String dataTest) {
        String data = "";
        try {
            if (!dataTest.isEmpty()) {
                switch (dataTest){



                        default:
                            Assert.fail("nombre del parametro '" + dataTest + "' no controlado, necesita revision");
                            break;

                    }

            }
        }catch (Exception e){
            log.error("Error para obtener data de prueba: " + e);
        }

        return data;
    }
}

