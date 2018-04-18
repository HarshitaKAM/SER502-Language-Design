grammar habesome;


program :  block  ;
block : '[' ( declaration '.' statementList )']' |
   '[' statementList ']';
declaration : datatype statementList '.' declaration |
   datatype statementList '.';

   datatype: INT | BOOLEAN;

statementList : statement '.' statementList |
   statement '.' |
   block;

statement : assignment | ifStatement | whileloop;

assignment : identifier 'is' expression;

ifStatement : 'if' '(' bool ')' block 'else' block;

whileloop : 'while' '(' bool ')' block;

bool : 'True' |
   'False' |
   expression '=:' expression |
   '!!' expression |
   expression '<<' expression |
   expression '>>' expression;



expression : term '+' expression |
   term '-' expression |
   term;

term : identifier '*' term |
   number '*' term |
   identifier '/' term |
   number '/' term |
   identifier |
   number ;

identifier: L identifier |
   L ;

number : DG number |
   DG ;
INT: [0-9]+ ;
DG : [0-9]+ ;
BOOLEAN: 'True' | 'False';

L : ('a'..'z' | 'A'..'Z')*;




