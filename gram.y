%{
#include <stdio.h>
#include <math.h>
%}

%token <anNumber>	NUMBER NEWLINE LOG EXP
%type <anNumber>	S E T F P

%right '^'

%union {
	double anNumber;
}

%%
S	:
	{ $$ = 0; }
	| S E NEWLINE 
	{ printf( "Result is %f\n", $2 ); $$ = 0; 
	} 
	;

E	:E '+' T
	{ $$ = $1 + $3;}

	|E '-' T
	{ $$ = $1 - $3;}

	| T
	{ $$ = $1;}

	;

T   :T '*' P
	{ $$ = $1 * $3;}

	|T '/' P
	{ $$ = $1 / $3;}

	| P
	{ $$ = $1;}
	;

P 	: P '^' P
	{ $$ = pow($1,$3);}

	| LOG '(' F ')'
	{ $$ = log($3); }

	| EXP '(' F ')'
	{ $$ = exp($3);}

	| F
	{ $$ = $1;}
	;

F   : '(' E ')'
	{ $$ = $2;}

	| NUMBER
	{ $$ = $1;}
	;
%%
int
yyerror( char * s )
{
    fprintf( stderr, "%s\n", s );
    return 0;
}
