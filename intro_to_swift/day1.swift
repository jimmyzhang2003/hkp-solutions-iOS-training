//day1.swift: simple types
//Jimmy Zhang @ 1/3/2021

//variables
var str = "Hello"  //initialize variable (type String)
str = "Bye" //change variable content

//strings and integers
var age = 12 //(type Int)
var population = 2_000_000 //(underscores separate thousands)

//multi-line strings
//shows \n in between line breaks
var str1 = """
Multi-line
string
"""
//include \ to get rid of \n
var str2 = """
Multi-line \
string
"""

//doubles and booleans
var pi = 3.1415 //double
var happy = true //boolean

//string interpolation
var score = 50
var str3 = "Your score was \(score)" //returns "Your score was 50"

//constants
let taylor = "swift" //cannot change value

//type annotations
let str = "Hello, world" //inferred String type (type inference)
//explicit data type declaration
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
