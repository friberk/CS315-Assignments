#[allow(while_true)]
#[allow(unreachable_code)]
#[allow(unused_variables)]
fn main() {
    println!("INTRODUCTION TO USER-LOCATED LOOP CONTROL MECHANISMS IN RUST");

    while true {
        println!("iterating once\n");
        break;
    }

    for i in 0..5 {
        continue; // continue to the next iteration without executing the rest of the loop body (println statement)
        println!("{}", i);
    }

    println!("SAMPLE 1: BREAK -------------------------------------------------------------");

    // An example for break
    let mut i = 0;
    loop {
        println!("in the outer loop i is {}", i);

        for j in 0..5 {
            println!("  in the inner loop j is {}", j);

            // When j is 2 in the inner loop, break out of the inner loop
            // and continue the outer loop
            if j == 2 {
                break;
            }
        }


        // When i is 2 in the outer loop, break out of the outer loop
        // Such that i will not go beyond 2
        if i == 2 {
            break;
        }

        i += 1;
    }

    println!("\nSAMPLE 2: CONTINUE ----------------------------------------------------------");

    // An example for continue
    // This loop finds some relatively prime numbers
    for i in 1..6 {
        // If i is 1 in the outer loop, continue to the next iteration of the outer loop
        // Since 1 can divide any number
        if i == 1 {
            println!("1 can divide any number, now continue to the next iteration of the outer loop");
            continue;
        }

        println!("in the outer loop i is {}", i);


        for j in 1..6 {
            // If i divides j or j divides i, continue to the next iteration of the inner loop
            if (i % j == 0) || (j % i == 0) {
                continue;
            }

            println!("  in the inner loop j is {}", j);
        }
    }

    println!("\nSAMPLE 3: LABELED BREAK -----------------------------------------------------");

    // An example for labeled break
    'outerLoop: for x in 0..8 {
        'innerLoop: for y in 0..15 {
            // When y is 4, break out of the inner loop
            if y == 4 {
                break 'innerLoop;
            }

            // When x is 3, break out of the outer loop
            if x == 3 {
                break 'outerLoop;
            }

            println!("{}, {}", x, y);
        }
    }

    println!("\nSAMPLE 4: LABELED CONTINUE --------------------------------------------------");

    // An example for labeled continue
    // In this loop, we print a square of asterisks
    // Although it is specified as 5x5, it will be 4x4 because of the labeled continue
    'outer: for i in 0..5 {
        'inner: for j in 0..5 {
            // When i is 4, continue to the next iteration of the outer loop
            if i == 4 {
                continue 'outer;
            }

            // When j is 4, continue to the next iteration of the inner loop
            if j == 4 {
                continue 'inner;
            }

            print!("* ");
        }
            println!();
    }
}
