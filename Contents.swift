import UIKit

var greeting = "Hello, playground"

// MARK:- VARIABLES AND CONSTANTS

var name = "Jona"
name = "JONA"

let constantName = "JONA"
// constantName = "jona" // xcode complains: Cannot assign to value: 'constantName' is a 'let' constant

// MARK:- TYPES OF DATA

// String
// Int

// TYPE SAFETY:-

//name = 25 // xcode complains: Cannot assign value of type 'Int' to type 'String'
var age: Int
// age = "1234" // xcode complains: Cannot assign value of type 'String' to type 'Int'

// Float
// Double

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333

// Boolean
/// Swift has a built-in data type that can store whether a value is true or false, called a Bool, short for Boolean. Bools don't have space for "maybe" or "perhaps", only absolutes: true or false.
var stayOutTooLate: Bool
stayOutTooLate = true

var missABeat: Bool
missABeat = false

// TYPE INFERENCE:-
/// Using type annotations wisely
/// There are two ways to tell Swift what type of data a variable holds: assign a value when you create the variable, or use a type annotation.
var string = "String"
var integer = 25
var double = -86.783333
var boolean = true
/// This technique is called type inference, because Swift can infer what data type should be used for a variable by looking at the type of data you want to put in there.

// MARK:- OPERATORS
/// + to add, - to subtract, * to multiply, / to divide, = to assign value, and so on.
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

/// += is an operator that means "add then assign to." In our case it means "take the current value of b, add 10 to it, then put the result back into b." As you might imagine, -= does the same but subtracts rather than adds. So, that code will show 10, 20, 10 in the results pane.

/// Some of these operators apply to other data types. As you might imagine, you can add two doubles together like this:
var x = 1.1
var y = 2.2
var c = x + y

/// When it comes to strings, + will join them together. For example:
var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

/// One more common operator you’ll see is called modulus, and is written using a percent symbol: %. It means “divide the left hand number evenly by the right, and return the remainder.” So, 9 % 3 returns 0 because 3 divides evenly into 9, whereas 10 % 3 returns 1, because 10 divides by 3 three times, with remainder 1.

9 % 3
10 % 3

// COMPARISION OPERATORS:-

c > 3
c >= 3
c > 4
c < 4

///  ==, meaning "is equal to." For example:

var equals = "Tim McGraw"
equals == "Tim McGraw"

/// There's one more operator I want to introduce you to, and it's called the "not" operator: !. Yes, it's just an exclamation mark. This makes your statement mean the opposite of ==. For example:
var stayLate = true
stayLate
!stayLate

/// You can also use ! with = to make != or "not equal". For example:
var notEquals = "Tim McGraw"
notEquals == "Tim McGraw"
notEquals != "Tim McGraw"

// STRING INTERPOLATION:-
/// This is a fancy name for what is actually a very simple thing: combining variables and constants inside a string.

var interPolation = "Tim McGraw"
"Your name is \(interPolation)"
var stringAge = 25
var stringLatitude = 36.166667

"Your name is \(interPolation), your age is \(stringAge), and your latitude is \(stringLatitude)"

// DAY 2
// MARK:- ARRAYS
/// Arrays let you group lots of values together into a single collection, then access those values by their position in the collection. Swift uses type inference to figure out what type of data your array holds, like so:
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]

/// When it comes to reading items out an array, there's a catch: Swift starts counting at 0. This means the first item is 0, the second item is 1, the third is 2, and so on.

songs[0]
songs[1]
songs[2]

/// An item's position in an array is called its index, and you can read any item from the array just by providing its index. However, you do need to be careful: our array has three items in, which means indexes 0, 1 and 2 work great. But if you try and read songs[3] your playground will stop working – and if you tried that in a real app it would crash!
/// Crashed with Error: Index out of range!

/// Because you've created your array by giving it three strings, Swift knows this is an array of strings. You can confirm this by using a special command in the playground that will print out the data type of any variable, like this:
type(of: songs)

/// That will print Array<String>.Type into the results pane, telling you that Swift considers songs to be an array of strings.

/// Let's say you made a mistake, and accidentally put a number on the end of the array. Try this now and see what the results pane prints:

// var songs = ["Shake it Off", "You Belong with Me", "Back to December", 3]
type(of: songs)

/// This time you'll see an error. The error isn’t because Swift can’t handle mixed arrays like this one – I’ll show you how to do that in just a moment! – but instead because Swift is being helpful. The error message you’ll see is, “heterogenous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional.” Or, in plain English, “it looks like this array is designed to hold lots of types of data – if you really meant that, please make it explicit.”

/// Type safety is important, and although it's neat that Swift can make arrays hold any kind of data this particular case was an accident. Fortunately, I've already said that you can use type annotations to specify exactly what type of data you want an array to store. To specify the type of an array, write the data type you want to store with brackets around it, like this:

//var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

/// Now that we've told Swift we want to store only strings in the array, it will always refuse to run the code because 3 is not a string. If you really want the array to hold any kind of data, use the special Any data type, like this:
var anySongs: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

// CREATING ARRAYS:-
/// If you make an array using the syntax shown above, Swift creates the array and fills it with the values we specified. Things aren't quite so straightforward if you want to create the array then fill it later – this syntax doesn't work:

// var movies: [String]
// movies[0] = "Fight Club" // xcode complains:  Passed by reference before being initialised

/// The reason is one that will seem needlessly pedantic at first, but has deep underlying performance implications so I'm afraid you're just stuck with it. Put simply, writing var songs: [String] tells Swift "the songs variable will hold an array of strings," but it doesn't actually create that array. It doesn't allocate any RAM, or do any of the work to actually create a Swift array. It just says that at some point there will be an array, and it will hold strings.

/// There are a few ways to express this correctly, and the one that probably makes most sense at this time is this:
var movies: [String] = []
/// That uses a type annotation to make it clear we want an array of strings, and it assigns an empty array (that's the [] part) to it.
// You'll also commonly see this construct:
var moviess = [String]()
/// That means the same thing: the () tells Swift we want to create the array in question, which is then assigned to songs using type inference. This option is two characters shorter, so it's no surprise programmers prefer it!

// ARRAY OPERATOR:-
/// You can use a limited set of operators on arrays. For example, you can merge two arrays by using the + operator, like this:
var songs1 = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var bothSongs = songs1 + songs2
/// You can also use += to add and assign, like this:
bothSongs += ["Everything has Changed"]
