//day11.swift: protocols and extensions
//Jimmy Zhang @ 1/5/2021

//protocols: a way of describing what properties or methods something must have, but don't provide implementations of those methods
protocol Identifiable { //requires all identifying types to have an id string that can be read ("get") or written ("set")
    var id: String { get set }
}
struct User: Identifiable { //we can't create instances of the protocol, but we can create a struct that conforms to it
    var id: String
}

//protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}
protocol NeedsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}
protocol Employee: Payable, NeedsTraining, HasVacation { } //inherits three protocols

//extensions: allow you to add methods to existing types
extension Int {
    func squared() -> Int { //adds squared() method to Int type
        return self * self
    }
}
//swift doesn't let you add stored properties in extensions, but you can add computed properties
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//protocol extensions: let you add methods and computed properties to protocols
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
extension Collection { //both arrays and sets conform to the Collection protocol
    func summarize() { //both Array and Set will now have the summarize() method
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

//protocol-oriented programming: the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
protocol Identifiable { //requires all conforming types to have an id property and an identify() method
    var id: String { get set }
    func identify()
}
extension Identifiable {
    func identify() { //protocol extension allows us to provide a default implementation of identify()
        print("My ID is \(id).")
    }
}
struct User: Identifiable { //User gets identify() automatically from the protocol
    var id: String
}
let twostraws = User(id: "twostraws")
twostraws.identify()
