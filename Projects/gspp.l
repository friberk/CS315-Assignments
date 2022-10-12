%option main
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
symbol  \#|\$|\%|\&|\[|\\|\]|\^|\_|\`|\{|\||\}|\~|\*|\(|\)|\+|\,|\!|\-|\.|\/|\:|\;|\<|\=|\>|\?|\@
character {non_whitespace_character}|{whitespace_character}
non_whitespace_character {symbol}|{letter}|{digit}
whitespace_character [ \n\t]
char_const \'({character})?\'
string_const \"({character})*\"
/* String and char related definitions end */

/* Declaring the definitions for matching numberic and bool constants */
int_const {digit}+
float_const {digit}*(\.)?{digit}+
bool_const true|false
true true
false false
/* Numeric and bool constant related definitions end  */

/* */
comment \/\$(.)*\$\/
/* */

/* */
sensor_data {temperature}|{humidity}|{air_pressure}|{air_quality}|{light_level}|{sound_level}
temperature temperature
humidity humidity
air_pressure air_pressure
air_quality air_quality
light_level light_level
sound_level sound_level

/* */
timestamp timestamp
/* */

/* */
switch_controls {enable_switch}|{disable_switch}
enable_switch enable_switch
disable_switch disable_switch
/* */

/* */
internet_related_calls {check_connection}|{connect_to_url}|{send_int_to_conn}|{recv_int_from_conn}
check_connection check_connection
connect_to_url connect_to_url
send_int_to_conn send_int_to_conn
recv_int_from_conn recv_int_from_conn
/* */

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
{for} printf("FOR ");
{while} printf("WHILE ");
{do} printf("DO ");
{if} printf("IF ");
{else} printf("ELSE ");
{begin} printf("BEGIN ");
{end} printf("END ");
{continue} printf("CONTINUE ");
{break} printf("BREAK ");
{return} printf("RETURN ");
{logical_or_op} printf("LOGICAL_OR_OP ");
{logical_and_op} printf("LOGICAL_AND_OP ");
{equality_op} printf("EQUALITY_OP ");
{inequality_op} printf("INEQUALITY_OP ");
{less_than_op} printf("LESS_THAN_OP ");
{greater_than_op} printf("GREATER_THAN_OP ");
{less_than_or_equal_op} printf("LESS_THAN_OR_EQUAL_OP ");
{greater_than_or_equal_op} printf("GREATER_THAN_OR_EQUAL_OP ");
{addition_op} printf("ADDITION_OP ");
{subtraction_op} printf("SUBTRACTION_OP ");
{multiplication_op} printf("MULTIPLICATION_OP ");
{division_op} printf("DIVISION_OP ");
{int_type} printf("INT_TYPE ");
{float_type} printf("FLOAT_TYPE ");
{long_type} printf("LONG_TYPE ");
{bool_type} printf("BOOL_TYPE ");
{char_type} printf("CHAR_TYPE ");
{string_type} printf("STRING_TYPE ");
{void_type} printf("VOID_TYPE ");
{int_const} printf("INT_CONST ");
{float_const} printf("FLOAT_CONST ");
{true} printf("TRUE ");
{false} printf("FALSE ");
{char_const} printf("CHAR_CONST ");
{string_const} printf("STRING_CONST ");
{temperature} printf("TEMPERATURE ");
{humidity} printf("HUMIDITY ");
{air_pressure} printf("AIR_PRESSURE ");
{air_quality} printf("AIR_QUALITY ");
{light_level} printf("LIGHT_LEVEL ");
{sound_level} printf("SOUND_LEVEL ");
{timestamp} printf("TIMESTAMP ");
{enable_switch} printf("ENABLE_SWITCH ");
{disable_switch} printf("DISABLE_SWITCH ");
{check_connection} printf("CHECK_CONNECTION ");
{connect_to_url} printf("CONNECT_TO_URL ");
{send_int_to_conn} printf("SEND_INT_TO_CONN ");
{recv_int_from_conn} printf("RECV_INT_FROM_CONN ");
{start_symbol} printf("START_SYMBOL ");
{end_symbol} printf("END_SYMBOL ");
{semicolon} printf("SEMICOLON ");
{comma} printf("COMMA ");
{left_parentheses} printf("LP ");
{right_parentheses} printf("RP ");
{assignment_op} printf("ASSIGNMENT_OP ");
{comment} printf("COMMENT ");
{identifier} printf("IDENTIFIER ");
{whitespace_character} printf("%s", yytext);
. ;
