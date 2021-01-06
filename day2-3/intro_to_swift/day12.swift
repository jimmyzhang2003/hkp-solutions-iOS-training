//day12.swift: optionals
//Jimmy Zhang @ 1/5/2021

//handling missing data: make optionals (let us represent the absence of a value in a clear and unambiguous way)
var age: Int? = nil //store missing value by adding ? after type
age = 38 //later, we can assign it a value

//unwrapping optionals: Swift won't let us use optionals without unwrapping them
var name: String? = nil
if let unwrapped = name { //if let syntax allows us to look inside the optional and see what's there (unwrapping)
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.") //if name is empty, prints the else statement
}

//unwrapping with guard let: also used for unwrapping optionals, but exits code segment after finding nil and allows unwrapped optional to remain usable after the guard code
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!") //since optionals unwrapped by guard let stay around, we can print the unwrapped string at the end of the function
}
//guard let lets you deal with problems at the start of your functions, then exit immediately

//force unwrapping
let str = "5"
let num = Int(str) //makes num an optional Int since Swift isn't sure the conversion will work
let num = Int(str)! //force unwrap with !

//implicitly unwrapped optionals: don't use the safety checks of regular optionals
let age: Int! = nil //add exclamation mark after type name
//Because they behave as if they were already unwrapped, you don’t need if let or guard let to use implicitly unwrapped optionals. However, if you try to use them and they have no value – if they are nil – your code crashes.

//nil coalescing: unwraps an optional and returns the value inside if there is one, or else returns a default value
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous" //the nil coalesing operator (??) checks the result from the username function; if it's a string, it will be unwrapped and assigned to user, but if it's nil, then "Anonymous: will be used

//optional chaining: lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased() //Swift will set beatle to nil if first returns nil; otherwise, the entire thing will be unwrapped and execution will continue

//optional try
//there are two alternative to try: try? and try!
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool { //throwing function
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") { //try? changes throwing functions into functions that return an optional
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit") //use try! when you know for sure the function will not fail
print("OK!")

//failable initializers: initializers that might work or might not
struct Person {
    var id: String

    init?(id: String) {  //to write a failable initializer, use init?() instead of init(), and return nil if something goes wrong
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()] // Swift can see both Fish and Dog inherit from the Animal class, so it uses type inference to make pets an array of Animal.
for pet in pets { //Swift will check to see whether each pet is a Dog object
    if let dog = pet as? Dog { // as? returns an optional: nil if the typecast failed or a converted type (Dog) otherwise
        dog.makeNoise()
    }
}
