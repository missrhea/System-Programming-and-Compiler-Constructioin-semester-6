import java.util.*;

public class Rheall1{


	public static void main(String args[]){

	String nts, terminals;
	int ntlen, tlen, i,l, n;
	String ptable[][];
	HashSet ntsSet = new HashSet();
	HashSet terminalsSet = new HashSet();

	Scanner sc = new Scanner(System.in);
	System.out.println("Enter the NT's  ");
	nts=sc.next();
	ntlen=nts.length();
	System.out.println("Enter the terminals  ");
	terminals=sc.next();
	tlen=terminals.length();

	ptable = new String[ntlen+1][tlen+2];

	for(i=1; i<ptable[0].length-1 ; i++) {
		ptable[0][i]=terminals.charAt(i-1)+"";
		terminalsSet.add(ptable[0][i]);
	}

	ptable[0][i]='$'+"";

	for(i=1; i<=ntlen ; i++) {
		ptable[i][0]=nts.charAt(i-1)+"";
		ntsSet.add(ptable[i][0]);
	}

	for( i=1; i<=ntlen; i++) {
	
		System.out.print("\nFor NT "+ptable[i][0]+" how many entries in the parsing table?\n");
		n=sc.nextInt();
		for(int j=0;j<n;j++)
			{
				System.out.print("Enter the terminal:");
				String ch=sc.next();
				System.out.print("Enter corresponding RHS:");
				String value=sc.next();
				
				for(int k=1; k<ptable[0].length ; k++)
					if( ptable[0][k].equals(ch) )  {
						ptable[i][k]=value;	
						break;
					}
				System.out.println();
			}
	}

	System.out.println("Parsing Table\n");
	for(int j=0; j<=ntlen; j++)	{
	for( i=0; i<ptable[0].length ; i++)
			System.out.print(ptable[j][i]+"\t");
			System.out.println();	
		}

	System.out.println("Enter input string   :   ");
	String input = sc.next();
	Stack<String> stack = new Stack<String>();
	stack.push("$");
	stack.push(ptable[1][0]);
	System.out.println("initial stack :"+ stack);
	int flag=1;

	while( !(stack.peek().equals("$")) && !( input.equals("$") ) ) 
	{
			if(terminalsSet.contains(stack.peek())) 
				{
					if ( (stack.peek()).trim().equals( (( input.charAt(0)+"").trim() ) ) )
						{  stack.pop(); input=input.substring(1,input.length() ); }

					else { flag=0; System.out.println("1. Cant be parsed. "); break; }
				}

			else if( ntsSet.contains(stack.peek() ) ) 
				{	//String readInput=input.charAt(0)+"";
					for(i=1; i<ptable[0].length ; i++)
						if( ( (input.charAt(0)+"").trim() ).equals(ptable[0][i]) )
							break;
					for(l=1; l<=ntlen ; l++)
						if(stack.peek().equals(ptable[l][0]) )
							break;

					String value=ptable[l][i];
					//System.out.print("\n"+l+"  "+i+"\n");
					if(value==null)	
						{ flag=0; System.out.println("2. String can't be parsed. "); break;}

					int vlen = value.length();
					stack.pop();
					if(!value.equals("e"))
						for(int k=vlen-1 ; k>=0 ; k-- )
							stack.push(value.charAt(k)+"");
				}
	
				else 	{ System.out.println("3. Can't be parsed.  "); break ;}

					System.out.println(stack+"\t"+input);
					System.out.println();
	}

		if(flag==1)
			System.out.println("String parsed succesfully !");
		else
			System.out.println("String parsed unsuccesfully !");



	
}
}
