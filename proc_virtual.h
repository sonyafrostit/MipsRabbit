#ifndef PROC_VIRTUAL_H
#define PROC_VIRTUAL_H

typedef struct proc_virt {
	
} ProcVirt;

typedef struct current_program {
	int lines;
	char** buffer;
} Program; 

void init_program(Program* loc) {
	loc->buffer = (char*) malloc(sizeof(char*));
}

void clean_program(Program* loc) {
	free(loc->buffer);
}

#endif
