%{
int in=0;
%}
%%
.* {in++; fprintf(yyout,"\n%d:%s",in,yytext);}
%%
int yywrap(){}
int main()
{
yyin=fopen("hello.txt","r");
yyout=fopen("outnew.txt","w");
yylex();
}
