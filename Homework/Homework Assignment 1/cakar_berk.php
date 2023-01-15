<?php

// A function to print the given key-value pair
function foo($key, $value) {
    echo "$key => $value", PHP_EOL;
}

echo 'PART 1: INITIALIZE ----------------------------------------------------------', PHP_EOL;

// Initialize the associative array
$assoc_array = [
    'name' => 'Berk Çakar',
    'university' => 'Bilkent University',
    'department' => 'Computer Engineering',
    'universityIdNo' => 22003021,
    'isUndergraduate' => true,
    'age' => 21,
    'height' => 1.82
];

print_r($assoc_array);
echo 'Associative array has been initialized successfully', PHP_EOL;

echo PHP_EOL, 'PART 2: GET THE VALUE FOR THE GIVEN KEY -------------------------------------', PHP_EOL;

// Get the value for the given key
echo $assoc_array['name'], PHP_EOL;
echo $assoc_array['university'], PHP_EOL;
echo $assoc_array['department'], PHP_EOL;
echo $assoc_array['universityIdNo'], PHP_EOL;
echo $assoc_array['isUndergraduate'], PHP_EOL;
echo $assoc_array['age'], PHP_EOL;
echo $assoc_array['height'], PHP_EOL;

echo PHP_EOL, 'PART 3: ADD A NEW ELEMENT ---------------------------------------------------', PHP_EOL;

echo 'Adding \'weight\' key with value 70', PHP_EOL;
// Add a new element
$assoc_array['weight'] = 70;
echo 'weight: ' . $assoc_array['weight'], PHP_EOL;

echo PHP_EOL, 'PART 4: REMOVE AN ELEMENT ---------------------------------------------------', PHP_EOL;

echo 'Removing \'isUndergraduate\' key', PHP_EOL;
// Remove an element
unset($assoc_array['isUndergraduate']);
echo 'isUndergraduate: ' . $assoc_array['isUndergraduate'], PHP_EOL;

echo PHP_EOL, 'PART 5: MODIFY THE VALUE OF AN EXISTING ELEMENT -----------------------------', PHP_EOL;

echo 'Value of the \'age\' key before: ' . $assoc_array['age'], PHP_EOL;
echo 'Modifying the value of the \'age\' key', PHP_EOL;
// Modify the value of an existing element
$assoc_array['age'] = 22;
echo 'Value of the \'age\' key after: ' . $assoc_array['age'], PHP_EOL;

echo PHP_EOL, 'PART 6: SEARCH FOR THE EXISTENCE OF A KEY -----------------------------------', PHP_EOL;

// Search for the existence of a key
if (array_key_exists('name', $assoc_array)) {
    echo '\'name\' key exists', PHP_EOL;
} else {
    echo '\'name\' key does not exist', PHP_EOL;
}

if (array_key_exists('isUndergraduate', $assoc_array)) {
    echo '\'isUndergraduate\' key exists', PHP_EOL;
} else {
    echo '\'isUndergraduate\' key does not exist', PHP_EOL;
}

echo PHP_EOL, 'PART 7: SEARCH FOR THE EXISTENCE OF A VALUE ---------------------------------', PHP_EOL;

// Search for the existence of a value
if (in_array(22003021, $assoc_array)) {
    echo '22003021 value exists in one of the keys', PHP_EOL;
} else {
    echo '22003021 value does not exist in one of the keys', PHP_EOL;
}

if (in_array('Basketball', $assoc_array)) {
    echo 'Basketball value exists in one of the keys', PHP_EOL;
} else {
    echo 'Basketball value does not exist in one of the keys', PHP_EOL;
}

echo PHP_EOL, 'PART 8: PRINT THE ASSOCIATIVE ARRAY VIA THE FOO FUNCTION --------------------', PHP_EOL;

// Loop through an associative array, apply a function, called foo, which simply prints the key-value pair
foreach($assoc_array as $key => $value) {
    foo($key, $value);
}
