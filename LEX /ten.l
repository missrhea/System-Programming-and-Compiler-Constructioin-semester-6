%%

[a-z]+ {
	printf("\nIt is a lower case letter : ");
	ECHO;
	printf("\nBeginning the yyterminate() ");
	yyterminate();
}	


[a-zA-Z]+ {
	printf("\nMixed case token : ");
	ECHO;	
}	

%%

void main()
{	
	if(yylex()==0)
		printf("\nyyterminate() returned 0 to yylex()\n");
	
}	

