//day3.swift: operators and conditions
//Jimmy Zhang @ 1/5/2021

//arithmetic operators
let x = 12
let y = 4
let difference = x-y
let total = x+y
let product = x*y
let quotient = x/y
let remainder = x%y #

//operator overloading
let a = 1;
let b = a+a // + used to sum integers
let fakers = "Fake"
let action = fakers + "fake" // + used to concatenate strings
let firstHalf = ["John", "Paul"]
let beatles = firstHalf + ["George", "Ringo"] // + used to join arrays

//compound assignment operators
var score = 50
score -= 5
score *= 5
var quote = "Hello"
quote += "world"

//comparison operators
let first = 10
let second = 5
first == second
first != second
first < second
first >= second
"Hello" <= "World" //returns true/false based on alphabetical order

//conditions
let firstCard = 10
let secondCard = 15
if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

//combining conditions
let myAge = 17
let yourAge = 14
if age1 > 18 && age2 > 18 {  // and: &&
    print("Two adults")
}
else if age1 > 18 || age2 > 18 {  //or: ||
    print("At least one adult")
} else {
    print("No adults")
}

//ternary operator: checks a condition specified in the first value, returns the second value if it's true, but returns the third value if it's false
let num1 = 10
let num2 = 20
print(num1 == num2 ? "Same numbers" : "Different numbers")

//switch statements: alternative to if/else when there are multiple conditions
let weather = "sunny"
switch weather {
case "rain":
    print("Bring umbrella")
case "snow":
    print("Stay warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough //continues execution onto the next case even after a case is met
default: //default (else)
    print("Have a nice day")
}

//range operators
let score = 100
switch score { //ranges are useful in switch blocks
// the half-open range operator: ..< creates ranges up to but excluding the final value
// the closed range operator: ... creates ranges up to and including the final value
case 0..<50:  //
    print("You failed badly.")
case 50...85:
    print("You did OK.")
default:
    print("You did great!")
}
