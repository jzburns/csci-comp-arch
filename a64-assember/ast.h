typedef enum {
    AST_PROGRAM,
    AST_FUNC,
    AST_BLOCK,
    AST_VARDECL,
    AST_ASSIGN,
    AST_RETURN,
    AST_BINOP,
    AST_IDENT,
    AST_INT
} AstKind;

typedef enum {
    TYPE_INT,
    TYPE_VOID,
    TYPE_ERROR
} Type;
