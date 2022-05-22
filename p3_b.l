/* Program to count the number of “scanf” and “printf” statements in a C program. Replace them with “readf” and “writef” statements respectively. */
%{
    #include<stdio.h>
    int sf=0,pf=0;
%}
%%
"scanf" {sf++;fprintf(yyout,"readf");}
"printf" {pf++;fprintf(yyout,"writef");}
%%
int yywrap(){
    return 1;
}
int main(){
    yyin = fopen("input.txt","r");
    yyout =fopen("output.txt","w");
    yylex();
    printf("Number of scanf=%d\n",sf);
    printf("Number of printf=%d\n",pf);
    return 0;
}
