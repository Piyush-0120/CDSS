/* Program to count number of: 1)+ve and -ve integers; 2)+ve and -ve fractions */

%{
#include<stdio.h>
int pi=0,ni=0,pf=0,nf=0;
%}
%%
[-][0-9]+ {ni++;}
[+]?[0-9]+ {pi++;}
[-][0-9]*\.[0-9]+ {nf++;}
[+]?[0-9]*\.[0-9]+ {pf++;}
%%
int yywrap(){
    return 1;
}
int main(){
    yyin = fopen("input.txt","r");
    yylex();
    printf("No of positive integer %d\n",pi);
    printf("No of negative integer %d\n",ni);
    printf("No of positive fraction %d\n",pf);
    printf("No of negative fraction %d\n",nf);
    return 0;
}