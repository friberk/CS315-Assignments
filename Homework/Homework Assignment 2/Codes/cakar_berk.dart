void main() {
  print("INTRODUCTION TO USER-LOCATED LOOP CONTROL MECHANISMS IN DART");

  while (true) {
    print("iterating once");
    break;
  }

  // ignore: dead_code
  for (int i = 0; i < 10; i++) {
    continue; // continue to the next iteration without executing the rest of the loop body (print statement)
    // ignore: dead_code
    print("$i");
  }

  // Labels can also be used to break out of nested loops (see the examples below)

  print("\nSAMPLE 1: BREAK -------------------------------------------------------------");

  // An example for break
  for (int i = 0; i < 44; i++) {
    if (i == 2) {
      /*
         When i is 2 in the outer loop, break statement will be executed
         and the outer loop will be terminated
      */
      print(
          "  in outer loop i is 2, now break out of the outer loop, otherwise i would go as 0, 1, 2, ..., 43");
      break;
    }

    print("in outer loop i is $i");

    for (int j = 0; j < 12; j++) {
      /*
         When j is 5 in the inner loop, break statement will be executed
         However, the outer loop will continue to run since the break statement
         only breaks out of the inner loop
      */
      if (j == 3) {
        print(
            "  in inner loop j is 3, now break out of the inner loop, otherwise j would go as 0, 1, 2, ..., 11");
        break;
      }
      print("  in inner loop j is $j");
    }
  }

  print("\nSAMPLE 2: CONTINUE ----------------------------------------------------------");

  // An example for continue
  var i = 0;
  while (i < 10) {
    i++;
    if (i % 2 == 0) {
      /*
         When i is even, continue statement will be executed
         and the while loop will continue to the next iteration
         without executing the print statement for even numbers
      */
      continue;
    }
    print("in while loop, i is odd, now printing: i = $i");
  }

  print("\nSAMPLE 3: LABELED BREAK -----------------------------------------------------");

  // An example for labeled break
  outerLoop:
  for (int j = 0; j < 10; j++) {
    print("in outer loop j is $j");

    int i = 0;
    // In Dart, labels can be used to break or continue a specific loop
    innerLoop:
    do {
      print("  in inner loop, i is $i");
      /*
         When j is 5, break statement will be executed in the inner loop
         and the outer loop will be terminated. Otherwise, the outer loop
         would continue to run until j is 9
      */
      if (j == 5) {
        print("j is 5, break out the outer loop, normally 'j' would go as 0, 1, 2, ..., 9");
        break outerLoop;
      }
      /*
         When i is 3, break statement will terminate the inner loop and
         the outer loop will continue to run. Otherwise, the inner loop
         would continue to run until i is 2
      */
      if (i == 1) {
        print("  i is 1, break out the inner loop, normally 'i' would go as 0, 1, 2");
        break innerLoop;
      }
      i++;
    } while (i < 3);
  }

  print("\nSAMPLE 4: LABELED CONTINUE --------------------------------------------------");

  // An example for labeled continue
  outerLoop:
  for (var i = 0; i <= 3; i++) {
    print("in outer loop i is $i");
    innerLoop:
    for (var j = 0; j <= 2; j++) {
      /*
         When j is 1, continue statement will be executed in the inner loop
         which means the inner loop will continue to the next iteration
         without executing the print statement when j is 1
      */
      if (j == 1) {
        continue innerLoop;
      }
      /*
         When i is 2, continue statement will be executed in the outer loop
         which means the outer loop will continue to the next iteration
         with skipping the inner loop
      */
      if (i == 2) {
        continue outerLoop; // same as break innerloop;
      }
      print("  in inner loop j is $j");
    }
  }
}
