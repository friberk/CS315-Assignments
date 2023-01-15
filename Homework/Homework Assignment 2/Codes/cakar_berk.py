print("INTRODUCTION TO USER-LOCATED LOOP CONTROL MECHANISMS IN PYTHON")

while (True):
    print("iterating once\n")
    break

for i in range(0, 30):
    continue # continue to the next iteration without executing the rest of the loop body (print statement)
    print(i)

print("SAMPLE 1: BREAK -------------------------------------------------------------")

# An example for break
odd = [1, 3, 5, 7, 9]
even = [2, 4, 6, 8]
result = []
# This nested loop form odd-even pairs and stores them in the result list
for i in odd:
    # When i is 7 in the outer loop, break out of the outer loop,
    # so that no pair will include 7 and 9
    if (i == 7):
        print("in outer loop i is 7, now break out of the outer loop, such that no pair in result will contain 7 and 9")
        break
    for j in even:
        # When j is 6 in the inner loop, break out of the inner loop,
        # so that no pair will include 6 and 8
        if (j == 6):
            print("  in inner loop j is 6, now break out of the inner loop, such that no pair in result will contain 6 and 8")
            break
        result.append('{}-{}'.format(i, j))
print("Resulting list: " + str(result))

print("\nSAMPLE 2: CONTINUE ----------------------------------------------------------")

# An example for continue
text = "Hello!World"
for i in range(0, 3):
    # Skip the second iteration so that HelloWorld will be printed twice
    if i == 1: continue
    print("i is {}: ".format(i), end='')
    for char in text:
        # Skip the exclamation mark
        if (char == '!'):
            continue
        print(char, end='')
    print("")
