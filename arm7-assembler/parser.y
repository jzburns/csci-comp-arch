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

%%  /* ====== GRAMMAR RULES SECTION ====== */

input:
      expr                { printf("Result = %d\n", $1); }
    ;

expr:
      expr PLUS term       { $$ = $1 + $3; }
    | expr CMP term        { $$ = $1 + $3; }
    | expr MINUS term      { $$ = $1 - $3; }
    | term                 { $$ = $1; }
    ;

term:
      term MUL factor      { $$ = $1 * $3; }
    | term DIV factor      { $$ = $1 / $3; }
    | factor               { $$ = $1; }
    ;

factor:
      NUMBER               { $$ = $1; }
    | LPAREN expr RPAREN   { $$ = $2; }
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

