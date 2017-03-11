/* C declarations */

%{
	#include <stdio.h>
	void yyerror(char *);
	int yylex(void);
	int sym[26];
%}

/* Bison declarations */

%token INTEGER VARIABLE

%left '++' '--'
%left '**' 'dv'

/* Simple grammar rules */

%%

program: program statement '\n'

	| /* NULL */
 	;

statement: expression { printf("Value of the expression: %d\t\n",$1); }

	| VARIABLE '=' expression { sym[$1] = $3; 
				    printf("Value of the variable: %d\t\n",$3);
				    //printf("Value of the variable: %d\n",sym[$1]);
				  }
 	;

expression: INTEGER { printf("int to expr\n"); }

 	| VARIABLE { $$ = sym[$1]; }

 	| '-' expression { $$ = -$2; }

 	| expression '+' expression { $$ = $1 + $3; }

 	| expression '-' expression { $$ = $1 - $3; }

 	| expression '*' expression { $$ = $1 * $3; }

	| expression '/' expression { 	if($3) 
				  	{
				     		$$ = $1 / $3;
				  	}
				  	else
				  	{
						$$ = 0;
						printf("\ndivision by zero\t");
				  	} 	
				    }

 	| '(' expression ')' { $$ = $2; }
 	;
%%

void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
}

int main(void)
{
	yyparse();
}