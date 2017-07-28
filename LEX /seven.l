%{
int flag = 0;
%}

%%
[a|e|i|o|u] 	{ check(flag); }
.+		{ flag=1; check(flag); }

%%
void main(){
printf("\nEnter a letter to check whether it's vowel\n");
yylex();
}
void check(int flag){
if(flag==0)
	printf("\n%s is a vowel", yytext);
else
	printf("\n%s is not a vowel", yytext);
}
