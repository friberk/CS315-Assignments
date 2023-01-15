import 'dart:math';

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return "Person(name = $name, age = $age)";
  }
}

class Wrapper {
  int first;

  Wrapper(this.first);

  @override
  String toString() {
  return "Wrapper(first = $first)";
  }
}

void main() {

  print("SUBPROGRAMS IN DART\n");

  print("PART 1: NESTED SUBPROGRAM DEFINITIONS -----------------------------------------\n");

  print("SAMPLE 1 ----------------------------------------------------------------------\n");
  double circleCircumference(double radius) {
    print("in circleCircumference(radius = $radius)\n");

    // Calculate the circumference for the semi-cirle
    double forSemiCirle(double radius) {
      print("in forSemiCircle(radius = $radius)");
      print("calculating the circumference of the semi-circle of radius $radius");

      double result = pi * radius;

      // Format the output to 2 decimal places
      print(" and the result is ${result.toStringAsFixed(2)}\n");

      return result;
    }

    // Return the full circumference
    return 2 * forSemiCirle(radius);
  }

  // ERROR: The function 'forSemiCircle' is not defined.
  // double half = forSemiCircle(5);

  // Format the output to 2 decimal places
  print("circumference of a circle of radius 5 is: " + circleCircumference(5).toStringAsFixed(2));

  print("\nSAMPLE 2 ----------------------------------------------------------------------\n");

  List makePairs(int a, int b){
    print("in makePairs(a = $a, b = $b)");

    List wrapper() {
      print("  in wrapper()");
      List foo() {
        print("    in foo(), foo() is returning a pair of [a, bar() = b]");
        int bar() {
          print("      in bar() and bar() is returning b = $b");
          return b;
        }

        return [a, bar()];
      }

      return foo();
    }

    return wrapper();
  }

  print("\nList pair of 4 and 6 is: " + makePairs(4, 6).toString());

  print("\nPART 2: SCOPE OF LOCAL VARIABLES ----------------------------------------------\n");

  print("SAMPLE 1 ----------------------------------------------------------------------\n");

  int g = 8;
  void foo() {
    print("in foo() g = $g, g is in main()");

    int x = 1;
    print("in foo() x = $x, x is in foo()");

    // ERROR: The name 'x' is already defined.
    // int x = 2;

    int t = 7;
    print("in foo() t = $t, t is in foo()");

    void bar() {
      print("  in bar() x = $x, x is in foo()",);
      x = 4; // Update x which is located in foo()
      print("  in bar() x = $x, x in foo() is changed to 4");

      int t = 3;
      print("  in bar() t = $t, t is in bar()");

      int y = 2;
      print("  in bar() y = $y, y is in bar()");
    }


    bar();

    print("in foo() t = $t, t is in foo()");

    // ERROR: Undefined name 'y'.
    // print("in foo() y = $y, y is in bar()");

    print("in foo() x = $x, x is in foo()");
  }

  foo();

  // ERROR: Undefined name 'x'.
  // print("in main() x = $x, x is in foo()");

  print("in main() g = $g, g is in main()");

  print("\nPART 3: PARAMETER PASSING METHODS ---------------------------------------------\n");

  print("SAMPLE 1: PASS BY VALUE -------------------------------------------------------\n");

  void variableChanger(int x, String s) {
    print("  executing variableChanger(x = $x, s = $s)");
    x = 2;
    s = "changed";
    print("  in variableChanger, x is changed to $x, s is changed to '$s'");
  }

  int x = 1;
  String s = "unchanged";
  print("in main() x = $x, s = $s");
  variableChanger(x, s);
  print("in main() x = $x, s = $s, x and s are not changed");

  print("\nSAMPLE 1.1: PASS BY VALUE -----------------------------------------------------\n");

  void inverter(bool b) {
    print("  executing inverter(b = $b)");
    b = !b;
    print("  in inverter, b is changed to $b");
  }

  bool b = true;
  print("in main() b = $b");
  inverter(b);
  print("in main() b = $b, b is not changed");

  print("\nSAMPLE 2: PASS BY REFERENCE ---------------------------------------------------\n");

  void listChanger(List<int> list) {
    print("  executing listChanger(list = $list)");
    list[0] = 2;
    print("  in listChanger, list[0] is changed to ${list[0]}");
  }

  List<int> list = [1, 2, 3];
  print("in main() list = $list");
  listChanger(list);
  print("in main() list = $list, list[0] is changed");

  print("\nSAMPLE 2.1: PASS BY REFERENCE -------------------------------------------------\n");

  var map = {'a': 1, 'b': 2, 'c': 3};

  void mapChanger(Map<String, int> map) {
    print("  executing mapChanger(map = $map)");

    for (var key in map.keys) {
      map[key] = map[key]! * 2;
    }

    print("  in mapChanger, map is changed to ${map}");
  }

  print("in main() map = $map");
  mapChanger(map);
  print("in main() map = $map, map is changed");

  print("\nSAMPLE 2.2: PASS BY REFERENCE -------------------------------------------------\n");

  void personChanger(Person person) {
    print("  executing personChanger(person = $person)");
    person.name = "Daniel";
    print("  in personChanger, person.name is changed to ${person.name}");
  }

  Person person = Person("John", 20);
  print("in main() person = $person");
  personChanger(person);
  print("in main() person = $person, person.name is changed");

  print("\nSAMPLE 2.3: PASS BY REFERENCE -------------------------------------------------\n");

  void increment(Wrapper wrapper) {
    print("  executing increment(wrapper = $wrapper)");
    wrapper.first++;
    print("  in increment, wrapper.first is incremented to ${wrapper.first}");
  }

  int first = 3;
  print("in main() first = $first");
  Wrapper wrapper = Wrapper(first);
  print("in main() first is wrapped in wrapper = $wrapper");
  increment(wrapper);
  print("in main() first is wrapped in wrapper = $wrapper, wrapper.first is incremented by 1");

  print("\nPART 4: KEYWORD AND DEFAULT PARAMETERS ----------------------------------------\n");

  print("SAMPLE 1: KEYWORD (NAMED) PARAMETERS ------------------------------------------\n");

  int powerPositionalParameters(base, exponent) {
     return pow(base, exponent).toInt();
  }

  int powerNamedParameters({required int base, required int exponent}) {
    return pow(base, exponent).toInt();
  }

  // powerPositionalParameters(2); // ERROR: 2 positional argument expected, but 1 found.
  // powerPositionalParameters(2, 3, 4); // ERROR: Too many positional arguments: 2 expected, but 3 found.
  print("in main() powerPositionalParameters(2, 3) = ${powerPositionalParameters(2, 3)}");
  print("in main() powerPositionalParameters(3, 2) = ${powerPositionalParameters(3, 2)}");

  // powerNamedParameters(base: 2); // ERROR: The named parameter 'exponent' is required.
  // powerNamedParameters(2, 3); // ERROR: Too many positional arguments: 0 expected, but 2 found.
  print("in main() powerNamedParameters(exponent: 3, base: 2) = ${powerNamedParameters(base: 2,  exponent: 3)}");

  print("\nSAMPLE 1.1: NULLABLE NAMED PARAMETERS -----------------------------------------\n");

  void printName({String? firstName, required String lastName}) {
    (firstName == null) ? print(lastName) : print('$firstName $lastName');
  }

  printName(firstName: 'Berk', lastName: 'Cakar');
  printName(lastName: 'Cakar');
  // printName(firstName: 'Berk'); // ERROR: The named parameter 'lastName' is required.

  print("\nSAMPLE 1.2: NAMED AND POSITIONAL PARAMETERS TOGETHER --------------------------\n");

  /*
    Named and positional parameters can be used together.
    However named parameters must be after positional parameters,
    (i.e., at the end of the parameter list)
  */
  String echo(String greeting, String name, {required String message}) {
    return '$greeting $name. $message.';
  }

  print(echo("Hi", "Berk", message: "This is a test message"));
  print(echo("Hi", message: "This is a test message", "Berk"));
  print(echo(message: "This is a test message", "Hi", "Berk"));
  // print(echo("Hi", "Berk", "This is a test message")); // ERROR: Too many positional arguments: 2 expected, but 3 found.
  // print(echo("Hi", "Berk")); // ERROR: The named parameter 'message' is required.

  print("\nSAMPLE 2: DEFAULT NAMED PARAMETERS --------------------------------------------\n");

  double logarithm({required double argument, double base = 10}) {
    return log(argument) / log(base);
  }

  // Or, the following code also works in the same way
  // double logarithm({required double argument, double? base}) {
  //   return (base == null) ? (log(argument) / log(10)) : log(argument) / log(base);
  // }

  print("in main() logarithm(argument: 100) = ${logarithm(argument: 100)}");
  print("in main() logarithm(base: 2, argument: 64) = ${logarithm(base: 2, argument: 64)}");

  print("\nSAMPLE 2.1: DEFAULT POSITIONAL PARAMETERS -------------------------------------\n");

  /*
    Optional positional parameters are declared using square brackets.
    They must be located at the end of the parameter list.
    Lastly, optional positional parameters cannot be used together with named parameters.
  */
  int integerMultiplication(int first, [int second = 1, int? a]) {
    return first * second;
  }

  // Or, the following code also works in the same way
  // int integerMultiplication(int first, [int? second]) {
  //   return (second == null) ? first : first * second;
  // }

  print("in main() integerMultiplication(2) = ${integerMultiplication(2)}");
  print("in main() integerMultiplication(2, 3) = ${integerMultiplication(2, 3)}");

  print("\nPART 5: CLOSURES --------------------------------------------------------------\n");

  print("SAMPLE 1: USING CLOSURES THROUGH VARIABLES (ALIASES) --------------------------\n");

  // Type of closure1 is 'int Function(int, int)'
  var closure1 = (int first, int second) {
    print("  executing closure1(first = $first, second = $second)");
    int sum = first + second;
    print("  in closure1, sum = $sum");
    return sum;
  };

  // or, var closure1 = (int first, int second) => first + second; // using the arrow notation

  print("in main() closure1(7, 5) = ${closure1(7, 5)}");

  print("\nincrement an integer by the given amount using a closure");
  // A closure can return another closure
  var closure2 = (int number) {
    return (int amount) => number + amount;
  };

  int intToBeIncremented = 10;
  print("in main() intToBeIncremented = $intToBeIncremented");
  var intIncrementer = closure2(intToBeIncremented);
  print("in main() intIncrementer(5) = ${intIncrementer(5)}\n");

  // in Dart, closures are objects of the class Function
  // Therefore we can also use 'Function' type instead of 'var'

  double Function(int, double) closure3 = (int first, double second) {
    print("  executing closure3(first = $first, second = $second)");
    double multiplication = first * second;
    print("  in closure3, multiplication = $multiplication");
    return multiplication;
  };

  print("in main() closure3(6, 4.5) = ${closure3(6, 4.5)}");

  print("\nSAMPLE 2: USING CLOSURES THROUGH FUNCTION PARAMETERS --------------------------\n");

  var closure4 = (int first) => first * 3;

  // A function that takes a closure as a parameter
  void listElemenentManipulator(List<int> list, Function(int) operation) {
    for (int i = 0; i < list.length; i++) {
      list[i] = operation(list[i]);
    }
  }

  List<int> integerList = [1, 2, 3, 4, 5];
  print("in main() list = $integerList");
  listElemenentManipulator(integerList, closure4);
  print("after listElemenentManipulator(integerList, closure4)");
  print("in main() list = $integerList");
}
