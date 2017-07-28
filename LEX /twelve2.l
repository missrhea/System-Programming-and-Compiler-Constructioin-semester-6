%{
unsigned long charCount=0, wordCount=0, lineCount=0;
#undef yywrap
%}

WORD[^ \t\n]+
EOL [\n]

%%

{WORD} { wordCount++;
	charCount=charCount+yyleng;
       }

{EOL}  { charCount++;
       	 lineCount=lineCount+1;
       }

.	{ charCount++;
         }
%%

char**fileList;
unsigned currentFile=0, noFiles;
unsigned long totalCC=0, totalWC=0, totalLC=0;

void main(int argc, char**argv)
{
         FILE*fpt;
         fileList= argv+1;
         noFiles= argc-1;
         if(argc==2)
         {
                currentFile=1;
                fpt=fopen(argv[1],"r");
                if(!fpt)
                {
                
                    fprintf(stderr,"\nCould not open %s\n",argv[1]);
                    exit(1);
                }
                yyin=fpt;
        }
	printf("\nlineCount   WordCount  CharCount\n");
        if(argc>2)
                yywrap();
        yylex();
         printf("%8lu %8lu %8lu %s\n",lineCount, wordCount, charCount, fileList[currentFile-1]);
         totalCC=totalCC+charCount;
         totalWC=totalWC+wordCount;
         totalLC=totalLC+lineCount;
        printf("%8lu%8lu%8lu\n",totalLC,totalWC,totalCC);
        
       }
       
       int yywrap()
       {
       FILE *fp=NULL;
       if((currentFile !=0) && (noFiles>1) && (currentFile < noFiles))
       {
       
         printf("%8lu %8lu %8lu %s\n",lineCount, wordCount, charCount, fileList[currentFile-1]);
         totalCC=totalCC+charCount;
         totalWC=totalWC+wordCount;
         totalLC=totalLC+lineCount;
         charCount=wordCount=lineCount=0;
         fclose(yyin);
       }
       
       while(fileList[currentFile] !=NULL)
       {
         fp=fopen(fileList[currentFile++],"r");
         if(fp !=NULL)
         { 
           yyin=fp;
           break;
         }
         fprintf(stderr,"\nCould not open %s\n",fileList[currentFile-1]);
       }
       return(fp ? 0 : 1);
     }
