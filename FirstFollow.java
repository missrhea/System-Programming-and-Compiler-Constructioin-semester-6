//FIRST and FOLLOW
//RHEA RODRIGUES 
import java.util.*;

public class ff{
	static int ntlen;
	static String grammar[][];
	static char nt[];
	static Set SetofNT = new HashSet();

	public static void main(String args[]){

	Scanner sc = new Scanner(System.in);
	int n;
	System.out.print("How many Non-Terminals ?  ");
	ntlen = sc.nextInt();
	nt = new char[ntlen];
	grammar = new String[ntlen][];

	for(int i=0; i<ntlen; i++){
		System.out.printf("\nEnter the Non-Terminal:  ");
		nt[i] = (char)sc.next().charAt(0);
		SetofNT.add(nt[i]);
		System.out.printf("\nHow many productions for "+nt[i]+"  ");
		n=sc.nextInt();
		grammar[i] = new String[n];
		
		System.out.printf("\nEnter the productions - Enter 6 for Epsilon\n");				
		for(int j=0; j<n; j++){
			grammar[i][j]=sc.next();
		}
	}
	/*CHECKING INPUT
	
	for(int i=0; i<ntlen; i++)
		for(int j =0; j<grammar[i].length; j++)
			System.out.println(grammar[i][j]);
	*/

	System.out.println("FIRST\t\tFOLLOW\n");
	for(int i=0; i<ntlen; i++)
	System.out.println( first(i)+"\t\t"+follow(i) );

}


	public static Set first(int i) //to find FIRST of ith non terminal
	{
		int flag=0;
		Set FIRST = new HashSet();
		Set FIRST_OF_NEXT_NT = new HashSet();
		for(int j=0; j<grammar[i].length; j++){ // loop through 'j' productions of ith NT

			for(int k=0; k<grammar[i][j].length(); k++) { //loop through all symbols of jth production
				// if the first symbol is a NT
				
				for(int l=0; l<ntlen; l++) {
					
					// finding which NT is to be used
					if( nt[l] == grammar[i][j].charAt(k) ) {
					
						FIRST_OF_NEXT_NT.addAll( first(l) );
						FIRST.addAll( first(l) );
						FIRST.remove('6');		
						flag=1;
						break;

					}
					
				}
					if( flag==1 ){
					
						if( FIRST_OF_NEXT_NT.contains('6') ){
							if( k==grammar[i][j].length()-1 ) {
								FIRST.add('6');
							}
							FIRST_OF_NEXT_NT.clear();
							continue; //check next NT for first
						}
							
					}
					else
					{
						FIRST.add( grammar[i][j].charAt(k) );
						break;

					}
				 	
			}
		}
	return FIRST;
	}



	public static Set follow(int i) //to find FOLLOW of ith non terminal
	{
		int flag=0; 
		Set FOLLOW = new HashSet();
		Set TEMP   = new HashSet();
		// follow of the start symbol
		if(i==0)
		   FOLLOW.add('$');


		// checking all NTs
		for(int j=0; j<ntlen; j++){
			//checking each production for jth NT
			for( int k=0; k<grammar[j].length; k++ ){
				// loop through all symbols to find ith NT
				for(int l=0; l<grammar[j][k].length(); l++) {
					if( grammar[j][k].charAt(l)==nt[i] ) {
						// if NT is last symbol in the production
						if( l==grammar[j][k].length()-1 ) {
							if(j<i)
								FOLLOW.addAll( follow(j) );						

						}
						// Not the last symbol. Find which symbol comes next.
						else {
							for( int m=0; m<ntlen; m++ ) {

								if( nt[m]==grammar[j][k].charAt(l+1) ) {
									flag=1; //next symbol is a NT
									TEMP.clear();
									TEMP.addAll( first(m) );
									if( TEMP.contains('6') ) {
										TEMP.remove('6');
										FOLLOW.addAll( TEMP );

									// if ith NT is second last & next symbol contains 6
										if(l+1==grammar[j][k].length()-1)
											FOLLOW.addAll( follow(j) );
									
										else 
											FOLLOW.addAll( follow(m) );

									}
									else {
										TEMP.remove('6');
										FOLLOW.addAll( TEMP );
									}

								}
							}
							// Next Symbol is a terminal
							if( flag==0 )	
								FOLLOW.add( grammar[j][k].charAt(l+1) );
						}

					}

					


				}
			}
		}
		FOLLOW.remove('6');
		return FOLLOW;
	}


}

/*
/Desktop/javaforspcc$ java ff
How many Non-Terminals ?  4

Enter the Non-Terminal:  S

How many productions for S  1

Enter the productions - Enter 6 for Epsilon
aABC

Enter the Non-Terminal:  A

How many productions for A  2

Enter the productions - Enter 6 for Epsilon
a
bb

Enter the Non-Terminal:  B

How many productions for B  2

Enter the productions - Enter 6 for Epsilon
a
6

Enter the Non-Terminal:  C

How many productions for C  2

Enter the productions - Enter 6 for Epsilon
b
6
FIRST		FOLLOW

[a]		[$]
[a, b]		[a, b, $]
[a, 6]		[b, $]
[b, 6]		[$]
*/

