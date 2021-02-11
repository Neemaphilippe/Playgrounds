import UIKit

var str = "Hello, playground"

// Structs are value types - value is copied when its assigned to a variable or constant
// Structs you can make a copy and change its properties and that wont affect the original copy
// Structs properties are immutable by default
// Take a look at this struct that represents an alien:

struct Alien {
    var name: String
    var height: Double
    var homePlanet: String
}
var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")

bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"

var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter"

// when we run charles.homePlanet after this, we will get Pluto
// line 22 created a copy of charles but because this is a value type we can change the properties of the copy without changing the value of the original charles
// charlesFromJupiter.homePlanet will be Jupiter

struct Person {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    var fullName: String {
        // computed property
        if let middleName = middleName {
            return "\(firstName) \(middleName) \(lastName)"
        } else {
            return "\(firstName) \(lastName)"
        }
    }
}

var calvin = Person(firstName: "Calvin", middleName: nil, lastName: "Jones")
var josh = Person(firstName: "Josh", middleName: "Ode", lastName: "Jesse")
print(calvin.firstName)
print(calvin.fullName)
print(josh.fullName)

//Swift by Sundell

//enum State {
//    case awaitingDownload
//    case downloaded
//    case listening
//    case finished
//
//    var isDownloaded: Bool {
//        switch state {
//        case .awaitingDownload: return false
//        case .downloaded, .listening, .finished:
//            return true
//        }
//    }
//}

// 5. Create a struct called Book that has properties title, author and rating, of type String, String, and Double respectively. Create some instances of Book.
// Add a computed property to Book called isGood that returns true if its rating is greater than or equal to 7 and test this new functionality with one of the created instances above.

struct Book {
    var title: String
    var author: String
    var rating: Double
    
    var isGood: Bool {
        return rating >= 7
    }

}

var neemasBook = Book(title: "Harry Potter", author: "J.K Rowling", rating: 10)
print(neemasBook.isGood)

// 6a. Make a struct called FreezingPoint that has three static properties: celsius, fahrenheit, and kelvin. Give them all values equal to the freezing point of water.
// static properties - static let
struct FreezingPoint {
    static let celsius: Double = 0
    static let fahrenheit: Double = 1.8 * celsius + 32
    static let kelvin: Double = celsius + 273
    
}
// 6b. Make a struct called Celsius that has one property: celsius, and two methods getFahrenheitTemp, and getKelvinTemp. Make the values of fahrenheit and kelvin correct values, converted from the celsius property.

struct Celsisus {
    var celsius: Double
    
    var isFreezing: Bool {
        return celsius < 0
    }
    
    func getFahrenheitTemp() -> Double {
        return 1.8 * celsius + 32
        
    }
    
    func getKelvinTemp() -> Double{
        return celsius + 273
    }
    
    
}
// 6c. Give the Celsius struct a computed property called isBelowFreezing that returns a Bool (true if the temperature is below freezing) and test your new property on the tenDegreesCelsius instance.
var tenDegreesCelsius = Celsisus(celsius: -1)
print(tenDegreesCelsius.isFreezing)

// 7. Create a struct called RGBColor that has 3 properties, red, green, blue that are all of type Double.
// Given the below array of color dictionaries, create an array of RGBColor.


struct RGBColor {
    var red: Double
    var green: Double
    var blue: Double
}

let colorDictArray: [[String: Double]] = [["red": 1.0, "green": 0.0, "blue": 0.0],
 ["red": 0.0, "green": 1.0, "blue": 0.0],
 ["red": 0.0, "green": 0.0, "blue": 1.0],
 ["red": 0.6, "green": 0.9, "blue": 0.0],
 ["red": 0.2, "green": 0.2, "blue": 0.5],
 ["red": 0.5, "green": 0.1, "blue": 0.9],]

var colorArray: [RGBColor] = []

for dict in colorDictArray {
    // unwrap optionals
    if let red = dict["red"],
    let green = dict["green"],
    let blue = dict["blue"] {
        colorArray.append(RGBColor(red: red, green: green, blue: blue))
    }
}
print(colorArray.first?.red ?? 0.0)

// 8. Create a struct called Movie that has properties for name (String), year (Int), genre (String), cast ([String]), and description (String) which is a property of the CustomStringConvertible protocol. Create an instance of your Movie class.
// Sample Output:
// print(theBanker)
// The Banker is a Drama released in 2020 with the following cast members: Anthony Markie, Samuel L. Jackson, Nicholas Hoult and Nia Long

struct Movie: CustomStringConvertible {
    var name: String
    var year: Int
    var genre: String
    var cast: [String]
    var description: String {
        var castMembers = ""
        for (index, actor) in cast.enumerated() {
            var endStr = index == cast.count - 1 ? "" : ","
                if index == cast.count - 2 { endStr = " and "}
                castMembers += actor + endStr
        }
        return "\(name)"
    }
}

let weather = 75
var message = ""
let coldMessage = "Make sure you put on your scarf."
let warmMessage = "Don’t need a scarf today."
//if weather < 40 {
//  message = coldMessage
//} else {
//  message = warmMessage
//}
// ternary operator (condition) ? (if true) : (else false)
message = weather < 40 ? coldMessage : warmMessage
print(message)


// let neemasMovie = Movie(name: "The Notebook", year: 2004, genre: "Romance", cast: ["Ryan Gosling", "Rachel McAdams"], description: "The Notebook is a 2004 American romantic drama film")
// Given two arrays return an array of duplicates

let arrayOne = [1, 3, 6, 8]
let arrayTwo = [4, 1, 2, 9]


func getDuplicates(_ arrayOne: [Int], _ arrayTwo: [Int]) -> [Int] {
    
    var duplicatesArray = [Int]()
    
    for i in arrayOne {
        for j in arrayTwo {
            if i == j {
                duplicatesArray.append(i)
                print(duplicatesArray)
            } else {
                print("not a match")
            }
        }
    }
    return duplicatesArray
}

let arrOne = [4, 4, 3, 6, 7]
let arrTwo = [1, 4, 2, 3, 8]
//let duplicateArr = arrOne.filter(arrTwo.contains)

func getDuplicate(_ arrOne: [Int], _ arrTwo: [Int]) -> [Int] {
    var duplicateArr = [Int]()
    var uniqueValues = Set(arrOne + arrTwo)
    
    for num in arrOne {
        if arrTwo.contains(num) {
            duplicateArr.append(num)
        }
    }
    
    return duplicateArr
}
