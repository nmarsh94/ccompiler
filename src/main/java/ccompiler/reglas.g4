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

CARACTER: '\''(LETRA|PUNTO|DIGITO)'\'';

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