/* Declaring the definitions for matching Identifiers */
initial {letter}|\$|\_
letter [a-zA-Z]
digit [0-9]
final {initial}|{digit}
identifier {initial}({final})*
/* Identifier related definitions end */

/* Declaring the definitions for matching Loops */
loop_stmt {for}|{while}|{do}
for for
while while
do do
/* Loop related definitions end */

/* Declaring the definitions for matching if-else statements  */
if if
elseif elseif
else else
/* if-else related definitions end */

/* Declaring the definitions for matching block statements  */
begin begin
end end
/* Block related definitions end */

/* Declaring the definitions for matching jump statements  */
jump_stmt {break}|{continue}|{return}
continue continue
break break
return return
/* Jump related definitions end */

/* Declaring the definitions for matching arithmetic, relational, and logical operators  */
logical_or_op \|\|
logical_and_op \&\&
equality_op \=\=
inequality_op \!\=
less_than_op \<
greater_than_op \>
less_than_or_equal_op \<\=
greater_than_or_equal_op \>\=
addition_op \+
subtraction_op \-
multiplication_op \*
division_op \/
/* Arithmetic, relational, and logical operator related definitions end */

/* Declaring the definitions for matching data types  */
data_type {int_type}|{float_type}|{long_type}|{bool_type}|{char_type}|{string_type}
int_type int
long_type long
string_type string
bool_type bool
char_type char
float_type float
/* Data type related definitions end */

/* Declaring the definitions for matching return types */
return_type {data_type}|{void_type}
void_type void
/* Return type related definitions end */

/* Declaring the definitions for matching string and chars  */
char_const \'(.)?\'
string_const \"(.)*\"
/* String and char related definitions end */

/* Declaring the definitions for matching numberic and bool constants */
int_const {digit}+
float_const {digit}*(\.)?{digit}+
bool_const {true}|{false}
true true
false false
/* Numeric and bool constant related definitions end  */

/* Declaring the definitions for comments */
comment \/\$(.)*\$\/
/* Comment related definitions end */

/* Declaring the definitions for IoT device sensors */
sensor_data {temperature}|{humidity}|{air_pressure}|{air_quality}|{light_level}|{sound_level}
temperature temperature
humidity humidity
air_pressure air_pressure
air_quality air_quality
light_level light_level
sound_level sound_level
/* IoT device sensor related definitions end */

/* Declaring the definitions for IoT device timer */
timestamp timestamp
/* IoT device timer related definitions end */

/*  Declaring the definitions for IoT switch controls */
switch_controls {enable_switch}|{disable_switch}
enable_switch enable_switch
disable_switch disable_switch
/* IoT switch control related definitions end */

/* Declaring the definitions for IoT device connections */
internet_related_calls {check_connection}|{connect_to_url}|{send_int_to_conn}|{recv_int_from_conn}
check_connection check_connection
connect_to_url connect_to_url
send_int_to_conn send_int_to_conn
recv_int_from_conn recv_int_from_conn
/* IoT device connections related definitions end */

/* Declaring the definitions for input output functions */
input_output_related_calls {input}|{output}|{formatted_output}
input input
output output
formatted_output outputf
/* Input output function related definitions end */

/* Declaring the definitions for matching general purpose lexemes */
start_symbol (\<\?gs\+\+)
end_symbol (\?\>)
semicolon ;
comma ,
left_parentheses \(
right_parentheses \)
assignment_op \=
/* General purpose lexeme related definitions end  */

%%
{for} return (FOR);
{while} return (WHILE);
{do} return (DO);
{if} return (IF);
{elseif} return (ELSEIF);
{else} return (ELSE);
{begin} return (BEGIN_);
{end} return (END);
{continue} return (CONTINUE);
{break} return (BREAK);
{return} return (RETURN);
{logical_or_op} return (LOGICAL_OR_OP);
{logical_and_op} return (LOGICAL_AND_OP);
{equality_op} return (EQUALITY_OP);
{inequality_op} return (INEQUALITY_OP);
{less_than_op} return (LESS_THAN_OP);
{greater_than_op} return (GREATER_THAN_OP);
{less_than_or_equal_op} return (LESS_THAN_OR_EQUAL_OP);
{greater_than_or_equal_op} return (GREATER_THAN_OR_EQUAL_OP);
{addition_op} return (ADDITION_OP);
{subtraction_op} return (SUBTRACTION_OP);
{multiplication_op} return (MULTIPLICATION_OP);
{division_op} return (DIVISION_OP);
{int_type} return (INT_TYPE);
{float_type} return (FLOAT_TYPE);
{long_type} return (LONG_TYPE);
{bool_type} return (BOOL_TYPE);
{char_type} return (CHAR_TYPE);
{string_type} return (STRING_TYPE);
{void_type} return (VOID_TYPE);
{int_const} {sscanf(yytext, "%d", &yylval.int_val); return (INT_CONST);}
{float_const} {sscanf(yytext, "%lf", &yylval.float_val); return (FLOAT_CONST);}
{true} {yylval.bool_val = true; return (BOOL_CONST);}
{false} {yylval.bool_val = false; return (BOOL_CONST);}
{char_const} {yylval.char_val = yytext[0]; return (CHAR_CONST);}
{string_const} {strcpy(yylval.string_val, yytext); return (STRING_CONST);};
{temperature} return (TEMPERATURE);
{humidity} return (HUMIDITY);
{air_pressure} return (AIR_PRESSURE);
{air_quality} return (AIR_QUALITY);
{light_level} return (LIGHT_LEVEL);
{sound_level} return (SOUND_LEVEL);
{timestamp} return (TIMESTAMP);
{enable_switch} return (ENABLE_SWITCH);
{disable_switch} return (DISABLE_SWITCH);
{check_connection} return (CHECK_CONNECTION);
{connect_to_url} return (CONNECT_TO_URL);
{send_int_to_conn} return (SEND_INT_TO_CONN);
{recv_int_from_conn} return (RECV_INT_FROM_CONN);
{input} return (INPUT);
{output} return (OUTPUT);
{formatted_output} return (FORMATTED_OUTPUT);
{start_symbol} return (START_SYMBOL);
{end_symbol} return (END_SYMBOL);
{semicolon} return (SEMICOLON);
{comma} return (COMMA);
{left_parentheses} return (LP);
{right_parentheses} return (RP);
{assignment_op} return (ASSIGNMENT_OP);
{comment} return (COMMENT);
{identifier} return (IDENTIFIER);
[\n] {extern int line_number; line_number = line_number + 1;}
[ \t] ;
[!-~] return (INVALID);
. ;

%%
int yywrap() { return 1; }
