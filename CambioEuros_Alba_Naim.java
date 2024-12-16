package com.iescamp;

//Creado por Alba y Naim

public class CambioEuros_Alba_Naim {

    static int listamonedas = 0;

    /**
     * Metodo para pedir la moneda que desea convertir.
     *
     * @param moneda Array de monedas de tipo string.
     */

    public static void definirMonedas(String[] moneda){
        System.out.println("Dime una moneda");
        String Moneda = ConsoleReader.readString();
        moneda[listamonedas] = Moneda;
        listamonedas++;
        System.out.println("Moneda añadida");
    }

    /**
     * Metodo para definir el cambio de una moneda al euro.
     * asigna una tasa de cambio a cada moneda.
     *
     * @param moneda Array de monedas de tipo string.
     * @param tasaCambio Array que las tasas de cambio de tipo double.
     */

    public static void definirCambio(String[] moneda, Double[] tasaCambio){
        System.out.println("Asigna el valor del cambio de la moneda al euro");
        for (int i = 0; i < listamonedas; i++){
            System.out.println("Vas a asignar el valor a " + moneda[i]);
            double tasa = ConsoleReader.readDouble();
            tasaCambio[i] = tasa;
            System.out.println("Valor asignado");
        }
    }

    /**
     * Metodo para hacer la conversión de una moneda a euros.
     *
     * @param moneda Array de monedas de tipo string
     * @param tasaCambio Array que las tasas de cambio de tipo double.
     */

    public static void calcularConversion(String[] moneda, Double[] tasaCambio){
        System.out.println("Cantidad de dinero que vas a pasar a euros");
        double cantidad = ConsoleReader.readDouble();
        for (int i = 0; i < listamonedas; i++){
            double resultado = tasaCambio[i] * cantidad;
            System.out.printf("La conversión de %s al euro es de: %.2f€%n", moneda[i], resultado);
        }
    }

    //el main
    public static void main (String[] args){

        //array para definir las monedas
        String[] moneda = new String[10];

        //array para definir el cambio de la moneda
        Double[] tasaCambio = new Double[10];

        int opcion;
        do {
            System.out.println("--- Menú Principal ---");
            System.out.println("1. Definir monedas");
            System.out.println("2. Define el cambio");
            System.out.println("3. Calcular conversion");
            System.out.println("4. Salir");
            opcion = ConsoleReader.readInt();

            switch (opcion) {
                case 1:
                    definirMonedas(moneda);
                    break;
                case 2:
                    definirCambio(moneda, tasaCambio);
                    break;
                case 3:
                    calcularConversion(moneda, tasaCambio);
                    break;
                case 4:
                    break;
                default:
                    System.out.println("Opcion no valida");
                    break;

            }
        }while(opcion != 4);
    }
}
