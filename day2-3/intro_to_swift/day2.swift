//day2.swift: complex types
//Jimmy Zhang @ 1/3/2021

//arrays: collections of values that are stored as a single value
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"
let beatles = [john, paul, george, ringo] //creates an array of 4 Strings
//arrays start from index 0
beatles[1] //returns "Paul Mccartney"
//array type annotations: [String], [Int], [Double], and [Bool]

//sets: collections of values where order does not matter and all items are unique
let flavors = Set(["sweet", "salty", "spicy"]) //create set from array

//tuples: store several values together as a single value, but are fixed in size and type
var name = (first: "Taylor", last: "Swift")
name.0 //access using numerical position
name.first //or access using name

//arrays vs. sets vs. tuples
//arrays: if you need a collection of values that can contain duplicates, or the order of your items matters
//sets: if you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly
//tuples: if you need a specific, fixed collection of related values where each item has a precise position or name

//dictionaries: collections of values where items are accessed with keys/identifiers
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"] //returns 1.78 from the "Taylor Swift" identifier
//dictionary type annotations: [String: Double], [String: String], etc.

//dictionary default values
let favoriteColor = [
    "Jimmy": "black"
    "Nemo": "blue"
]
favoriteColor["Andrew"] //returns nil
favoriteColor["Andrew", default: "Unknown"] //returns default value "Unknown"

//creating empty collections
var teams = [String: String]() //creates empty dictionary
teams["Paul"] = "Red" //add entries to dictionary
var results = [Int]() //creates empty array of type Int
var words = Set<String>() //creates empty set of type String

//enumerations: define groups of related values in a way that makes them easier to use (for safety)
enum Result {  //creates a Result type that can be either success or failure
    case success
    case failure
}
let result1 = Result.failure

//enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "sports") //enum associated values allow us to add extra details

//enum raw values
enum Planet: Int {  //creates Planet enum that stores integer values for each case; swift automatically assigns each case a number starting from 0
    case mercury
    case venus
    case earth
    case mars
}
let earthValue = Planet(rawValue: 2)  //returns value of earth from Planet since earth is assigned number 2
enum Planet: Int {
    case mercury = 1  //explicitly assign mercury to 1, and swift generates the rest from there
    case venus
    case earth
    case mars
}
//or you can give each case specific values if you want
