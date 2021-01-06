//day13.swift: review 1
//Jimmy Zhang @ 1/5/2021

//variables and constants
var name = "Jimmy"
name = "James"
let name2 = "Tim"
name2 = "Romeo" //cannot change constants

//types of data
var name3: String //type annotation  //string
name = "Tim McGraw"
var age: Int //Int
age = 25
var latitude: Double //Double
latitude = 36.166667
var longitude: Float //Float
longitude = -86.783333
var stayOutTooLate: Bool //Bool
stayOutTooLate = true

//operators
var a = 10
a = a + 1
a = a - 1
a = a * a
var b = 10
b += 10
b -= 10
//string concatenation
var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2
//comparison operators
var a = 1.1
var b = 2.2
var c = a + b
c > 3
c >= 3
c > 4
c < 4
var name = "Tim McGraw"
name == "Tim McGraw"
name != "Tim McGraw"
var stayOutTooLate = true
!stayOutTooLate

//string interpolation
var name = "Tim McGraw"
var age = 25
"Your name is \(name). In another \(age) years you will be \(age * 2)."

//arrays
var evenNumbers = [2, 4, 6, 8] //Int array
var songs = ["Shake it Off", "You Belong with Me", "Back to December"] //String array
songs[0]
songs[1]
songs[2]
type(of: songs) //prints Array<String>.Type
var songs: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3] //Any array
//creating an array
var songs: [String] = [] //type annotation
var songs = [String]()
//array operators
var songs = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both = songs + songs2
both += ["Everything has Changed"]

//dictionaries
var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]
person["middle"]
person["month"]

//conditional statements
var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "play"
} else {
    action = "cruise"
}
//evaluating multiple conditions
var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "play"
} else {
    action = "cruise"
}

//loops
for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}
var str = "Fakers gonna"
for _ in 1 ... 5 { //use _ when you don't need to know index number
    str += " fake"
}
print(str)
//looping over arrays
var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]
for song in songs {
    print("My favorite song is \(song)")
}
//for i in loop through array
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]
for i in 0 ... 3 {
    print("\(people[i]) gonna \(actions[i])")
}
//to count how many items are in an array, use someArray.count
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< people.count {
    print("\(people[i]) gonna \(actions[i])")
}
//inner loops
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]
for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"
    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }
    print(str)
}
//while loop with break
var counter = 0
while true {
    print("Counter is now \(counter)")
    counter += 1
    if counter == 556 {
        break
    }
}
//while loop with continue
var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]
for song in songs {
    if song == "You Belong with Me" {
        continue
    }
    print("My favorite song is \(song)")
}

//switch case
let liveAlbums = 2
switch liveAlbums {
case 0:
    print("You're just starting out")
case 1:
    print("You just released iTunes Live From SoHo")
case 2:
    print("You just released Speak Now World Tour")
default:
    print("Have you done something new?")
}
//switch case over range
let studioAlbums = 5
switch studioAlbums {
case 0...1:
    print("You're just starting out")
case 2...3:
    print("You're a rising star")
case 4...5:
    print("You're world famous!")
default:
    print("Have you done something new?")
}
