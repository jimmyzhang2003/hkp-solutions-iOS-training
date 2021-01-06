//day8.swift: structs part 1
//Jimmy Zhang @ 1/5/2021

//creating structures (structs)
struct Sport {
    var name: String //variables inside structs are called properties
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis" //can modify name of struct object

//computed properties
struct Sport {
    var name: String //name is a stored property
    var isOlympicSport: Bool

    var olympicStatus: String {  //olympicStatus is a computed property, which returns different values depending on other properties
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//property observers: allow you to run code before or after any property changes
struct Progress {
    var task: String
    var amount: Int {
        didSet { //prints a message every time amount changes
            print("\(task) is now \(amount)% complete")
        }
    }
}
progress.amount = 30
progress.amount = 80
progress.amount = 100

//methods: functions inside structs
struct City {
    var population: Int

    func collectTaxes() -> Int { //method
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes() //call methods on instances of the stuct

//mutating methods
//when you want to change a property inside a method, mark it with the mutating keyword
struct Person {
    var name: String
    mutating func makeAnonymous() { //mutating keyword allows you to change property inside method
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous() //can only be called on Person instances that are variables

//properties and methods of strings
//strings are structs
let string = "Do or do not, there is no try."
print(string.count) //You can read the number of characters in a string using its count property
print(string.hasPrefix("Do")) //returns true if the string starts with specific letters
print(string.uppercased()) //uppercases a string
print(string.sorted()) //sorts letters of strings into an array

//properties and methods of arrays
//arrays are also structs
var toys = ["Woody"]
print(toys.count) //reads number of items in array
toys.append("Buzz") //appends item
toys.firstIndex(of: "Buzz") //locate index of item in array
print(toys.sorted()) //sorts array items
toys.remove(at: 0) //remove array item
