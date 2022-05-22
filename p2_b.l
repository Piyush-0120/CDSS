/* Program to recognize whether a given sentence is simple or compound */

%{
    #include<stdio.h>
    int valid;
%}
%%
[a-zA-Z]*[ ](and|but|or|however)[ ][a-zA-Z]* {valid=1;}
.|[\n];
%%

int yywrap(){
    return 1;
}
int main(){
    printf("Enter the text\n");
    yylex();
    if(valid){
        printf("\n Statement is compound\n");
    }
    else{
        printf("\n Statement is simple\n");
    }
    return 0;
}