%{
 int flag=0;
%}

%%

[a-zA-Z0-9] ECHO;
[(]  ECHO; flag=flag+1; 
[)]  ECHO; flag=flag-1;
\n   check(flag);

%%
main()
{
yylex();
}

void check(int flag){
	
	if(flag == 0)
		printf("\nstatement has no missing parenthesis\n");
	else	
		printf("mismatched parentheses");

}
