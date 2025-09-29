%{
#include <stdio.h>
#include <stdlib.h>

int num1 = -1, num2 = -1;
char op;
%}

%%

[0-9]+   { 
            if(num1 == -1) 
                num1 = atoi(yytext); 
            else 
                num2 = atoi(yytext); 
         }

"+"|"-"|"*"|"/"   { op = yytext[0]; }

[ \t\n]   ;   // ignore spaces and newlines

.         { printf("Invalid character: %s\n", yytext); }

%%

int yywrap(void) { return 1; }

int main() {
    printf("Enter an expression (e.g., 12+5): ");
    yylex();   // process input

    if(num1 != -1 && num2 != -1) {
        switch(op) {
            case '+': printf("Result = %d\n", num1 + num2); break;
            case '-': printf("Result = %d\n", num1 - num2); break;
            case '*': printf("Result = %d\n", num1 * num2); break;
            case '/': 
                if(num2 != 0) printf("Result = %d\n", num1 / num2);
                else printf("Error: Division by zero!\n");
                break;
            default: printf("Invalid operator\n");
        }
    } else {
        printf("Invalid expression\n");
    }

    return 0;
}