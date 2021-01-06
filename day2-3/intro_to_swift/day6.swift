//day6.swift: closures part 1
//Jimmy Zhang @ 1/5/2021

//creating basic closures
let driving = {  //creates a function without a name and assigns it to driving
    print("I'm driving in my car")
}
driving()

//accepting parameters in a closure
let driving = { (place: String) in  //parameters listed inside parenthesis right after the open braces
    print("I'm going to \(place) in my car")
}
driving("London") // no parameter labels when using closures

//returning values from a closure
let drivingWithReturn = { (place: String) -> String in //put return type inside closure after parameters: -> String
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)

//closures as parameters
func travel(action: () -> Void) {  //to pass closure into a function, we specify parameter type as () -> Void
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)

//trailing closure syntax: if the last parameter to a function is a closure, you can pass it directly after the function inside braces
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel() { //because its last parameter is a closure, we can call travel() using trailing closure syntax
    print("I'm driving in my car")
}
travel { //since there aren't any other parameters, we can remove the parentheses
    print("I'm driving in my car")
}
