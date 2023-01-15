<?php

echo "INTRODUCTION TO USER-LOCATED LOOP CONTROL MECHANISMS IN PHP", PHP_EOL;

while (true) {
    echo "iterating once", PHP_EOL;
    break;
}

for ($i = 0; $i < 10; $i += 1) {
    continue; // continue to the next iteration without executing the rest of the loop body (echo statement)
    echo $i;
}


echo PHP_EOL, "SAMPLE 1: BREAK -------------------------------------------------------------", PHP_EOL;

// An example for break
for ($i = 0; $i < 8; $i++) {
    /*
        When $i is 3, the loop will break and the rest of the loop will not be executed.
        Otherwise, the loop will continue to execute until $i becomes 8.
    */
    if ($i == 3) {
        echo "in outer loop \$i is 3, now break out of the outer loop, otherwise \$i would be 4 in the next iteration";
        break;
    }

    echo "in outer loop \$i is $i", PHP_EOL;
    $j = 0;
    while ($j < 7) {
        /*
            If $j is 3, break out the inner loop and continue to the next iteration of the outer loop.
            So that, $j values can only be 0, 1, 2, 3 instead of 0, 1, 2, 3, 4, 5, 6.
        */
        if ($j == 3) {
            echo "  in inner loop \$j is 3, now break out of the inner loop, otherwise \$j would go [0, 6]", PHP_EOL;
            break;
        }
        echo "  in inner loop \$j is $j", PHP_EOL;
        $j++;
    }

}
echo PHP_EOL, PHP_EOL;

echo "SAMPLE 2: CONTINUE ----------------------------------------------------------", PHP_EOL;

// An example for continue
// Find the right angled triangle combinations with maximum side length of 10
for ($i = 1; $i <= 10; $i++) {
    for ($j = 1; $j <= 10; $j++) {
        /*
            If j is 3 or 4, then continue to the next iteration of the inner loop.
            This way we would not get the 3-4-5 or 4-3-5 triangle.
        */
        if ($j == 3 || $j == 4) {
            continue;
        }

        for ($z = 1; $z <= 10; $z++) {
            if ($z == 3 || ($z == 4)) {
                /*
                    Again, we basically skip the iteration of the most inner
                    loop when $z is 3 or 4, such that, we would never get the
                    3-4-5 or 4-3-5 triangle
                */
                continue;
            }

            if (pow($z, 2) + pow($j, 2) == pow($i, 2)) {
                echo "Found a Pythagorean triple: $j, $z, $i", PHP_EOL;
                break;
            }
        }
    }
}

echo PHP_EOL, "SAMPLE 3: LEVELED BREAK -----------------------------------------------------", PHP_EOL;

// An example for leveled break
$i = 0;
while ($i < 10) {
    echo "in outer loop \$i is $i", PHP_EOL;
    $j = 0;
    do {
        if ($j == 3) {
            /*
                When $j is 3 in the inner loop, break out 2 levels of the loop.
                So that, outer loop will be broken out.
            */
            echo "  in inner loop \$j is $j, now break out 2 enclosing loops", PHP_EOL;
            break 2;
        }
        echo "  in inner loop \$j is $j", PHP_EOL;
        $j++;
    } while ($j < 5);
    $i++;
}

echo PHP_EOL, "SAMPLE 4: LEVELED CONTINUE --------------------------------------------------", PHP_EOL;

// An example for leveled continue
for ($i = 0; $i < 3; $i++) {
    echo "in outer loop \$i is $i", PHP_EOL;
    for ($j = 0; $j < 4; $j++) {
        /*
            Similar to the previous sample, when $j is 3 in the inner loop,
            continue the loop which is 2 levels above. So that, the outer
            loop will continue to the next iteration.
        */
        if ($j == 2) {
            echo "  in inner loop \$j is $j, now continue to the next iteration of the outer loop", PHP_EOL;
            continue 2;
        }
        else {
            echo "  in inner loop \$j is $j", PHP_EOL;
        }
    }
    echo "This line will not be executed", PHP_EOL;
}

echo PHP_EOL, "SAMPLE 5: LABELED BREAK (VIA GOTO) ------------------------------------------", PHP_EOL;

// An example for labeled break (via goto)
for ($i = 0; $i < 5; $i++) {
    echo "in outer loop \$i is $i", PHP_EOL;
    $j = 10;
    while ($j > 0) {
        /*
            When $i is 3, break out of the outer loop.
            This is possible by using goto and a label.
            (i.e., we can break out of the outerLoop from the innerLoop)
        */
        if ($i == 3) {
            echo "since \$i is 3, now break out of the outer loop", PHP_EOL;
            goto outerLoopDone;
        }

        /*
           When $j is 8, break out of the inner loop, such that
           $j values can only be 10, 9, 8 instead of 10, 9, ..., 1
        */
        if ($j == 8) {
            echo "  in inner loop \$j is $j, now break out of the inner loop", PHP_EOL;
            goto innerLoopDone;
        }

        else {
            echo "  in inner loop \$j is $j", PHP_EOL;
        }
        $j--;
    }
    innerLoopDone:
}
outerLoopDone:

echo PHP_EOL, "SAMPLE 6: LABELED CONTINUE (VIA GOTO) ---------------------------------------", PHP_EOL;

// An example for labeled continue (via goto)
$months = array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
for ($i = 0; $i < count($months); $i++) {
    // Another loop for processing summer months
    while ($i % 12 >= 5 && $i % 12 <= 7) {
        if ($months[$i] == 'July') {
            // When the month is July, continue to the next iteration of the outer loop
            // So that, we would not get the month of July in the output
            goto innerLoopContinue;
        }
        else {
            echo "  in inner loop month is $months[$i]", PHP_EOL;
        }
        innerLoopContinue:
        $i++; // Increment $i here as well, otherwise the loop will be infinite
    }
    echo "in outer loop month is $months[$i]", PHP_EOL;
}

?>
