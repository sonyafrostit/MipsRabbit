#include <stdio.h>
#include <stdlib.h>
#include "proc_virtual.h"


int main(int argc, char** argv) {
	if (argc > 1) {
		// File interpreter mode
		FILE * interpret_file = fopen(argv[1], "r");
		char* current_line = (char*) malloc(sizeof(char) * 256);
		while (fscanf(interpret_file, "%[^\n]%*[\n]", current_line) != EOF) {
			printf("%s\n", current_line);
		}
		free(current_line);
	} else {
		// Console mode
		printf("Welcome to the MipsRabbit MIPS interpreter!\n"
		       "To execute an interpreter command, begin the line with the special character ':'\n"
		       "Type :help for a list of commands\n> ");
		char* current_line = (char*) malloc(sizeof(char) * 256);
		while (scanf("%[^\n]%*[\n]", current_line) != EOF) {
			printf("%s\n", current_line);
		}
		free(current_line);
	}
	return 0;
}
