//day14.swift: review 2
//Jimmy Zhang @ 1/5/2021

//functions
//no parameter function
func favoriteAlbum() {
    print("My favorite is Fearless")
}
favoriteAlbum()
//one String parameter function
func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}
favoriteAlbum(name: "Fearless")
//two parameter function
func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}
printAlbumRelease(name: "Fearless", year: 2008)
//external vs. internal parameter names
func countLettersInString(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}
countLettersInString(myString: "Hello") //referred to as myString
//can also use underscore so no external parameter name
func countLettersInString(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}
countLettersInString("Hello")
//external parameter names like “in”, “for”, and “with”, and more meaningful internal names
func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}
countLetters(in: "Hello")
//return values
func albumIsTaylor(name: String) -> Bool { // return type -> Bool
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }
    return false
}
if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}
if albumIsTaylor(name: "Blue") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

//optionals
//one of the most common ways that code fails is when it tries to use data that is bad or missing
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}
//use optional when you don't know for sure which type to return: String or nil etc
var status: String?
status = getHaterStatus(weather: "rainy")
//optional unwrapping: checks whether an optional has a value, and if so unwraps it into a non-optional type then runs a code block.
func yearAlbumReleased(name: String) -> Int? { // Int? since we don't know if it returns an Int or nil
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }
    return nil
}
//unwrap using if let
if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional value!
} else {
    // in case you want an else block, here you go…
}
//force unwrapping optionals
func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }
    return nil
}
var year = yearAlbumReleased(name: "Red")
if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year)")
}
print("It was released in \(year!)") // ! to force unwrap

//optional chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}
let album = albumReleased(year: 2006)
print("The album is \(album)")
let str = "Hello world"
print(str.uppercased())
let album = albumReleased(year: 2006)?.uppercased() //everything after the ? will only be run if everything before the ? has a value
print("The album is \(album)")
//nil coalescing operator: ??
let album = albumReleased(year: 2006) ?? "unknown" //if albumReleased() returns nil, assign "unknown" to album
print("The album is \(album)")

//enumerations
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}
func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
    }
}
//enums with additional values
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int) //takes an Int parameter
    case snow
}
func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}
getHaterStatus(weather: WeatherType.wind(speed: 5))

//structs
struct Person {
    var clothes: String
    var shoes: String
}
let taylor = Person(clothes: "T-shirts", shoes: "sneakers") //swift automatically generates a memberwise intializer for structs
print(taylor.clothes) //can read properties of structs with .
//functions inside structs
struct Person {
    var clothes: String
    var shoes: String

    func describe() { //method inside struct
        print("I like wearing \(clothes) with \(shoes)")
    }
}

//classes
class Person {
    var clothes: String
    var shoes: String
    init(clothes: String, shoes: String) { //must have init method
        self.clothes = clothes
        self.shoes = shoes
    }
}
//class inheritance
class Singer {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func sing() {
        print("La la la la")
    }
}
class HeavyMetalSinger: Singer { // inherits from Singer
    var noiseLevel: Int
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age) //super.init calls init from parent class
    }
    override func sing() { // can use override to override parent method
        print("Grrrrr rargh rargh rarrrrgh!")
    }
}
