//: [Previous](@previous)

import Foundation

// implicit assignment of raw values
enum Face1: String {
  case happy
  case sad
  case nerd
}
Face1.happy.rawValue

// explicit assignment of raw values
enum Face2: String {
  case happy = ":-)"
  case sad = ":-("
  case nerd = "8-)"
}
Face2.happy.rawValue

// implicit assignment of raw values
enum Weekday1: Int {
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
}
Weekday1.monday.rawValue

// explicit assignment of raw values
enum Weekday2: Int {
  case monday = 1
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
}
Weekday2.monday.rawValue

// CHALLENGES
// 1. Model a type called CardinalDirection using an enum. What could be the different values for this type?

enum CardinalDirection: String {
    case North = "↑"
    case South = "↓"
    case East = "→"
    case West = "←"
}

// 2. Write a function called help, that takes a value of type CardinalDirection and returns a String.

func help (direction: CardinalDirection) -> String {
    var string: String = ""
    if direction == .North || direction == .East {
        string = "The ship needs to go \(direction)"
    } else if direction == .South || direction == .West {
        string = "This direction \(direction) does not help the ship to get home"
    }
    return string
}

help(direction: .South)

// 3. Model a type called Month using an enum. That type should represent all the different months in one year.

enum Month: Int {
    case January = 1
    case February = 2
    case March = 3
    case April = 4
    case May = 5
    case June = 6
    case July = 7
    case August = 8
    case September = 9
    case October = 10
    case November = 11
    case December = 12
}


// 4. Write a function that returns a String and indicates at which position this month is inside a year, e.g.: March is the 3rd month of the year.

func monthForYear(month: Month) -> String {
    var number: String = "\(month.rawValue)"
    switch month {
        case .January: number += "st"
        case .February: number += "nd"
        case .March: number += "rd"
        default: number += "th"
    }
    return "\(month) is the \(number) month of the year"
}

monthForYear(month: .January)
monthForYear(month: .February)
monthForYear(month: .March)
monthForYear(month: .April)
monthForYear(month: .May)
monthForYear(month: .November)
/*:
 
 ### Challenges
 
 1. Model a type called `CardinalDirection` using an `enum`. What could be the different _values_ for this type?
 2. Write a function called `help`, that takes a value of type `CardinalDirection` and returns a `String`. This function is supposed to help a lost ship on an ocean to find its way back home (it needs to go north-east). The return value of the function should indicate whether the value that was passed in helps the ship to get home. Use an *arrow unicode character* (`→`, `←`, `↑`, `↓`) in the returned `String` to illustrate the direction on a map, e.g.: `This direction (↓) does not help the ship to get home.`
 3. Model a type called `Month` using an `enum`. That type should represent all the different months in one year. 
 4. Write a function that returns a `String` and indicates at which position this month is inside a year, e.g.: `March is the 3rd month of the year`.
 */











