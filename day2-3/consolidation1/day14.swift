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
//use optional when
var status: String?
status = getHaterStatus(weather: "rainy")

