# A function to print the given key-value pair
def foo(key, value)
    puts "#{key}: #{value}"
end

puts "PART 1: INITIALIZE --------------------------------------------------"

# Initialize the associative array, it is called as a hash in Ruby
hash = {
    name: 'Berk Çakar',
    university: 'Bilkent University',
    department: 'Computer Engineering',
    universityIdNo: 22003021,
    isUndergraduate: true,
    age: 21,
    height: 1.82
}

puts hash
puts "Associative array has been initialized successfully"

puts "\nPART 2: GET THE VALUE FOR THE GIVEN KEY -------------------------------------"

# Get the value for the given key
puts hash[:name]
puts hash[:university]
puts hash[:department]
puts hash[:universityIdNo]
puts hash[:isUndergraduate]
puts hash[:age]
puts hash[:height]

puts "\nPART 3: ADD A NEW ELEMENT ---------------------------------------------------"

puts "Adding 'weight' key with value 70"
# Add a new element
hash[:weight] = 70
puts "weight: #{hash[:weight]}"

puts "\nPART 4: REMOVE AN ELEMENT ---------------------------------------------------"

puts "Removing 'isUndergraduate' key"
# Remove an element
hash.delete(:isUndergraduate)
puts "isUndergraduate: #{hash[:isUndergraduate]}"

puts "\nPART 5: MODIFY THE VALUE OF AN EXISTING ELEMENT -----------------------------"

puts "Value of the 'age' key before: #{hash[:age]}"
puts "Modifying the value of the 'age' key"
# Modify the value of an existing element
hash[:age] = 22
puts "Value of the 'age' key after: #{hash[:age]}"

puts "\nPART 6: SEARCH FOR THE EXISTENCE OF A KEY -----------------------------------"

# Search for the existence of a key
if hash.has_key?(:name)
    puts "'name' key exists"
else
    puts "'name' key does not exist"
end

if hash.has_key?(:isUndergraduate)
    puts "'isUndergraduate' key exists"
else
    puts "'isUndergraduate' key does not exist"
end

puts "\nPART 7: SEARCH FOR THE EXISTENCE OF A VALUE ---------------------------------"

# Search for the existence of a value
if hash.has_value?(22003021)
    puts "22003021 value exists in one of the keys"
else
    puts "22003021 value does not exist in one of the keys"
end

if hash.has_value?("Basketball")
    puts "Basketball value exists in one of the keys"
else
    puts "Basketball value does not exist in one of the keys"
end

puts "\nPART 8: PRINT THE ASSOCIATIVE ARRAY VIA THE FOO FUNCTION --------------------"

# Loop through an associative array, apply a function, called foo, which simply prints the key-value pair
hash.each do |key, value|
    foo(key, value)
end
