%%

[a-zA-Z]+ |
.*|\n      flushie(yytext); 
%%
main()
{
//printf("start... ");
printf("%s \n", yytext);
yylex();
}

void flushie(char string[])
{
printf("Without using YY_FLUSH_BUFFER\n");
printf("before flushing : %s \n", yytext);
printf("after  flushing : %s \n", yytext);

printf("Using YY_FLUSH_BUFFER\n");
printf("before flushing : %s \n", yytext);
YY_FLUSH_BUFFER;
printf("after  flushing : %s \n", yytext);


YY_FLUSH_BUFFER;
return;
}
