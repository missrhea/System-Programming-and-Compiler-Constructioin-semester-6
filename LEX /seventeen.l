%{
// inclusive start condition	
%}

%s SM BG

%%

# BEGIN(SM);
## BEGIN(BG);
[0-9]+ {
	printf("\nIt's a digit ");
}	

<BG>[A-Z]+ {
	printf("\nGiven string containts capital letter(s) ");
}	


<SM>[a-z]+ { 
		printf("\n Given string contains small letter(s)");
}

<BG>.+ {
	printf("\nExiting from ##start condition");
	BEGIN(INITIAL);
}

.+ {
	printf("\nNo action to execute");
}

%%

main()
{	
	printf("\nEnter # when you are expecting only small letters");
	printf("\nEnter ## only big letters");
	yylex();
}	
