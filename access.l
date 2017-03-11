

%%

hash {printf("# is identified as hash\n");}
tag  {printf("include is identified as tag\n");}
LAB  {printf("left angle bracket is identified as LAB\n");}
RAB  {printf("right angle bracket is identified as RAB\n");}
TYPE {printf("A variable type is identified\n");}
TYPE[:][a-z][a-z][a-z] 	{printf("A variable type of %s is identified\n",yytext);}
ID[a-z]   {printf("A variable name= %s is identified\n",yytext);}
comma  {printf("(,) is identified\n");}
semi  {printf("semi-colon is identified\n");}
[/]  {printf("single line comment is identified\n");}
MS[a-zA-Z0-9]*ME     {printf("multiple  line comment is identified\n");}
LB   {printf("second bracket started\n");}
RB   {printf("second bracket closed\n");}
main  {printf("main function identified\n");}
FBS    {printf("First parenthesis startted\n");}
FBC    {printf("First parenthesis closed\n");}
EQ   {printf("= sign is found as EQ\n");}
[+][+]    {printf("Addition sign is identified  as ++ \n");}
[-][-]    {printf("Minus sign is identified  as --\n");}
[*][*]    {printf("Multiplication sign is identified as **\n");}
dv     {printf("Division sign is identified  as dv\n");}
[<][-]   {printf("Assignment sign is identified  as <- \n");}
md  {printf("modulus sign is identified  as md \n");}
CONDITION  {printf("if condition started\n");}
GT      {printf("greater than sign is identified as GT \n");}
give[ ][0]    {printf("return 0 found as give 0\n");}

.	
%%

int yywrap()
{
	return 1;
}

int main()
{
	
            yyin = fopen( "source.txt", "r" );
			yyout = fopen( "out.txt", "w" );
	    
	yylex();
	return 0;
}