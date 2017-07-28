%{
int charCount=0,wordCount=0,lineCount=0;
#undef yywrap

%}

WORD[^ \t\n]+
EOL [\n]

%%

{WORD} { wordCount++;
	charCount=charCount+yyleng;
	printf("\nThe file contains:  \n");
	ECHO ;
       }

{EOL}  { charCount++;
         lineCount++; 
	printf("\nwC= %d\tcC= %d\tlC= %d\n", wordCount, charCount, lineCount);
	
       }

. 	{ charCount++;
	  ECHO ;
         }
%%

main()
{
char filename[20];
printf("\nEnter file name\n");
scanf("%s",filename);
yyin=fopen(filename,"r+");
yylex();
}
