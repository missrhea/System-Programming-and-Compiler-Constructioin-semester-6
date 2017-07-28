%{
	// exclusive start condition
%}

%x SM SMBG

%%

# BEGIN(SM);
## BEGIN(SMBG);
[0-9]+ {
	printf("\nIt's a digit ");
}	

<SMBG>[A-Z]+ {
	printf("\nGiven string containts capital letter(s) ");
}	

<SM>.+ {
	printf("\nExiting from #start condition:");
	BEGIN(INITIAL);
}

<SM,SMBG>[a-z]+ {
	printf("\n Given string contains small letter(s)");
}

<SMBG>.+ {
	printf("\nExiting from ##start condition");
}

.+ {
	printf("\nNo action to execute");
}

%%

main()
{	
	printf("\nEnter # when you are expecting only small letters");
	printf("\nEnter ## only big and small letters");
	yylex();
}	
