/* Program to recognize the strings using the grammar (anbn; n>=0) */
%{
    #include "p6.tab.h"
%} 
%%
a return A; 
b return B;
. return yytext[0];
\n return yytext[0];
%%
int yywrap(){
    return 1;
}