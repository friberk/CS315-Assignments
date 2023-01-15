print("INTRODUCTION TO USER-LOCATED LOOP CONTROL MECHANISMS IN LUA")

while true do
    print("iterating once")
    break
end

for i = 1, 10 do
    -- continue is not directly supported in Lua
    goto continue -- continue to the next iteration without executing the rest of the loop body (print statement)
    print("iterating once")
    ::continue::
end

print("\nSAMPLE 1: BREAK -------------------------------------------------------------");

-- An example for break
-- In this for loop, a modified Floyd's triangle is printed
for i = 1, 10 do
    for j = 1, i do
        io.write("*")
        if j == 5 then
            -- When the number of stars printed (columns) is 5, break out of the inner loop
            io.write(" The inner loop has completed its fifth iteration (column), now break out the inner loop (stop adding new columns)")
            break
        end
    end
    if i == 8 then
        -- When the number of rows is 8, break out of the outer loop
        io.write("\nThe outer loop has completed its eight iteration (row), now break out the outer loop (stop adding new rows)")
        break
    end
    print();
end
-- In the end, it is expected to see a trapazoid with 8 rows and 5 columns

-- Lua does not have a continue statement, but you can use the goto statement to jump to the next iteration of a loop.

io.write("\n\nSAMPLE 2: LABELED BREAK (VIA GOTO) ---------------------------------------\n");

-- An example for labeled break
local array = {
    { 1,  2,  3,  4,  5},
    { 6,  7,  8,  9, 10},
    {11, 12, 13, 14, 15},
    {16, 17, 18, 19, 20},
    {21, 22, 23, 24, 25}
}
for i = 1, #array do
    for j = 1, #array[i] do
        if i == 4 then
            -- When the fourth row of the 2D array is reached, break out of the outer loop
            goto outerLoopDone -- break out of the outer loop
        end
        if j == 4 then
            -- When the fourth column of the 2D array is reached, break out of the inner loop
            goto innerLoopDone -- break out of the inner loop
        end
        io.write(array[i][j], "\t")
    end
    ::innerLoopDone::
    io.write("\n")
end
::outerLoopDone::
-- In the end, it is expected to see the left-top 3x3 sub-matrix of the 5x5 2D array

io.write("\nSAMPLE 3: LABELED CONTINUE (VIA GOTO) ---------------------------------------");

-- An example for labeled continue
for i = 1, 4 do
    io.write("\n")
    for j = 1, 3 do
        if i == j then
            -- When the row number equals the column number (i.e., a square number is encountered),
            -- continue the outer loop, so that no number is printed after the square number
            io.write(">", "\t")
            goto continue -- same as continue outerLoop, or break innerLoop
        end
        io.write(i * j, "\t")
    end
    ::continue::
end
print("\n> means i == j, which indicates a square number has been reached, so we continue to the next iteration of the outer loop")

