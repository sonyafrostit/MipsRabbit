/*** Definitions ***/
%{
#include <stdio.h>
#include "lexer.h"
%}
%option noyywrap

/*** Rules ***/
%%
#.* { printf("Found a comment!"); }
[ \n] ;
$[a-zA-z0-9]+ { printf("Found a register: %s", yytext); } 
:[a-zA-z0-9]+  { printf("Found a meta-instruction: %s", yytext); }
[a-zA-z0-9]+: { printf("Found a label: %s", yytext); } 
[a-zA-z0-9]+  { printf("Found an instruction: %s", yytext); } 

%%
/*** C Code ***/

void set_source_stdin() {
	yyin = stdin;
}

void set_source_file(char* s) {
	yyin = fopen(s, "r");
}

void mips_lex() {
	yylex();
}

void cleanup() {
	fclose(yyin);
}
