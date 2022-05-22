/*Program to count the number, words, spaces and lines in a given input file */

%{
    #include<stdio.h>
    int word=0,space=0,line=0,chara= 0;
%}
%%
" " {space++;word++;}
[\n] {line++;word++;}
[\t\n] {word++;}
[^\t\n] {chara++;}
%%

int yywrap(){
    return 1;
}

int main(){
    yyin = fopen("input.txt","r");
    yylex();
    printf("Character = %d\nWords = %d\n Spaces = %d\n Lines = %d\n",chara,word,space,line);
    return 0;
}