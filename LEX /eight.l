%%
[un]	{ printf("\nunput() symbol found\nyytext="); ECHO; return; }
[a-z] {	return;	}
[A-Z]+ {
printf("\nBefore unput() yytext=");
ECHO;
unput('n');
unput('u');
printf("\nAfter unput() yytext= "); ECHO;	
}
%%

void main()
{
printf("unput() with chars u & n");
yylex();
}

