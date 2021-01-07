//day14.swift: review 3
//Jimmy Zhang @ 1/5/2021

//properties
//structs and classes can have their own properties: variables and constants
struct Person {
    var clothes: String //property
    var shoes: String //property

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
taylor.describe()
other.describe()
//property observers
struct Person {
    var clothes: String {
        willSet { //Swift provides your code with a special value called newValue that contains what the new property value is going to be
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }

        didSet { // you are given oldValue to represent the previous value
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}
func updateUI(msg: String) {
    print(msg)
}
var taylor = Person(clothes: "T-shirts")
taylor.clothes = "short skirts"
//computed properties
struct Person {
    var age: Int
    var ageInDogYears: Int { //computed property
        get { //computed properties use get or set ; remove get if you intend to only use for reading data
            return age * 7
        }
    }
}
var fan = Person(age: 25)
print(fan.ageInDogYears)
//static properties and methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do" //belongs to the type instead of objects of the type
    var name: String
    var age: Int
}
let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong) //access static var from type
//access control
/*
 Public: this means everyone can read and write the property.
 Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.
 File Private: this means that only Swift code in the same file as the type can read and write the property.
 Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.
 */
//polymorphism and typecasting
class Album {
    var name: String
    init(name: String) {
        self.name = name
    }
    func getPerformance() -> String { //method
           return "The album \(name) sold lots"
       }
}
class StudioAlbum: Album { //subclass of Album
    var studio: String
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
}
class LiveAlbum: Album { //subclass of Album
    var location: String
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    override func getPerformance() -> String { //overrides parent method
           return "The studio album \(name) sold lots"
       }
}
var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive] //we can put all the albums together in an array because they can all be considered type Album
//converting types with typecasting
for album in allAlbums {
    print(album.getPerformance())
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio) //prints studio if type StudioAlbum
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location) //prints location if type LiveAlbum
    }
}
//forced downcast
for album in allAlbums as! [StudioAlbum] {
    print(album.studio)
}
//converting common types with initializers
let number = 5
let text = String(number)
print(text)

//closures: variables that hold code
let vw = UIView()
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})
//trailing closures
let vw = UIView() //same thing as previous example, but simplified
UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}

//protocols: define a set of methods and properties that a type must implement if it says it conforms to the protocol
protocol Employee {
    var name: String { get set } //conforming types must make this variable gettable and settable
    var jobTitle: String { get set } //conforming types must make this variable gettable and settable
    func doWork() //defines doWork() but does not provide implementation
}
struct Executive: Employee { //conforms to protocol
    var name = "Steve Jobs"
    var jobTitle = "CEO"
    func doWork() { //implements doWork()
        print("I'm strategizing!")
    }
}
struct Manager: Employee { //conforms to protocol
    var name = "Maurice Moss"
    var jobTitle = "Head of IT"
    func doWork() { //implements doWork()
        print("I'm turning it off and on again.")
    }
}
let staff: [Employee] = [Executive(), Manager()] //creates Employee array
for person in staff {
    person.doWork()
}

//extensions: add functionality to code
extension Int { //adds functionality to Int type
    mutating func plusOne() { //mutating keyword allows method to change values
        self += 1
    }
}
extension String {
    mutating func trim() {
        self = trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

//protocol extensions: let us define implementations of things inside the protocol
extension Int { //extension of Int type
    func clamp(low: Int, high: Int) -> Int {
        if (self > high) {
            // if we are higher than the upper bound, return the upper bound
            return high
        } else if (self < low) {
            // if we are lower than the lower bound, return the lower bound
            return low
        }
        // we are inside the range, so return our value
        return self
    }
}
let i: Int = 8
print(i.clamp(low: 0, high: 5)) //because 8 is higher than the upper bound of 5, that will print 5.
