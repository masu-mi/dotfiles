%{
package main

import (
  "errors"
  "io"
)

type Expression interface{}
type Token struct {
    token   int
    literal string
}

type NumExpr struct {
    literal string
    token   int
}
type BinOpExpr struct {
    left     Expression
    operator rune
    right    Expression
}
%}

%union{
    token Token
    expr  Expression
}

%type<expr> program
%type<expr> expr
%token<token> NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')' '<' '>' '{' '}' '[' ']'

%%

program
    : expr
    {
        $$ = $1
        yylex.(*Lexer).result = $$
    }

expr
    : NUMBER
    {
        $$ = NumExpr{literal: $1.literal, token: $1.token}
    }
    | '<' expr '>'
    { $$ = $2 }
    | '(' expr ')'
    { $$ = $2 }
    | '{' expr '}'
    { $$ = $2 }
    | '[' expr ']'
    { $$ = $2 }
    | expr '+' expr
    { $$ = BinOpExpr{left: $1, operator: '+', right: $3} }
    | expr '-' expr
    { $$ = BinOpExpr{left: $1, operator: '-', right: $3} }
    | expr '*' expr
    { $$ = BinOpExpr{left: $1, operator: '*', right: $3} }
    | expr '/' expr
    { $$ = BinOpExpr{left: $1, operator: '/', right: $3} }

%%

func parse(r io.Reader) (*Lexer, error) {
  l := new(Lexer)
  l.Init(r)
  if yyParse(l) != 0 {
    return l, ErrParse
  }
  return l, nil
}
