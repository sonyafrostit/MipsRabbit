#include <stdio.h>
#include <stdlib.h>
#include "proc_virtual.h"
#include "lexer.h"

int main(int argc, char** argv) {
	if (argc > 1) {
		// File interpreter mode
		set_source_file(argv[1]);
		mips_lex();
	} else {
		// Console mode
		printf("Welcome to the MipsRabbit MIPS interpreter!\n"
		       "To execute an interpreter command, begin the line with the special character ':'\n"
		       "Type :help for a list of commands\n> ");
		set_source_stdin();
		mips_lex();
	}
	return 0;
}
