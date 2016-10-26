
/*:
 Enumerations (`enum`s) are a very powerful and useful construct in the `Swift` language. They help you to express the _semantics_ of your code very explicitly and let the compiler help you to enforce them.
 
 Generally, `enum`s are a way to model a type that can only contain a limited range of values. Let's step back and consider for a second what that means. A _type_ in a programming language describes a range of _values_. Let's consider a few examples:
 
 The type `UInt8` in Swift has as values all _ unsigned integers_ that can be created out of 8 bits, more precisely, the range of values will be all integers from 0 to 255.
 
 The type `String` in Swift describes all possible sequences of characters, so it has an _infinite_ range.
 
 A custom type `Person` that looks like this
 ```
 struct Person {
 let name: String
 }
 ```
 can describe any person with any `name` (which is a `String`, so again we will have an infinite range of values for the type `Person`).
 
 So, `enum`s work particularly well whenever we want to model a type of which we know that it has a limited amount of values and we want to express this in our code.
 */

// bad model: name could be any string and the compiler can't know help us identfying invalid ones
//struct FirstQuarterTechnicalCourse {
//  let name: String
//}

// better model: we have exactly 5 Courses in the first quarter that are known upfront; now the compiler will only allow valid coursees to be created
enum FirstQuarterTechnicalCourse {
  case python
  case frontend
  case ruby
  case ios_advanced
  case ios_accelerated
}

// creating enum values requires an explicit type annonation of the enum's type
let course1 = FirstQuarterTechnicalCourse.python
let course2: FirstQuarterTechnicalCourse = .frontend
//var w3 = .ruby // doesn't work because the compiler doesn't know the enum type

// you can do regular comparisons with enums using if:
if course1 == course2 {
  print("these two are the same")
}
else {
  print("these two are different")
}

// but what's even better to use a switch statement and do pattern matching:
func getCourseName(course: FirstQuarterTechnicalCourse) -> String {
  var courseName: String
  switch course {
  case .python: courseName = "Back-end Web: API Services with Python & Flask"
  case .frontend: courseName = "Front-end Web: Interactive Websites with JavaScript"
  case .ruby: courseName = "Full-stack development with Ruby"
  case .ios_advanced: courseName = "Advanced Topics in iOS & Swift"
  case .ios_accelerated: courseName = "Mobile Apps with iOS & Swift"
  }
  return courseName
}

let courseNameForCourse1 = getCourseName(course: course1)
print("The course is called: \(courseNameForCourse1)")

// switch statements can also bundle multiple cases
func getCourseType(course: FirstQuarterTechnicalCourse) -> String {
  var courseType: String
  switch course {
    case .python, .frontend, .ruby: courseType = "Web"
    case .ios_accelerated, .ios_advanced: courseType = "Mobile"
  }
  return courseType
}
let courseTypeForCourse1 = getCourseType(course: course1)
print("The course is of type: \(courseTypeForCourse1)")

func isMobileCourse(course: FirstQuarterTechnicalCourse) -> Bool {
  switch course {
  case .ios_advanced, .ios_accelerated: return true
  default: return false
  }
}

let isMobile = isMobileCourse(course: course1)
print("The course is a mobile course: \(isMobile)")


// CHALLENGES
// Challenge 1: Model a type called Weekday that represents the different days of the week.

enum Weekday {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

// Challenge 2: Write a function called getWeekdayName that takes a Weekday returns the name of each weekday as a String.

func getWeekdayName(weekday: Weekday) -> String {
    return "This weekday is called \(weekday)"
}

getWeekdayName(weekday: .Tuesday)


// Challenge 3: Write a function called isItFinallyWeekend that takes a Weekday and returns a String indicating whether the argument is a weekend weekday, eg: "Monday is a regular workday." or "Wuhuuuu, it's SATURDAYYYYYYYY."

func isItFinallyWeekend(weekday: Weekday) -> String {
    switch weekday {
    case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday: return "\(weekday) is a regular workday."
    case .Saturday: return "Wuhuuuu, it's SATURDAYYYYYY."
    case .Sunday: return "It's a weekend day."
    }
}

isItFinallyWeekend(weekday: .Saturday)
/*:
 ### Challenges
 
 1. Model a type called `Weekday` that represents the different days of the week.
 2. Write a function called `getWeekdayName` that takes a `Weekday` returns the name of each weekday as a `String`, e.g.: `"This weekday is called Sunday."`
 3. Write a function called `isItFinallyWeekend` that takes a `Weekday` and returns a `String` indicating whether the argument is a weekend weekday, e.g.: `"Monday is a regular workday."` or `"Wuhuuuu, it's SATURDAYYYYYYYY."`
 */

