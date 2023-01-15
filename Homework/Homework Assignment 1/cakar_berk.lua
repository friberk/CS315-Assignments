-- A function to print the given key-value pair
function foo(key, value)
    print(key .. " = " .. value)
end

print('PART 1: INITIALIZE ----------------------------------------------------------')

-- Initialize the associative array, it is called as a table in Lua
table = {
    name = 'Berk Çakar',
    university = 'Bilkent University',
    department = 'Computer Engineering',
    universityIdNo = 22003021,
    isUndergraduate = true,
    age = 21,
    height = 1.82
}

print(table)
print('Associative array has been initialized successfully')

print('\nPART 2: GET THE VALUE FOR THE GIVEN KEY -------------------------------------')

-- Get the value for the given key
print(table['name'])
print(table['university'])
print(table['department'])
print(table['universityIdNo'])
print(table['isUndergraduate'])
print(table['age'])
print(table['height'])

print('\nPART 3: ADD A NEW ELEMENT ---------------------------------------------------')

print('Adding \'weight\' key with value 70')
-- Add a new element
table['weight'] = 70
print('weight: ' .. table['weight'])

print('\nPART 4: REMOVE AN ELEMENT ---------------------------------------------------')

print('Removing \'isUndergraduate\' key')
-- Remove an element
table['isUndergraduate'] = nil
print('isUndergraduate: ', table['isUndergraduate'])

print('\nPART 5: MODIFY THE VALUE OF AN EXISTING ELEMENT -----------------------------')

print('Value of the \'age\' key before: ' .. table['age'])
print('Modifying the value of the \'age\' key')
-- Modify the value of an existing element
table['age'] = 22
print('Value of the \'age\' key after: ' .. table['age'])

print('\nPART 6: SEARCH FOR THE EXISTENCE OF A KEY -----------------------------------')

-- Search for the existence of a key
if table.name ~= nil then -- or, table['name'] ~= nil
    print('\'name\' key exists')
else
    print('\'name\' key does not exist')
end

if table.isUndergraduate ~= nil then -- or, table['isUndergraduate'] ~= nil
    print('\'isUndergraduate\' key exists')
else
    print('\'isUndergraduate\' key does not exist')
end

print('\nPART 7: SEARCH FOR THE EXISTENCE OF A VALUE ---------------------------------')

-- Search for the existence of a value
found1, found2 = false, false
for key, value in pairs(table) do
    if value == 22003021 then
        print('22003021 value exists in key: ' .. key)
        found1 = true
        break
    end
end

if found1 == false then
    print('22003021 value does not exist in one of the keys')
end

for key, value in pairs(table) do
    if value == 'Basketball' then
        print('Basketball value exists in key: ' .. key)
        found2 = true
        break
    end
end

if found2 == false then
    print('Basketball value does not exist in one of the keys')
end

print('\nPART 8: PRINT THE ASSOCIATIVE ARRAY VIA THE FOO FUNCTION --------------------')

-- Loop through an associative array, apply a function, called foo, which simply prints the key-value pair
for key, value in pairs(table) do
    foo(key, value)
end
