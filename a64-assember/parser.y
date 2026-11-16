%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;      /* flex provides this */
int yylex(void);
void yyerror(const char *s);
%}

%define parse.error verbose
%define parse.trace
%debug

%token REG
%token CMP 
%token MOV
%token ADD SUB MUL MLA
%token ORR AND
%token LSL LSR ASR ROR
%token B BL BX
%token LDR STR LDRB STRB 
%token COMMA
%token IMM
%token COMMENT
%token MEMORYVAR
%token DATASECTION TEXTSECTION GLOBALSECTION

/* labels */
%token LABELCOLON

%%  
program
    : stmt_list
    ;

stmt_list
    : stmt_list stmt
    | stmt
    ;

    stmt
    : DATASECTION
    | TEXTSECTION
    | GLOBALSECTION
    | COMMENT
		// compare
    | CMP REG ',' REG

		// add
    | ADD REG ',' REG ',' REG

		// subtract
    | SUB REG ',' REG ',' REG
		
		// load register instructions: 
		// initialization 
		// offset 
		// post-index 
		// pre-index

		// addressing register initialization:
    | LDR REG ',' MEMORYVAR

		// offset addressing:
    | LDR REG ',' '[' REG ']'

		// offset with immediate
    | LDR REG ',' '[' REG ',' IMM ']'

		// offset with register
    | LDR REG ',' '[' REG ',' REG ']'

		// post-index addressing:

		// post-index with immediate
    | LDR REG ',' '[' REG ']' ',' IMM

		// post-index with register
    | LDR REG ',' '[' REG ']' ',' REG

		// pre-index addressing:

		// pre-index with immediate
    | LDR REG ',' '[' REG ',' IMM ']' '!'

		// pre-index with register
    | LDR REG ',' '[' REG ',' REG ']' '!'

		// move
    | MOV REG ',' REG
    | MOV REG ',' IMM 
    | LABELCOLON
    ;
    

%%  /* ====== PLAIN C CODE SECTION ====== */

extern int yylineno; 
extern char *yytext;

int main(int argc, char **argv) {
	int yydebug = 1;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <inputfile>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("fopen");
        return 1;
    }

    int rc = yyparse();
    fclose(yyin);
    return rc;
}


void yyerror(const char *s) {
    fprintf(stderr, "Error: %s at line %d near '%s'\n", s, yylineno, yytext);
}

