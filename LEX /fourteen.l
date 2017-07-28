%{
FILE*fpt2;
int flag=1;
%}
%%


[\n] { printf("\neol found"); 
	if(flag==1){
		flag=2;
		fpt2=fopen("ip2.txt","r");
		yyin=fpt2;
		printf("\ngoing in ip2.txt\n");
		yyrestart(yyin); //start scanning ip2.txt	
	}		
	else if(flag==2){
		flag=0;
		fpt2=fopen("ip3.txt","r");
		yyin=fpt2;
		printf("\ngoing in ip3.txt\n");
		yyrestart(yyin); //start scanning ip2.txt	
		}
		else if(flag==0) return;
    }

.+	ECHO;



%%
void main(){

FILE*fpt;
fpt=fopen("ip1.txt","r");
yyin=fpt;
printf("\ngoing in ip1.txt\n");
zzyylex();
}


