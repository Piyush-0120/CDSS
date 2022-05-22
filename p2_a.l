/* Programs to count the numbers of comments lines in a given C program. Also eliminate them and copy the resulting program into a separate file */

%{
    #include <stdio.h>
    int ml=0,sl=0;
%}
%%
"/*"[a-zA-Z0-9' '\t\n]*"*/"* {ml++;}
"//".* sl++;
%%
int yywrap(){
    return 1;
}
int main(){
    yyin=fopen("input.txt","r");
    yyout=fopen("output.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);

    printf("Number of single comments = %d\n",sl);
    printf("Number of multi-line comments = %d\n",ml);
    return 0;
}