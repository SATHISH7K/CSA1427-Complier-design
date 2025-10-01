%{
#include <stdio.h>
#include <string.h>

// word to search and replace
char search[50] = "hello";
char replace[50] = "hi";
%}

%%
{search}   { printf("%s", replace); }   // if the word matches, replace it
.|\n       { ECHO; }                    // otherwise, print as it is
%%

int main(int argc, char *argv[]) {
    if(argc > 2) {
        strcpy(search, argv[1]);
        strcpy(replace, argv[2]);
    }
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
