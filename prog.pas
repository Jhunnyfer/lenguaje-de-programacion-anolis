inicio
mov continuar: booleano(verdadero);

hacer{ 
        salida ("Ingrese el primer número que se calculará:"); 
        mov a :entero(entrada()); 

        salida("Ingrese el segundo número que se calculará:"); 
        mov b :entero(entrada());

        salida("Ingrese el operador: +, -, *, /"); 
        mov compara :cadena(entrada());

        trenza (compara) { 
            caso "+": 
            salida(" ：" + (a + b)); 
            romper; 
            caso "-": 
            salida("La diferencia es:" + (a-b)); 
            romper; 
            caso "*": 
            salida("El producto es:" + (a * b)); 
            romper; 
            caso "/": 
            salida("El negocio es:" + (a / b)); 
            romper; 
            pordefecto: 
            salida("¡Error de entrada de símbolo!"); 
            romper; 
        }

    salida("desea continuar ? y/n"); 
    mov valida :cadena(entrada()); 
    si(valida == "y") { 
        continuar = verdadero; 
        salida("Continuar usando"); 
    }no{ 
        continuar = falso; 
        salida("Gracias por usar este cálculo, bienvenido a usarlo la próxima vez, nos vemos"); 
    } 
} mientras (verdadero)
fin
