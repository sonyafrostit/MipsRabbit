#ifndef PARSER_H
#define PARSER_H

typedef struct instruction {
	Instruction* next;
	char* line;
} Instruction;

typedef struct program {
	int lines;
	// When a program is loaded in, we add it to a singly linked list for later parsing and for debugging
	Instruction* start;
	Instruction* end;
} Program; 

// Program constructor.
void init_program(Program* loc) {
	loc->lines = 0;
	loc->start = NULL;
	loc->end = NULL;
}

// And destructor
void cleanup_program(Program* loc) {
	Instruction* itr = loc->start;
	while (itr != NULL) {
		free(itr->line);
		Instruction* prev_itr = itr;
		itr = itr->next;
		free(prev_itr);
	}
	loc->start = NULL;
	loc->end = NULL;
}

void append_instruction(Program* prog, char* inst) {
	prog->end->next = (Instruction*) malloc(sizeof(Instruction));
	prog->end = prog->end->next;
	
}

#endif
