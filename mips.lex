/*** Definitions ***/
%{
#include <stdio.h>
#include "lexer.h"
#define FALSE 0
#define TRUE 0
%}
%option noyywrap

/*** Rules ***/
%%
#.* { printf("Found a comment!"); }
[ \n] ;
$[a-zA-z0-9]+ { printf("Found a register: %s", yytext); } 
:[a-zA-z]+  { printf("Found a meta-instruction: %s", yytext); }
[a-zA-z0-9]+: { printf("Found a label: %s", yytext); } 
[a-zA-z]+  { printf("Found an instruction: %s", yytext); } 
add
addi
addiu
addu
and
andi
beq
beql
bgez
bgezal
bgezall
bgezl
bgtz
bgtzl
blez
blezl
bltz
bltzal
bltzall
bltzl
bne
bnel
break
cop0
cop1
cop2
cop3
dadd
daddi
daddiu
daddu
ddiv
ddivu
div
divu
dmult
dmultu
dsll
dsll32
dsllv
dsra
dsra32
dsrav
dsrl
dsrl32
dsrlv
dsub
dubu
j
jal
jalr
jr
lb
lbu
ld
ldc0
ldc1
ldc2
ldc3
ldl
ldr
lh
lhu
ll
lld
lui
lw
lwc0
lwc1
lwc2
lwc3
lwl
lwr
lwu
mfhi
mflo
movn
movz
mthi
mtlo
mult
multu
nor
or
ori
pref
sb
sc
scd
sd
sdc0
sdc1
sdc2
sdc3
sdl
sdr
sh
sll
sllv
slt
slti
sltiu
sltu
sra
srav
srl
srlv
sub
subu
sw
swc0
swc1
swc2
swc3
swl
swr
sync
syscall
teq
teqi
tgeiu
tgeu
tlt
tlti
tltiu
tltu
tne
tnei
xor
xori
%%

/*** C Code ***/
// Lexer flags
unsigned char file_open = FALSE;

void set_source_stdin() {
	if (file_open)
		fclose(yyin);
	yyin = stdin;
	file_open = FALSE;
}

void set_source_file(char* s) {
	if (file_open)
		fclose(yyin);
	file_open = TRUE;
	yyin = fopen(s, "r");
}

void mips_lex() {
	yylex();
}

void cleanup() {
	fclose(yyin);
}
