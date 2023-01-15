puts "INTRODUCTION TO USER-LOCATED LOOP CONTROL MECHANISMS IN RUBY"

while true
    puts "iterating once", ""
    break
end

for i in 1..10
    # next is the continue equivalent in Ruby
    next # continue to the next iteration without executing the rest of the loop body (puts statement)
    puts i
end

puts "SAMPLE 1: BREAK ------------------------------------------------------------"

# An example for break
for i in 0..10
    # When i is 3 in outer loop, break the outer loop
    # so that i become 0, 1, 2, and 3 instead of 0, 1, ..., 10
    if i == 3
        puts "in outer loop i is 3, now break out of the outer loop, such that i will not go beyond 3"
        break
    end

    puts "in outer loop, i is #{i}"

    j = 12;
    loop do
        # When j is 9 in inner loop, break the inner loop
        # so that j become 12, 11, 10, 9 instead of 12, 11, ..., -infinity
        if j == 9
            puts "  in inner loop, j is 9, now break out of the inner loop, such that j will not go minus infinity"
            break
        end
        puts "  in inner loop, j is #{j}"
        j -= 1
    end
end

puts "", "SAMPLE 2: NEXT -------------------------------------------------------------"

# An example for next
# Print a simple multiplication table
for i in 1..4
    # When the order of the row is divisible by 2, continue to the next iteration
    if i.even?
        puts "in outer loop i is even, now continue to the next iteration of the outer loop"
        next
    end
    for j in 1..4
        # When the order of the column is divisible by 3, continue to the next iteration
        # For example instead of 3 6 9 12 this will print 3 6 12
        if j == 3
            next
        end
        # Otherwise print the multiplication result
        print i*j, " "
    end
    puts
end
