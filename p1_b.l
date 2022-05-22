/* Program to recognize and count the number of identifiers in a file*/
%{
#include<stdio.h>
int count=0,ch=0,word=0,sp=0,line=0;
%}
digit[0-9]
letter[a-zA-Z_]
%%
{letter}({letter}|{digit})* {count++;}
.+ {;}
\n {;}
%%

int yywrap(){
    return 1;
}
int main(){
    yyin= fopen("input.txt","r");
    yylex();
    printf("Number of identifiers: %d\n",count);
    return 0;
}
