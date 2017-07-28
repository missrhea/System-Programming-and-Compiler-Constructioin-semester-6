%{
#undef yymore()
int a,b,c;

%}

%%

add {
printf("\nEnter any two numbers=");
scanf("%d%d",&a,&b);
yymore();
printf("the sum is=%d",c);
}

.+ {
printf("\n Enter 'add' to add two numbers ");
}

%%

void main()
{
printf("\n Enter 'add' to add two numbers \n");
yylex();
}

void yymore()
{
c=a+b;
}

