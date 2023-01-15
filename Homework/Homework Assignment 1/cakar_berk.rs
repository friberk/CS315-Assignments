use std::collections::HashMap;

// A function to print the given key-value pair
fn foo(key: &str, value: &str) {
    println!("{}: {}", key, value);
}

#[allow(non_snake_case)]
fn main() {
    println!("PART 1: INITIALIZE ----------------------------------------------------------");

    // Initialize the associative array, it is called as a HashMap in Rust
    let mut hashMap = HashMap::from([
        ("name", "Berk Çakar"),
        ("university", "Bilkent University"),
        ("department", "Computer Engineering"),
        ("universityIdNo", "22003021"),
        ("isUndergraduate", "true"),
        ("age", "21"),
        ("height", "1.82")
    ]);

    println!("{:?}", hashMap);
    println!("Associative array has been initialized successfully");

    println!("\nPART 2: GET THE VALUE FOR THE GIVEN KEY -------------------------------------");

    // Get the value for the given key
    println!("{}", hashMap["name"]);
    println!("{}", hashMap["university"]);
    println!("{}", hashMap["department"]);
    println!("{}", hashMap["universityIdNo"]);
    println!("{}", hashMap["isUndergraduate"]);
    println!("{}", hashMap["age"]);
    println!("{}", hashMap["height"]);

    println!("\nPART 3: ADD A NEW ELEMENT ---------------------------------------------------");

    println!("Adding 'weight' key with value 70");
    // Add a new element
    hashMap.insert("weight", "70");
    println!("weight: {}", hashMap["weight"]);

    println!("\nPART 4: REMOVE AN ELEMENT ---------------------------------------------------");

    println!("Removing 'isUndergraduate' key");
    // Remove an element
    hashMap.remove("isUndergraduate");
    println!("isUndergraduate: {:?}", hashMap.get("isUndergraduate"));

    println!("\nPART 5: MODIFY THE VALUE OF AN EXISTING ELEMENT -----------------------------");

    println!("Value of the 'age' key before: {}", hashMap["age"]);
    println!("Modifying the value of the 'age' key");
    // Modify the value of an existing element
    hashMap.insert("age", "22"); // Although it is an insert, it actually modifies the value by overwriting the existing value
    println!("Value of the 'age' key after: {}", hashMap["age"]);

    println!("\nPART 6: SEARCH FOR THE EXISTENCE OF A KEY -----------------------------------");

    // Search for the existence of a key
    if hashMap.contains_key("name") {
        println!("'name' key exists");
    } else {
        println!("'name' key does not exist");
    }

    if hashMap.contains_key("isUndergraduate") {
        println!("'isUndergraduate' key exists");
    } else {
        println!("'isUndergraduate' key does not exist");
    }

    println!("\nPART 7: SEARCH FOR THE EXISTENCE OF A VALUE ---------------------------------");

    // Search for the existence of a value
    if hashMap.values().any(|&value| value == "22003021") {
        println!("22003021 value exists in one of the keys");
    } else {
        println!("22003021 value does not exist in one of the keys");
    }

    if hashMap.values().any(|&value| value == "Basketball") {
        println!("Basketball value exists in one of the keys");
    } else {
        println!("Basketball value does not exist in one of the keys");
    }

    println!("\nPART 8: PRINT THE ASSOCIATIVE ARRAY VIA THE FOO FUNCTION --------------------");

    // Loop through an associative array, apply a function, called foo, which simply prints the key-value pair
    for (key, value) in hashMap {
        foo(key, value);
    }
}
