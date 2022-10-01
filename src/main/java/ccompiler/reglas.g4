grammar reglas;

@header {
   package ccompiler;
}


// EXPRESIONES REGULARES

CHAR : 'char';
CONST : 'const';
DEFAULT : 'default';
DO : 'do';
DOUBLE : 'double';
ELSE : 'else';
ENUM : 'enum';
FLOAT : 'float';
FOR : 'for';
IF : 'if';
INLINE : 'inline';
INT : 'int';
LONG : 'long';
RESTRICT : 'restrict';
RETURN : 'return';
SHORT : 'short';
SIGNED : 'signed';
SIZEOF : 'sizeof';
STATIC : 'static';
STRUCT : 'struct';
SWITCH : 'switch';
TYPEDEF : 'typedef';
UNSIGNED : 'unsigned';
VOID : 'void';
WHILE : 'while';


PA : '(';
PC : ')';
CA : '[';
CC : ']';
LA : '{';
LC : '}';

MEN : '<';
MENEQ : '<=';
MAY : '>';
MAYEQ : '>=';
LSHIFT : '<<';
RSHIFT : '>>';

SUM : '+';
INCREMENT : '++';
RES : '-';
DECREMENT : '--';
MUL : '*';
DIV : '/';
MOD : '%';

// AND : '&';
// OR : '|';
AND : '&&';
OR : '||';
// Caret : '^';
NOT : '!';
//Tilde : '~';

QUESTION : '?';
//Colon : ':';
PYC : ';';
COMA : ',';
PUNTO : '.';

EQ : '=';
MULASSIGN : '*=';
DIVASSIGN : '/=';
MODASSIGN : '%=';
SUMASSIGN : '+=';
RESASSIGN : '-=';
LSHIFTASSIGN : '<<=';
RSHIFTASSIGN : '>>=';
ANDASSIGN : '&=';
XORASSIGN : '^=';
ORASSIGN : '|=';

EQL : '==';
DIS : '!=';


ID : (LETRA | '_') (LETRA | DIGITO | '_')*;

INTEGER : DIGITO+;
DECIMAL : INTEGER'.'INTEGER;

CHARACTER: '\''(LETRA|PUNTO|DIGITO)'\'';

fragment LETRA : [a-zA-Z_];
fragment DIGITO : [0-9];


WS : [ \t]+ -> skip ;

Nl :   (   '\r' '\n'?
   |   '\n'
   )
   -> skip
   ;

BLCOM : '/*' .*? '*/' -> skip ;

LCOM  :   '//' ~[\r\n]* -> skip ;




//  REGLAS SINTACTICAS


programa : instrucciones EOF;

instrucciones : instruccion instrucciones
              |  
              ;

bloque : LA instrucciones LC 
       ;

instruccion : declaracion PYC
            | asignacion PYC
            | ciclofor 
            | ciclowhile
            | condif
            | prototipoFuncion PYC
            | funcion
            | llamadaFuncion PYC
            | retorno PYC
            | bloque 
            ;

retorno : RETURN opAL;

declaracion : tipoDato ID
            | tipoDato ID asignacion
            ;

asignacionValor : EQ operacion 
                ;

tipoDato : INT
         | CHAR
         | DOUBLE
         | VOID
         | FLOAT
         | ENUM
         | LONG
         | SHORT
         | UNSIGNED
         ;

asignacion : ID asignacionValor 
           ;

//ciclos
ciclofor : FOR PA asignacionValor PYC operacion PYC ID asignacion PC instruccion 
         ;

ciclowhile : WHILE PA operacion PC instruccion 
           ;

// if else
condif : IF PA operacion PC instruccion
       | IF PA operacion PC bloque ELSE bloque
       ;

// funciones

prototipoFuncion : tipoDato ID PA parametros PC 
          ;

funcion : tipoDato ID PA parametros PC bloque 
        ;

parametros : parametro        
           ;

parametro : declaracion parametro
          | COMA declaracion parametro            
          |
          ;

llamadaFuncion : ID PA argumentos PC
               ;

argumentos : operacion argumento
           ;

argumento : COMA operacion argumento
          |
          ;


// operaciones aritmeticás-lógicas    


operacion : opAL ; 

opAL : opalOR 
     |
     ;

opalOR : opalAND disy
     ;   

disy : OR opalAND disy
     |
     ;

opalAND : comparacion cony
        ;

cony : AND comparacion cony
     |
     ;

comparacion : expresion comp
            ;

comp : opcomp expresion comp
     |
     ;

opcomp : EQL
       | DIS
       | MAY
       | MAYEQ
       | MEN
       | MENEQ
       ;                  



// Expresiones

expresion : termino exp;

exp : SUM termino exp
    | RES termino exp
    |
    ;


// Términos

termino : factor term;

term : MUL factor term
     | DIV factor term
     | MOD factor term
     |
     ;


factor : f PA opAL PC
         | f llamadaFuncion
         | f INTEGER
         | f DECIMAL        
         | f ID
         | f CHARACTER
         | ID f
         ;


f : SUM
  | RES
  | NOT
  | INCREMENT
  | DECREMENT
  |
  ;




