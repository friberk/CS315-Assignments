%option main
/* Declaring the definitions for matching Identifiers */
initial {letter}|\$|\_
letter [a-zA-Z]
digit [0-9]
semicolon ;
final {initial}|{digit}
identifier {initial}({final})*
loop_stmt {for}|{while}|{do}
for for
while while
do do
if if
else else
begin begin
end end
comment \/\$(.)*\$\/
lp \(
rp \)
int_type int
long_type long
string_type string
bool_type bool
char_type char
float_type float
/* only in function return type */
void_type void
/* Definitions for Integer constants */
plus_op \+
minus_op \-
int_const {digit}+
%%
{plus_op} printf("PLUS_OP ");
{minus_op} printf("MINUS_OP ");
{int_const} printf("INT_CONST ");
{int_type} printf("INT_TYPE ");
{long_type} printf("FLOAT_TYPE ");
{string_type} printf("STRING_TYPE ");
{bool_type} printf("BOOL_TYPE ");
{char_type} printf("CHAR_TYPE ");
{float_type} printf("FLOAT_TYPE ");
{void_type} printf("VOID_TYPE ");
{lp} printf("LP ");
{rp} printf("RP ");
{comment} printf("COMMENT ");
{begin} printf("BEGIN ");
{end} printf("END ");
{if} printf("IF ");
{else} printf("ELSE ");
{for}  printf("FOR ");
{while} printf("WHILE ");
{do} printf("DO ");
{semicolon} printf("SEMICOLON ");
{identifier} printf("IDENTIFIER ");
