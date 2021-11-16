%option noyywrap
%option yylineno
/* Analizador para un lenguaje al estilo de Anolis */

%{
/* se necesita esto para la llamada a atof() mas abajo */
#include <math.h>
int conterror=0;
%}

DIGITO   [0-9]
ID       [A-Za-z_][A-Za-z_0-9]*
STRING       \"[^"]*\"

%%

-?{DIGITO}+ 			    { printf( "Un entero: %s (%d)\n", yytext,atoi( yytext ) );}
-?{DIGITO}+"."{DIGITO}* 	{  printf( "Un real: %s (%g)\n", yytext, atof( yytext ) );}


"mov"|"inicio"|"fin"|"funcion"|"entrada"|"salida"|"verdadero"|"falso"|"romper" 		{ printf( "Una palabra clave: %s\n", yytext );}
"si"|"no"|"segun"|"caso"|"pordefecto"  { printf( "desicion: %s\n", yytext );}
"para"|"mientras"|"hacer"              { printf( "ciclo: %s\n", yytext );}
"entero"|"booleano"|"real"|"cadena"	   { printf( "Tipos de datos: %s\n", yytext );}


{ID}       			     { printf( "Un identificador: %s\n", yytext ); }

{STRING}	  	        { printf( "Reconocio un STRING: %s\n", yytext );}

"+"|"-"|"*"|"/"  		 { printf( "Un operador aritmetico: %s\n", yytext ); }

"{"|"}"|"("|")"  		 { printf( "Un operador de agrupacion: %s\n", yytext ); }

"<>"|">"|"<"|"=>"|"=<"|"=="|"<"  { printf( "Un operador de comparacion: %s\n", yytext ); }

"||"|"&&"|"!"  			 { printf( "Un operador logico: %s\n", yytext ); }

"="|":"				 { printf( "Una asignacion: %s\n", yytext ); }

";" 				 { printf( "Un separador fin de linea : %s\n", yytext ); }

"//".*   { printf( "Reconocio un comentario: %s\n", yytext );}

"/##".[^}\n].*"#/"   { printf( "Reconocio un comentario multilinea: %s\n", yytext );}

[ \t\n]+          		 /* se come los espacios en blanco */

.                  		{ printf( "Error lexico: %s,en la linea %d\n", yytext, yylineno); conterror=conterror+1; }

%%

main( )
    {
    printf("Analizador para algunos elementos de un lenguaje al estilo de Anolis .an \n");
    yyin = fopen( "calculadora.an", "r" );
    yylex();
    printf("Lineas analizadas %d, errores encontrados %d \n",yylineno, conterror);
    printf("Presiones una tecla para terminar...");
    getchar();
 }