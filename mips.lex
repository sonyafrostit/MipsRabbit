/*** Definitions ***/
%{
#include <stdio.h>
%}
%option noyywrap

/*** Rules ***/
%%
[ \n] ;
$[a-zA-z0-9]+ { printf("Found an instruction: %s", yytext); } 
[a-zA-z0-9]+: { printf("Found a label: %s", yytext); } 
[a-zA-z0-9]+  { printf("Found an instruction: %s", yytext); } 
%%
/*** C Code ***/

main() {
	yylex();
}
