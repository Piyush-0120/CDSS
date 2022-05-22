/* C program to implement Shift Reduce Parser for the given grammar: E →
E+E
E → E*E
E →(E)
E→ id */
#include <stdio.h>
#include <string.h>
int k = 0, z = 0, i = 0, j = 0, c = 0;
char a[16], ac[20], stk[15], act[10];
void check();
int main()
{
    puts("GRAMMAR is E->E+E \n E->E*E \n E->(E) \n E->id");
    puts("enter input string");
    gets(a);
    c = strlen(a);//store length
    strcpy(act, "SHIFT->");
    puts("stack\tinput\taction");
    printf("\n$\t %s $\t--", a);
    for (j=0, i = 0; j < c; i++, j++)
    {
        // id+id*id shift id
        // +id*id shift +
        if (a[j] == 'i' && a[j + 1] == 'd')
        {
            stk[i] = a[j];
            stk[i + 1] = a[j + 1];
            stk[i + 2] = '\0'; //end of string
            a[j] = ' '; //space
            a[j + 1] = ' ';// __+id*id
            printf("\n$%s\t %s$\t %sid", stk, a, act); // 
            check();//is it reducable?
        }
        else
        {
            //symbols
            stk[i] = a[j];// stk[i]=a[j]= +
            stk[i + 1] = '\0';
            a[j] = ' ';
            printf("\n$%s\t %s$\t %ssymbols", stk, a, act);
            check();
        }
    }
}
void check()
{
    strcpy(ac, "REDUCE TO E");
    for (z = 0; z < c; z++) //c=length
    if (stk[z] == 'i' && stk[z + 1] == 'd')
    {
        stk[z] = 'E';
        stk[z + 1] = '\0';
        printf("\n$%s\t %s$\t %s", stk, a, ac);
        j++;//only here->
    }
    for (z = 0; z < c; z++)
    if (stk[z] == 'E' && stk[z + 1] == '+' && stk[z + 2] == 'E')
    {
        stk[z] = 'E';
        stk[z + 1] = '\0';
        stk[z + 2] = '\0';
        printf("\n$%s\t %s$\t %s", stk, a, ac);
        i = i - 2;
    }
    for (z = 0; z < c; z++)
    if (stk[z] == 'E' && stk[z + 1] == '*' && stk[z + 2] == 'E')
    {
        stk[z] = 'E';
        stk[z + 1] = '\0';
        stk[z + 2] = '\0';
        printf("\n$%s\t %s$\t %s", stk, a, ac);
        i = i - 2;
    }
    for (z = 0; z < c; z++)
    if (stk[z] == '(' && stk[z + 1] == 'E' && stk[z + 2] == ')')
    {
        stk[z] = 'E';
        stk[z + 1] = '\0';
        stk[z + 2] = '\0';
        printf("\n$%s\t %s$\t %s", stk, a, ac); //action
        i = i - 2;
    }
}
