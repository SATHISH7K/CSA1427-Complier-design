%{
#include <stdio.h>
int comment_count = 0;
%}

%%

"//".*                  { comment_count++; }                 /* single-line comment */
"/"([^]|\+[^/])"/"   { comment_count++; }              /* multi-line comment */

\n                      { /* ignore newlines */ }
.                       { /* ignore other characters */ }

%%

int yywrap(void) { return 1; }

int main(void)
{
    printf("Enter the code (Ctrl+D to end):\n");
    yylex();
    printf("\nTotal comment lines: %d\n", comment_count);
    return 0;
}