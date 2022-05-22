/* Program to evaluate arithmetic expression involving operators +, -, *, / */
%{
#include "p4.tab.h"
extern int yylval;
%}
%%
[0-9]+ {yylval=atoi(yytext);return num;}
[\+\-\*\/] {return yytext[0];}
[)] {return yytext[0];}
[(] {return yytext[0];}
. {;}
\n {return 0;}
%%
int yywrap(){
    return 1;
}