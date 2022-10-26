LEX_FILE := CS315f22_team18.lex
YACC_FILE := CS315f22_team18.yacc

CXX        := gcc

SRC        := .
EXECUTABLE := parser

all: clean generate_parser

check_valid_programs: all
	@-$(SRC)/$(EXECUTABLE) < CS315f22_team18_example_valid_programs.txt

check_faulty_programs: all
	@-$(SRC)/$(EXECUTABLE) < CS315f22_team18_example_faulty_programs.txt ||:

generate_yacc: $(SRC)/$(LEX_FILE) $(SRC)/$(YACC_FILE)
	@-yacc -o $(SRC)/y.tab.c $(SRC)/$(YACC_FILE)
	@-lex -o $(SRC)/lex.yy.c $(SRC)/$(LEX_FILE)

generate_parser: generate_yacc
	@-$(CXX) $(SRC)/y.tab.c -o $(SRC)/$(EXECUTABLE)

clean:
	@-rm -f $(SRC)/lex.yy.c
	@-rm -f $(SRC)/y.tab.c
	@-rm -f $(SRC)/$(EXECUTABLE)