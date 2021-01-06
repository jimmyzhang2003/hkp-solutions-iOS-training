//day10.swift: classes
//Jimmy Zhang @ 1/5/2021

/* Classes vs. Structs
 1) Classes never come with a memberwise (default) initializer
 2) You can create a class based on an existing class (inheritance).
 3) When you copy a struct, changing one won't change the other. When you copy a class, both the original and the copy point to the same thing.
 4) Classes can have deinitializers (destructors).
 5) If you have a constant struct with a variable property, the property cannot be changed. However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.
 */

//creating classes
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) { //must create own initializer
        self.name = name
        self.breed = breed
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle") //instance of class

//class inheritance
class Poodle: Dog { //inherits the same properties and initalizer as Dog
}
class Poodle: Dog {
    init(name: String) { //can also create a new initalizer
        super.init(name: name, breed: "Poodle") //super.init calls the parent initalizer
    }
}

//overriding methods: child classes can replace parent methods with their own implementations
class Dog {
    func makeNoise() { //makeNoise() method in parent class
        print("Woof!")
    }
}
class Poodle: Dog {
    override func makeNoise() { //overrides parent makeNoise() method
        print("Yip!")
    }
}

//final classes: no other class can inherit from final classes
final class Dog { //final keyword
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//copying objects: when you copy a class, changing one changes the other
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer() //create instance of Singer
print(singer.name)
var singerCopy = singer //point to the same object in memory as singer
singerCopy.name = "Justin Bieber"
print(singer.name) //would print "Justin Bieber"

//deinitializers
class Person {
    var name = "John Doe"
    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit { //called when object is destroyed
        print("\(name) is no more!")
    }

}
for _ in 1...3 {
    let person = Person()
    person.printGreeting()  //calls the deinitializer after each iteration
}

//mutability: can change any variable property on a class even when the class is created as a constant
class Singer {
    var name = "Taylor Swift"
}
let taylor = Singer() //declare constant object of class
taylor.name = "Ed Sheeran" //allows property to be changed even though class object is constant
print(taylor.name)

class Singer {
    let name = "Taylor Swift" //to stop this from happening, make the property constant
}
