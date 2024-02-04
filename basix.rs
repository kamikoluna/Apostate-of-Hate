// 1. Variables and Mutability
let mut x = 5;
println!("The value of x is: {}", x);
x = 6;
println!("The value of x is: {}", x);

// 2. Functions
fn another_function(x: i32) {
    println!("The value of x is: {}", x);
}

// 3. Control Flow
let number = 3;
if number < 5 {
    println!("condition was true");
} else {
    println!("condition was false");
}

// 4. Data Structures - Tuple
let tup: (i32, f64, u8) = (500, 6.4, 1);

// 5. Data Structures - Array
let a: [i32; 5] = [1, 2, 3, 4, 5];

// 6. Ownership and Borrowing
let s1 = String::from("hello");
let s2 = s1; // s1 has been moved to s2 and is no longer valid!

// 7. Structs
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

// 8. Enums and Pattern Matching
enum IpAddrKind {
    V4,
    V6,
}

let four = IpAddrKind::V4;
let six = IpAddrKind::V6;

match four {
    IpAddrKind::V4 => println!("V4"),
    IpAddrKind::V6 => println!("V6"),
}
