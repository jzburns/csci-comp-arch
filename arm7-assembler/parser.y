%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;      /* flex provides this */
int yylex(void);
void yyerror(const char *s);
%}

/* Tokens */
%token NUMBER
%token PLUS MINUS MUL DIV LPAREN RPAREN
/* ARM7DTMI tokens */
%token CMP ADD SUB MLA
%token ORR AND  
%token LSL LSR ASR ROR
%token B BL BX
%token LDR STR LDRB STRB 

%%  
program
    : stmt_list
    ;

stmt_list
    : stmt_list stmt
    | stmt
    ;

stmt
    : CMP IDENT '=' expr ';'
    | PRINT expr ';'
    ;

expr
    : expr '+' term
    | term
    ;

term
    : NUMBER
    | IDENT
    ;
%%  /* ====== PLAIN C CODE SECTION ====== */

int main(int argc, char **argv) {
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
    fprintf(stderr, "Error: %s\n", s);
}

