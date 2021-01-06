//day9.swift: structs part 2
//Jimmy Zhang @ 1/5/2021

//initializers: special methods that provide different ways for creating a struct
struct User { //creates a default initializer (memberwise initializer) that asks for you to provide a value for each property
    var username: String
}
var user = User(username: "twostraws") //default initalization
struct User {
    var username: String

    init() { //our own initializer, replacing the default one
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User() //our new initalization, which accepts no parameters
user.username = "twostraws"

//referring to the current instance: self
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name //self points to the instance of the struct currently used
    }
}

//lazy properties
struct Person {
    var name: String
    lazy var familyTree = FamilyTree() //lazy keyword ensures that this property is only created when it's needed

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
ed.familyTree //familyTree property gets created because it is finally accessed

//static properties and methods
struct Student {
    static var classSize = 0 //belongs to the class, not the instances
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
print(Student.classSize) //to access the static property, must call from the class

//access control: lets you restrict which code can use properties and methods
struct Person {
    private var id: String //private keyword restricts this property to methods inside the struct (cannot be used outside)

    init(id: String) {
        self.id = id
    }

    func identify() -> String { //can use id property because they are in same class
        return "My social security number is \(id)"
    }
}
//other option is public, which allows all other code use the property or method
