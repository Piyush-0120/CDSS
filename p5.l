/* Program to recognize a valid variable which starts with a letter, followed by any number of letter or digits */
%{
    #include "p5.tab.h"
%}
%%
[a-zA-z] return L;
[0-9] return D;
%%
int yywrap(){
    return 1;
}