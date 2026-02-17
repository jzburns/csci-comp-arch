#!/bin/bash

## This creates:
## parser.tab.c → parser implementation
## parser.tab.h → token definitions
bison -d parser.y

## This creates:
## lex.yy.c = lexer implementation
flex lexer.l

## compile everything
clang lex.yy.c parser.tab.c -o arm7assembler -lfl
