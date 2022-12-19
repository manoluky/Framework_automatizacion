import org.junit.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class PRueba {

    public static boolean texto(String car){

        String carrito= "CarritoCompleto";
        boolean texto = carrito.contains(car);
        return texto;

    }
@Test
    public void test1(){
    assertTrue(texto("Carrito"));
    assertTrue(texto("Hola"));
}


}

