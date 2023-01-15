import 'dart:collection';

// A function to print the given key-value pair
void foo(key, value) {
    print('${key}: ${value}');
}

void main() {
  print('PART 1: INITIALIZE ------------------------------------------------------------');

  // Initialize the associative array (HashMap)
  HashMap hashMap = HashMap.of({
    'name': 'Berk Çakar',
    'university': 'Bilkent University',
    'department': 'Computer Engineering',
    'universityIdNo': 22003021,
    'isUndergraduate': true,
    'age': 21,
    'height': 1.82
  });

  print(hashMap);
  print('Associative array has been initialized successfully');

  print('\nPART 2: GET THE VALUE FOR THE GIVEN KEY -------------------------------------');

  // Get the value for the given key
  print(hashMap['name']);
  print(hashMap['university']);
  print(hashMap['department']);
  print(hashMap['universityIdNo']);
  print(hashMap['isUndergraduate']);
  print(hashMap['age']);
  print(hashMap['height']);

  print('\nPART 3: ADD A NEW ELEMENT ---------------------------------------------------');

  print('Adding \'weight\' key with value 70');
  // Add a new element
  hashMap['weight'] = 70;
  print('weight: ${hashMap['weight']}');

  print('\nPART 4: REMOVE AN ELEMENT ---------------------------------------------------');

  print('Removing \'isUndergraduate\' key');
  // Remove an element
  hashMap.remove('isUndergraduate');
  print('isUndergraduate: ${hashMap['isUndergraduate']}');

  print('\nPART 5: MODIFY THE VALUE OF AN EXISTING ELEMENT -----------------------------');

  print('Value of the \'age\' key before: ${hashMap['age']}');
  print('Modifying the value of the \'age\' key');
  // Modify the value of an existing element
  hashMap['age'] = 22;
  print('Value of the \'age\' key after: ${hashMap['age']}');

  print('\nPART 6: SEARCH FOR THE EXISTENCE OF A KEY -----------------------------------');

  // Search for the existence of a key
  if (hashMap.containsKey('name')) {
    print('\'name\' key exists');
  } else {
    print('\'name\' key does not exist');
  }

  if (hashMap.containsKey('isUndergraduate')) {
    print('\'isUndergraduate\' key exists');
  } else {
    print('\'isUndergraduate\' key does not exist');
  }

  print('\nPART 7: SEARCH FOR THE EXISTENCE OF A VALUE ---------------------------------');

  // Search for the existence of a value
  if (hashMap.containsValue(22003021)) {
    print('22003021 value exists in one of the keys');
  } else {
    print('22003021 value does not exist in one of the keys');
  }

  if (hashMap.containsValue('Basketball')) {
    print('Basketball value exists in one of the keys');
  } else {
    print('Basketball value does not exist in one of the keys');
  }

  print('\nPART 8: PRINT THE ASSOCIATIVE ARRAY VIA THE FOO FUNCTION --------------------');

  // Loop through an associative array, apply a function, called foo, which simply prints the key-value pair
  for (var key in hashMap.keys) {
    foo(key, hashMap[key]);
  }
}
