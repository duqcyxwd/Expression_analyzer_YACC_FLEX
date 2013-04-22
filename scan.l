%{ /* -*- c -*- */
#include <stdio.h>
#include "gram.tab.h"

#undef yywrap
int yywrap();
%}
/* extern YYSTYPE yylval; */

%%
[ \t\r] ;
[0-9]+[.]?[0-9]*	{
    	yylval.anNumber = atof ((char *)&yytext[0]);
	    return NUMBER;
	}

"exp" return EXP;
"log" return LOG;
\n	return NEWLINE;
.	return *yytext;
%%
int
yywrap()
{
    return 1;
}

