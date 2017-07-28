%{
// new simple yyrestart()
%}
%%



.+	ECHO;


%%
void main(){

FILE*fpt;
fpt=fopen("ip1.txt","r");

printf("\ngoing in ip1.txt\n");

yyrestart(fpt);

yylex();
}

/*
rhea@rhea-Lenovo:~/Desktop/RHEASPCC$ clear

rhea@rhea-Lenovo:~/Desktop/RHEASPCC$ lex fourteen2.l
rhea@rhea-Lenovo:~/Desktop/RHEASPCC$ cc lex.yy.c -ll
rhea@rhea-Lenovo:~/Desktop/RHEASPCC$ ./a.out

going in ip1.txt
blueberries
strawberries
mulberries
*/


