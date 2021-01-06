//day5.swift: functions
//Jimmy Zhang @ 1/5/2021

//functions: let us reuse code
func printHelp() {  //func keyword
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}

printHelp() // function call

//accepting parameters
func square(number: Int) {  // takes an Int parameter called number
    print(number * number)
}
square(number: 8) // refer to name when calling function

//returning values
func square(number: Int) -> Int { //returns Int
    return number * number
}
let result = square(number: 8)
print(result)
//to return multiple values, can use tuples

//parameter labels
func sayHello(to name: String) { //parameter is called to name
    print("Hello, \(name)!") //internally, parameter is "name"
}
sayHello(to: "Taylor") //externally, parameter is "to"

//omitting parameter labels
func greet(_ person: String) { // _  removes external parameter name
    print("Hello, \(person)!")
}
greet("Taylor")

//default parameters
func greet(_ person: String, nicely: Bool = true) { //default parameter for nicely
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet("Taylor") //accepts default nicely parameter
greet("Taylor", nicely: false) //explicitly specific nicely parameter

//variadic functions: accept multiple parameters of the same time
print("Haters", "gonna", "hate")
//to write a variadic function, use ...
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4, 5)

//writing throwing functions: throw errors
enum PasswordError: Error { //define enum for errors that we can throw
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious //throws error if obvious
    }
    return true
}

//running throwing functions: "do" starts a section of code that might cause problems, "try" is used before every function that might throw an error, and "catch" lets you handle errors gracefully.
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//inout parameters: all parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.
func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 10 //must use a variable integer
doubleInPlace(number: &myNum) //must pass doubleInPlace with &, which explicitly recognizes that the variable is being used as inout
