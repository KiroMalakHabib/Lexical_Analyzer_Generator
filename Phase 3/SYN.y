%{
**** C stuff ****
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}

%union{

    int ival;     // int
	float fval;   // float
	char * val; // value
    char * type; // type --> ADD_OP MUL_OP NUM F_NUM REL_OP BOOL_OP BOOL ID
}

%token INT FLOAT BOOLEAN IF_WORD ELSE FOR_WORD WHILE_WORD SYSTEM_OUT CLASS MODIFIER_TYPE
%token ADD_OP MUL_OP NUM F_NUM REL_OP BOOL_OP BOOL ID EQUALS
%token SEMI_COLON LEFT_BRACKET RIGHT_BRACKET LEFT_CURLY_BRACKET RIGHT_CURLY_BRACKET OTHER

%type ....

%%

CLASS_DECL:
    MODIFIER CLASS ID LEFT_CURLY_BRACKET CLASS_BODY RIGHT_CURLY_BRACKET
    ;
CLASS_BODY:
    DECLARATION | ASSIGNMENT | METHOD_LIST | Epsilon
    ;
METHOD_LIST:
    METHOD_DECL | METHOD_LIST METHOD_DECL
    ;
METHOD_DECL:
    MODIFIER PRIMITIVE_TYPE ID LEFT_BRACKET RIGHT_BRACKET 
    LEFT_CURLY_BRACKET METHOD_BODY RIGHT_CURLY_BRACKET
    ;
METHOD_BODY:
    STATEMENT_LIST
    ;
STATEMENT_LIST:
    STATEMENT | STATEMENT_LIST STATEMENT
    ;
STATMENT :
    DECLARATION | IF_WORD | WHILE_WORD | ASSIGNMENT
    ; 
DECLARATION :
    PRIMITIVE_TYPE IDENTIFIER
    ; 
PRIMITIVE_TYPE :
    INT | FLOAT
    ;
MODIFIER :
    MODIFIER_TYPE 
    ;
IF :
    IF_WORD LEFT_BRACKET EXPRESSION RIGHT_BRACKET 
    LEFT_CURLY_BRACKET STATEMENT RIGHT_CURLY_BRACKET
    else LEFT_CURLY_BRACKET STATEMENT RIGHT_CURLY_BRACKET 
    ;
WHILE :
    WHILE_WORD LEFT_BRACKET EXPRESSION RIGHT_BRACKET 
    LEFT_CURLY_BRACKET STATEMENT RIGHT_CURLY_BRACKET 
    ;
ASSIGNMENT :
    ID EQUALS EXPRESSION
    ; 
EXPRESSION :
    NUMBER | EXPRESSION INFIX_OPERATOR EXPRESSION 
    | ID 
    | LEFT_BRACKET EXPRESSION RIGHT_BRACKET
    ;
INFIX_OPERATOR :
    ADD_OP | MUL_OP| REL_OP | BOOL_OP 
;

%%
/* MAIN */
...