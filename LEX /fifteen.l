%%
\/\/.* printf(" ");

\/\*(.*\n)*.*\*\/ printf(" ");


%%
void main(){

FILE*fpt;
fpt=fopen("ip4.txt","r");
yyin=fpt;
printf("\ngoing in ip4.txt to remove comments\n\n");
yylex();
}


