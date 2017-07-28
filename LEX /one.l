%{

void display(char[], int);
int flag;

%}

%%

[a-zA-Z]+[\n] {
		flag=1;
		display(yytext,flag);
		return;
	      }

[0-9]+[\n]	{
		int flag=0;
		display(yytext,flag);
		return;
		}


.+		{
		int flag=-1;
		display(yytext,flag);
		return;
		}

%%

void display(char string[], int flag){
if (flag==1)
	printf("%sis a word \n", string);
if (flag==0)
	printf("%sis a number", string);
if (flag==-1)
	printf("%sis neither a word nor a number \n", string);
yylex();
}
