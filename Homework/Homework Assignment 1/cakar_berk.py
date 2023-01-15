# A function to print the given key-value pair
def foo(key, value):
    print('{}: {}'.format(key, value))

print('PART 1: INITIALIZE ------------------------------------------------------------')

# Initialize the associative array, it is called as a dictionary in Python
dict = {
    'name': 'Berk Çakar',
    'university': 'Bilkent University',
    'department': 'Computer Engineering',
    'universityIdNo': 22003021,
    'isUndergraduate': True,
    'age': 21,
    'height': 1.82
}

print(dict)
print('Associative array has been initialized successfully')

print('\nPART 2: GET THE VALUE FOR THE GIVEN KEY -------------------------------------')

# Get the value for the given key
print(dict['name'])
print(dict['university'])
print(dict['department'])
print(dict['universityIdNo'])
print(dict['isUndergraduate'])
print(dict['age'])
print(dict['height'])

print('\nPART 3: ADD A NEW ELEMENT ---------------------------------------------------')

print('Adding \'weight\' key with value 70');
# Add a new element
dict['weight'] = 70
print('weight: {}'.format(dict['weight']))

print('\nPART 4: REMOVE AN ELEMENT ---------------------------------------------------')

print('Removing \'isUndergraduate\' key')
# Remove an element
del dict['isUndergraduate']
print('isUndergraduate: {}'.format(dict.get('isUndergraduate')))

print('\nPART 5: MODIFY THE VALUE OF AN EXISTING ELEMENT -----------------------------')

print('Value of the \'age\' key before: {}'.format(dict['age']))
print('Modifying the value of the \'age\' key')
# Modify the value of an existing element
dict['age'] = 22;
print('Value of the \'age\' key after: {}'.format(dict['age']));

print('\nPART 6: SEARCH FOR THE EXISTENCE OF A KEY -----------------------------------')

# Search for the existence of a key
if 'name' in dict:
    print('\'name\' key exists')
else:
    print('\'name\' key does not exist')

if 'isUndergraduate' in dict:
    print('\'isUndergraduate\' key exists')
else:
    print('\'isUndergraduate\' key does not exist')

print('\nPART 7: SEARCH FOR THE EXISTENCE OF A VALUE ---------------------------------')

# Search for the existence of a value
if 22003021 in dict.values():
    print('22003021 value exists in one of the keys');
else:
    print('22003021 value does not exist in one of the keys');

if 'Basketball' in dict.values():
    print('Basketball value exists in one of the keys')
else:
    print('Basketball value does not exist in one of the keys')

print('\nPART 8: PRINT THE ASSOCIATIVE ARRAY VIA THE FOO FUNCTION --------------------')

# Loop through an associative array, apply a function, called foo, which simply prints the key-value pair
for key in dict:
    foo(key, dict[key])
