%{
#include <stdio.h>

int token_pos = 0;   // 0 = line number, 1 = number, 2 = word
%}

%%

[0-9]+          {
                    if (token_pos == 0) {
                        printf("num: %s\n", yytext);
                    } else {
                        printf("Number: %s\n", yytext);
                    }
                    token_pos++;
                }

[A-Za-z]+       {
                    printf("Word: %s\n\n", yytext);
                    token_pos = 0;  // reset for next line
                }

[ \t\n]+        ;   /* ignore spaces and newlines */

.               ;   /* ignore anything else */

%%

int yywrap(void) {
    return 1;
}

int main() {
    yylex();
    return 0;
}