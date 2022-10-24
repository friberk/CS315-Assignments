%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int yylex();
void yyerror(char *s);
%}

%union {
    int int_val;
    double float_val;
    bool bool_val;
    char char_val;
    char string_val[30];
}

%token FOR WHILE DO IF ELSE BEGIN_ END CONTINUE BREAK RETURN LOGICAL_OR_OP LOGICAL_AND_OP
       EQUALITY_OP INEQUALITY_OP LESS_THAN_OP GREATER_THAN_OP LESS_THAN_OR_EQUAL_OP
       GREATER_THAN_OR_EQUAL_OP ADDITION_OP SUBTRACTION_OP MULTIPLICATION_OP DIVISION_OP
       INT_TYPE FLOAT_TYPE LONG_TYPE BOOL_TYPE CHAR_TYPE STRING_TYPE VOID_TYPE TEMPERATURE
       HUMIDITY AIR_PRESSURE AIR_QUALITY LIGHT_LEVEL SOUND_LEVEL TIMESTAMP ENABLE_SWITCH
       DISABLE_SWITCH CHECK_CONNECTION CONNECT_TO_URL SEND_INT_TO_CONN RECV_INT_FROM_CONN
       START_SYMBOL END_SYMBOL SEMICOLON COMMA LP RP ASSIGNMENT_OP COMMENT IDENTIFIER

%token <int_val> INT_CONST
%token <float_val> FLOAT_CONST
%token <bool_val> BOOL_CONST
%token <char_val> CHAR_CONST
%token <string_val> STRING_CONST

%%
program_list: program_list program
             | program
             ;
program: START_SYMBOL stmt_list END_SYMBOL;
stmt_list: stmt SEMICOLON
         | stmt SEMICOLON stmt_list
         | COMMENT stmt_list
         | COMMENT
         ;
stmt: if_stmt
    | other_stmt
    ;
if_stmt: IF LP expr RP block_stmt
       | IF LP expr RP block_stmt ELSE block_stmt
       ;
/* stmt: matched
    | unmatched
    ; */
/* matched: IF LP expr RP matched ELSE matched /*bak
       | other_stmt
       ;
unmatched: IF LP expr RP stmt
         | IF LP expr RP matched ELSE unmatched
         ; */
other_stmt: declaration_stmt
          | assign_stmt
          | loop_stmt
          | block_stmt
          | jump_stmt
          | func_definition
          | expr
          ;
declaration_stmt: data_type identifier_list
                | data_type identifier_list ASSIGNMENT_OP expr
                | data_type identifier_list ASSIGNMENT_OP assign_stmt
                ;
assign_stmt: identifier_list ASSIGNMENT_OP assign_stmt
           | identifier_list ASSIGNMENT_OP expr
           ;
loop_stmt: WHILE LP expr RP stmt
         | DO stmt WHILE LP expr RP
         | FOR LP declaration_stmt SEMICOLON expr SEMICOLON assign_stmt RP stmt
         | FOR LP assign_stmt SEMICOLON expr SEMICOLON assign_stmt RP stmt
         | FOR LP SEMICOLON expr SEMICOLON assign_stmt RP stmt
         | FOR LP assign_stmt SEMICOLON expr SEMICOLON RP stmt
         | FOR LP declaration_stmt SEMICOLON expr SEMICOLON RP stmt
         | FOR LP SEMICOLON expr SEMICOLON RP stmt
         ;
block_stmt: BEGIN_ stmt_list END;
jump_stmt: CONTINUE
         | BREAK
         | RETURN
         | RETURN expr
         ;
expr: cond_expr;
cond_expr: or_expr;
or_expr: or_expr LOGICAL_OR_OP and_expr
       | and_expr
       ;
and_expr: and_expr LOGICAL_AND_OP equality_expr
        | equality_expr
        ;
equality_expr: equality_expr EQUALITY_OP relational_expr
             | equality_expr INEQUALITY_OP relational_expr
             | relational_expr
             ;
relational_expr: relational_expr LESS_THAN_OP additive_expr
               | relational_expr GREATER_THAN_OP additive_expr
               | relational_expr LESS_THAN_OR_EQUAL_OP additive_expr
               | relational_expr GREATER_THAN_OR_EQUAL_OP additive_expr
               | additive_expr
               ;
additive_expr: additive_expr ADDITION_OP multiplicative_expr
             | additive_expr SUBTRACTION_OP multiplicative_expr
             | multiplicative_expr
             ;
multiplicative_expr: multiplicative_expr MULTIPLICATION_OP primary_expr
                   | multiplicative_expr DIVISION_OP primary_expr
                   | primary_expr
                   ;
primary_expr: LP expr RP
            | IDENTIFIER
            | constant
            | func_call
            | sensor_data
            | TIMESTAMP
            ;
identifier_list: IDENTIFIER
               | IDENTIFIER COMMA identifier_list
               ;
data_type: INT_TYPE
         | FLOAT_TYPE
         | LONG_TYPE
         | BOOL_TYPE
         | CHAR_TYPE
         | STRING_TYPE
         ;
constant: INT_CONST
        | FLOAT_CONST
        | BOOL_CONST
        | CHAR_CONST
        | STRING_CONST
        ;
func_definition: VOID_TYPE IDENTIFIER LP RP block_stmt
               | VOID_TYPE IDENTIFIER LP param_list RP block_stmt
               | data_type IDENTIFIER LP RP block_stmt
               | data_type IDENTIFIER LP param_list RP block_stmt
               ;
param_list: param | param COMMA param_list;
param: data_type IDENTIFIER;
func_call: switch_controls
         | internet_related_calls
         | IDENTIFIER LP RP
         | IDENTIFIER LP arg_list RP
         ;
arg_list: expr | expr COMMA arg_list;
sensor_data: TEMPERATURE
           | HUMIDITY
           | AIR_PRESSURE
           | AIR_QUALITY
           | LIGHT_LEVEL
           | SOUND_LEVEL
           ;
switch_controls: enable_switch
               | disable_switch
               ;
enable_switch: ENABLE_SWITCH LP INT_CONST RP {if (!($3 >= 0 && $3 <= 9)) {yyerror("syntax error"); yyerrok;}};
disable_switch: DISABLE_SWITCH LP INT_CONST RP {if (!($3 >= 0 && $3 <= 9)) {yyerror("syntax error"); yyerrok;}};
internet_related_calls: check_connection
                      | connect_to_url
                      | send_int_to_conn
                      | recv_int_from_conn
                      ;
check_connection: CHECK_CONNECTION LP expr RP;
connect_to_url: CONNECT_TO_URL LP expr COMMA expr RP;
send_int_to_conn: SEND_INT_TO_CONN LP expr COMMA expr RP;
recv_int_from_conn: RECV_INT_FROM_CONN LP expr RP;

/*
grammar rules
*/

%%
#include "lex.yy.c"
int line_number = 1;
bool error = false;

void yyerror(char *s) {
    error = true;
    printf("[%s] Syntax error on line %d!\n", s, line_number);
}

int main() {
    yyparse();
    if (error == false) {
        printf("Input program is valid\n");
        return 0;
    }
    else {
        return 1;
    }
}
