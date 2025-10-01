%{
    #include <stdio.h>
    int icount=0, factcount=0;
%}

%%

"fact"      { factcount++; }
"i"         { icount++; }
.|\n        { /* ignore other characters */ }

%%

int yywrap(void) {
    return 1;   /* tells flex: no more input */
}

int main()
{
    yylex();
    printf("Count of \"fact\" = %d \nCount of letter 'i' = %d\n", factcount, icount);  
    return 0;
}
