//day4.swift: loops
//Jimmy Zhang @ 1/5/2021

//loops let us repeat code until a condition is false
//for loops
let count = 1...10
for num in count {
    print("Number is \(num)")
}
for _ in 1...10 { //use underscore when you don't need the loop variable
    print("Hello world")
}

//while loops: provide explicit condition to check
var num = 10
while num <= 15 {
    print(num)
    number+=1
}

//repeat loops: similar to while loop, but condition comes at end
var number = 25
repeat {
    print(number)   //print number and then only checks condition at the end
    number += 1
} while number <= 20

//exiting loops
var countDown = 5
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break //exits loop
    }

    countDown -= 1
}

//exiting multiple loops
for i in 1...10 {  //this is a nested loop
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}
//to exit a nested loop, give the outerloop a label
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop //exits out of outer loop
        }
    }
}
//regular breaks will only exit the inner loop

//skipping items
for i in 1...10 {
    if i % 2 == 1 {
        continue  //skips this iteration and continues to the next iteration
    }

    print(i)
}

//infinite loops
while true { //condition is always met
    print("Hi")
}
