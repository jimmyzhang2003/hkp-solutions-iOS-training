//day7.swift: closures part 2
//Jimmy Zhang @ 1/5/2021

//using closures as parameters when they accept other parameters
func travel(action: (String) -> Void) { //travel accepts a closure, which accepts a String
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
travel { (place: String) in //trailing closure syntax
    print("I'm going to \(place) in my car")
}

//using closures as parameters when they return values
func travel(action: (String) -> String) { //closure accepts String and returns String
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel { (place: String) -> String in //trailing closure syntax (now requires accepting and returning a String)
    return "I'm going to \(place) in my car"
}

//shorthand parameter names
func travel(action: (String) -> String) { //travel function
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel { (place: String) -> String in  //call travel
    return "I'm going to \(place) in my car"
}
travel { place -> String in //swift knows that parameter to closure must be a String, so we can remove it
    return "I'm going to \(place) in my car"
}
travel { place in // it also knows the closure must return a string, so we can remove that:
    return "I'm going to \(place) in my car"
}
travel { place in //as the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:
    "I'm going to \(place) in my car"
}
travel { // rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
    "I'm going to \($0) in my car"
}

//closures with multiple parameters
func travel(action: (String, Int) -> String) { //closure takes two parameters
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel {
    "I'm going to \($0) at \($1) miles per hour." //two parameters
}

//returning closures from functions
func travel() -> (String) -> Void {  //returns closure that accepts string and returns void
    return {
        print("I'm going to \($0)")
    }
}
let result = travel()
result("London")

//capturing values: if you use any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist anymore.
func travel() -> (String) -> Void { //travel function returns a closure
    return {
        print("I'm going to \($0)")
    }
}
let result = travel() //call travel to get back closure, then call closure freely
result("London")
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
result("London")
result("London")
result("London") //even though the counter variable was created inside travel(), it gets captured by the closure, so the counter will continue to go up

