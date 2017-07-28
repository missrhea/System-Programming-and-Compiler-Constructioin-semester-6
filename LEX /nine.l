%{
#define YYLMAX 10
int f=0;
%}
%array yytext
%%

[a-zA-Z]+ {
do_unput(yytext);
}
[(] {printf("\nAfter unput(): \n"); ECHO; }
[)] {ECHO; return; }
%%

void main()
{
yylex();
}
void do_unput(char yytext[]){
	if(f==0){
	f=1;
	int i;
	/* Copy yytext because unput() trashes yytext */
	char *yycopy = strdup( yytext );
	unput( ')' );
	for ( i = yyleng - 1; i >= 0; --i )
	    unput( yycopy[i] );
	unput( '(' );
	free( yycopy );
	printf("\nyytext:\n");
	for(i=0; i<yyleng; i++)
		printf("%c", yytext[i]);
	}
	else{
	int j;
	for(j=0; j<yyleng; j++)
		printf("%c", yytext[j]);
	}
}









