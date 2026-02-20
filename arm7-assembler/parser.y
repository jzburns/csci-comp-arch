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

/* ARM7DTMI uconditional execution tokens */
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

/* labels */
%token LABELCOLON

%%  
program
    : stmt_list
    ;

stmt_list
    : stmt_list stmt
    | stmt
    | comment
    ;

comment
    : COMMENT 
    ;
    
stmt
    : CMP REG COMMA REG
    | CMP REG COMMA REG COMMENT
    | ADD REG COMMA REG COMMA REG
    | ADD REG COMMA REG COMMA REG COMMENT
    | SUB REG COMMA REG COMMA REG
    | SUB REG COMMA REG COMMA REG COMMENT
    | LDRB REG COMMA REG COMMA REG
    | LDRB REG COMMA REG COMMA REG COMMENT
    | MOV REG COMMA REG 
    | MOV REG COMMA REG COMMENT
    | MOV REG COMMA IMM 
    | MOV REG COMMA IMM  COMMENT
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

