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

// MARK:- DICTIONARIES
/// As you've seen, Swift arrays are a collection where you access each item using a numerical index, such as songs[0]. Dictionaries are another common type of collection, but they differ from arrays because they let you access values based on a key you specify.

/// To give you an example, let's imagine how we might store data about a person in an array:
var person = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]
/// To read out that person's middle name, we'd use person[1], and to read out the month they were born we'd use person[3]. This has a few problems, not least that it's difficult to remember what index number is assigned to each value in the array! And what happens if the person has no middle name? Chances are all the other values would move down one place, causing chaos in your code.

/// With dictionaries we can re-write this to be far more sensible, because rather than arbitrary numbers you get to read and write values using a key you specify. For example:
var persons = [
    "first": "Taylor",
    "middle": "Alison",
    "last": "Swift",
    "month": "December",
    "website": "taylorswift.com"
]
persons["middle"]
persons["month"]

// MARK:- CONDITIONAL STATEMENTS
/// Sometimes you want code to execute only if a certain condition is true, and in Swift that is represented primarily by the if and else statements. You give Swift a condition to check, then a block of code to execute if that condition is true.

/// You can optionally also write else and provide a block of code to execute if the condition is false, or even else if and have more conditions. A "block" of code is just a chunk of code marked with an open brace – { – at its start and a close brace – } – at its end.

// Here's a basic example:
var action: String
var personn = "hater"

if personn == "hater" {
    action = "hate"
}

/// That uses the == (equality) operator introduced previously to check whether the string inside person is exactly equivalent to the string "hater". If it is, it sets the action variable to "hate". Note that open and close braces, also known by their less technical name of "curly brackets" – that marks the start and end of the code that will be executed if the condition is true.

// Let's add else if and else blocks:

else if personn == "player" {
    action = "play"
} else {
    action = "cruise"
}

/// That will check each condition in order, and only one of the blocks will be executed: a person is either a hater, a player, or anything else.

// EVALUATING MULTIPLE CONDITIONS:-
/// You can ask Swift to evaluate as many conditions as you want, but they all need to be true in order for Swift to execute the block of code. To check multiple conditions, use the && operator – it means "and". For example:
var actionS: String
var stayTooLate = true
var nothingInBrain = true

if stayTooLate && nothingInBrain {
    action = "cruise"
}

/// Because stayTooLate and nothingInBrain are both true, the whole condition is true, and action gets set to "cruise." Swift uses something called short-circuit evaluation to boost performance: if it is evaluating multiple things that all need to be true, and the first one is false, it doesn't even bother evaluating the rest.

// LOOKING FOR THE OPPOSITE OF TRUTH
/// This might sound deeply philosophical, but actually this is important: sometimes you care whether a condition is not true, i.e. is false. You can do this with the ! (not) operator that was introduced earlier. For example:

if !stayTooLate && !nothingInBrain {
    action = "cruise"
}

/// This time, the action variable will only be set if both stayOutTooLate and nothingInBrain are false – the ! has flipped them around.

// MARK:- LOOPS
/// Computers are great at doing boring tasks billions of times in the time it took you to read this sentence. When it comes to repeating tasks in code, you can either copy and paste your code multiple times, or you can use loops – simple programming constructs that repeat a block of code for as long as a condition is true.

// To demonstrate this, I want to introduce you to a special debugging function called print(): you give it some text to print, and it will print it. If you're running in a playground like we are, you'll see your text appear in the results window. If you're running a real app in Xcode, you'll see your text appear in Xcode's log window. Either way, print() is a great way to get a sneak peek at the contents of a variable.

/// Take a look at this code:
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

/// When it has finished running, you'll have the 10 times table in your playground results pane. But it's hardly efficient code, and in fact a much cleaner way is to loop over a range of numbers using what's called the closed range operator, which is three periods in a row: ...

/// Using the closed range operator, we could re-write that whole thing in three lines:
for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

/// The results pane just shows "(10 times)" for our loop, meaning that the loop was run 10 times. If you want to know what the loop actually did, click the square immediately to the right of “(10 times). You'll see a box saying "10 x 10 is 100" appear inside your code, and if you right-click on that you should see the option “Value History”. Click on that now, and you should see all the printed values over time.
/// What the loop does is count from 1 to 10 (including 1 and 10), assigns that number to the constant i, then runs the block of code inside the braces.

/// If you don't need to know what number you're on, you can use an underscore instead. For example, we could print some Taylor Swift lyrics like this:
var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

print(str)

/// That will print "Fakers gonna fake fake fake fake fake" by adding to the string each time the loop goes around.

/// If Swift doesn’t have to assign each number to a variable each time the loop goes around, it can run your code a little faster. As a result, if you write for i in… then don’t use i, Xcode will suggest you change it to _.

/// There's a variant of the closed range operator called the half open range operator, and they are easily confused. The half open range operator looks like ..< and counts from one number up to and excluding another. For example, 1..<5 will count 1, 2, 3, 4.

// LOOPING OVER ARRAYS:-
/// Swift provides a very simple way to loop over all the elements in an array. Because Swift already knows what kind of data your array holds, it will go through every element in the array, assign it to a constant you name, then run a block of your code. For example, we could print out a list of great songs like this:
for song in songs {
    print("My favorite song is \(song)")
}

/// You can also use the for i in loop construct to loop through arrays, because you can use that constant to index into an array. We could even use it to index into two arrays, like this:
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0...3 {
    print("\(people[i]) gonna \(actions[i])")
}

/// You might wonder what use the half open range operator has, but it's particularly useful for working with arrays because they count from zero. So, rather than counting from 0 up to and including 3, we could count from 0 up to and excluding the number of items in an array.

/// Remember: they count from zero, so if they have 4 items the maximum index is 3, which is why we need to use excluding for the loop.

/// To count how many items are in an array, use someArray.count. So, we could rewrite our code like this:
for i in 0..<people.count {
    print("\(people[i]) gonna \(actions[i])")
}

// INNER LOOPS:-
/// You can put loops inside loops if you want, and even loops inside loops inside loops – although you might suddenly find you're doing something 10 million times, so be careful!

/// We can combine two of our previous loops to create this:
for i in 0..<people.count {
    var str = "\(people[i]) gonna"
    
    for _ in 1...5 {
        str += " \(actions[i])"
    }
    
    print(str)
}

/// That outputs "players gonna play play play play play", then "haters gonna…" Well, you get the idea.

/// One important note: although programmers conventionally use i, j and even k for loop constants, you can name them whatever you please: for personNumber in 0..<people.count is perfectly valid.

// WHILE LOOPS:-
/// There's a third kind of loop you'll see, which repeats a block of code until you tell it to stop. This is used for things like game loops where you have no idea in advance how long the game will last – you just keep repeating "check for touches, animate robots, draw screen, check for touches…" and so on, until eventually the user taps a button to exit the game and go back to the main menu.

/// These loops are called while loops, and they look like this:
var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1
    
    if counter == 56 {
        break
    }
}

/// That code introduces a new keyword, called break. It's used to exit a while or for loop at a point you decide. Without it, the code above would never end because the condition to check is just "true", and true is always true. Without that break statement the loop is an infinite loop, which is A Bad Thing.

/// These while loops work best when you're using unknown data, such as downloading things from the internet, reading from a file such as XML, looking through user input, and so on. This is because you only know when to stop the loop after you've run it a sufficient number of times.

/// There is a counterpart to break called continue. Whereas breaking out of a loop stops execution immediately and continues directly after the loop, continuing a loop only exits the current iteration of the loop – it will jump back to the top of the loop and pick up from there.

/// As an example, consider the code below:
for song in songs {
    if song == "You Belong with Me" {
        continue
    }
    
    print("My favorite song is \(song)")
}

/// That loops through three Taylor Swift songs, but it will only print the name of two. The reason for this is the continue keyword: when the loop tries to use the song "You Belong with Me", continue gets called, which means the loop immediately jumps back to the start – the print() call is never made, and instead the loop continues straight on to “Look What You Made Me Do”.

// MARK:- SWITCH CASE
///You've seen if statements and now loops, but Swift has another type of flow control called switch/case. It's easiest to think of this as being an advanced form of if, because you can have lots of matches and Swift will execute the right one.

/// In the most basic form of a switch/case you tell Swift what variable you want to check, then provide a list of possible cases for that variable. Swift will find the first case that matches your variable, then run its block of code. When that block finishes, Swift exits the whole switch/case block.

// Here's a basic example:
let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")
    
case 1:
    print("You just released iTunes Live From SoHo")
    
case 2:
    print("You just released Speak Now World Tour")
    
default:
    print("Have you done something new?")
}

/// We could very well have written that using lots of if and else if blocks, but this way is clearer and that's important.

/// One advantage to switch/case is that Swift will ensure your cases are exhaustive. That is, if there's the possibility of your variable having a value you don't check for, Xcode will refuse to build your app.

/// In situations where the values are effectively open ended, like our liveAlbums integer, you need to include a default case to catch these potential values. Yes, even if you "know" your data can only fall within a certain range, Swift wants to be absolutely sure.

/// Swift can apply some evaluation to your case statements in order to match against variables. For example, if you wanted to check for a range of possible values, you could use the closed range operator like this:
let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")
    
case 2...3:
    print("You're a rising star")
    
case 4...5:
    print("You're world famous!")
    
default:
    print("Have you done something new?")
}

/// One thing you should know is that switch/case blocks in Swift don't fall through like they do in some other languages you might have seen. If you're used to writing break in your case blocks, you should know this isn't needed in Swift.

/// Instead, you use the fallthrough keyword to make one case fall into the next – it's effectively the opposite. Of course, if you have no idea what any of this means, that's even better: don't worry about it!

// MARK:- FUNCTIONS

/// Functions let you define re-usable pieces of code that perform specific pieces of functionality. Usually functions are able to receive some values to modify the way they work, but it's not required.

/// Let's start with a simple function:
func favoriteAlbum() {
    print("My favorite is Fearless")
}

/// If you put that code into your playground, nothing will be printed. And yes, it is correct. The reason nothing is printed is that we've placed the "My favorite is Fearless" message into a function called favoriteAlbum(), and that code won't be called until we ask Swift to run the favoriteAlbum() function. To do that, add this line of code:
favoriteAlbum()

/// That runs the function (or "calls" it), so now you'll see "My favorite is Fearless" printed out.

/// As you can see, you define a function by writing func, then your function name, then open and close parentheses, then a block of code marked by open and close braces. You then call that function by writing its name followed by an open and close parentheses.

/// Of course, that's a silly example – that function does the same thing no matter what, so there's no point in it existing. But what if we wanted to print a different album each time? In that case, we could tell Swift we want our function to accept a value when it's called, then use that value inside it.

/// Let's do that now:

func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

/// That tells Swift we want the function to accept one value (called a "parameter"), named "name", that should be a string. We then use string interpolation to write that favorite album name directly into our output message. To call the function now, you’d write this:

favoriteAlbum(name: "Fearless")

/// You might still be wondering what the point is, given that it's still just one line of code. Well, imagine we used that function in 20 different places around a big app, then your head designer comes along and tells you to change the message to "I love Fearless so much – it's my favorite!" Do you really want to find and change all 20 instances in your code? Probably not. With a function you change it once, and everything updates.

/// You can make your functions accept as many parameters as you want, so let's make it accept a name and a year:

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)

/// These function parameter names are important, and actually form part of the function itself. Sometimes you’ll see several functions with the same name, e.g. handle(), but with different parameter names to distinguish the different actions.

// EXTERNAL AND INTERNAL PARAMETER NAMES:-

/// Sometimes you want parameters to be named one way when a function is called, but another way inside the function itself. This means that when you call a function it uses almost natural English, but inside the function the parameters have sensible names. This technique is employed very frequently in Swift, so it’s worth understanding now.

/// To demonstrate this, let’s write a function that prints the number of letters in a string. This is available using the count property of strings, so we could write this:

func countLettersInString(string: String) {
    print("The string \(string) has \(string.count) letters.")
}

/// With that function in place, we could call it like this:
countLettersInString(string: "Hello")

/// While that certainly works, it’s a bit wordy. Plus it’s not the kind of thing you would say aloud: “count letters in string string hello”.

/// Swift’s solution is to let you specify one name for the parameter when it’s being called, and another inside the method. To use this, just write the parameter name twice – once for external, one for internal.

/// For example, we could name the parameter myString when it’s being called, and str inside the method, like this:

func countLettersInString(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString(myString: "Hello")

/// You can also specify an underscore, _, as the external parameter name, which tells Swift that it shouldn’t have any external name at all. For example:

func countLettersInString(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString("Hello")

/// As you can see, that makes the line of code read like an English sentence: “count letters in string hello”.

// While there are many cases when using _ is the right choice, Swift programmers generally prefer to name all their parameters. And think about it: why do we need the word “String” in the function – what else would we want to count letters on?

/// So, what you’ll commonly see is external parameter names like “in”, “for”, and “with”, and more meaningful internal names. So, the “Swifty” way of writing this function is like so:

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

/// That means you call the function with the parameter name “in”, which would be meaningless inside the function. However, inside the function the same parameter is called “string”, which is more useful. So, the function can be called like this:
countLetters(in: "Hello")

/// And that is truly Swifty code: “count letters in hello” reads like natural English, but the code is also clear and concise.

// RETRUN VALUES:-

/// Swift functions can return a value by writing -> then a data type after their parameter list. Once you do this, Swift will ensure that your function will return a value no matter what, so again this is you making a promise about what your code does.

/// As an example, let's write a function that returns true if an album is one of Taylor Swift's, or false otherwise. This needs to accept one parameter (the name of the album to check) and will return a Boolean. Here's the code:

func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }
    
    return false
}

/// If you wanted to try your new switch/case knowledge, this function is a place where it would work well.

/// You can now call that by passing the album name in and acting on the result:

if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

if albumIsTaylor(name: "Blue") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

/// If your function returns a value and has only one line of code inside it, you can omit the return keyword entirely – Swift knows a value must be sent back, and because there is only one line that must be the one that sends back a value.

/// For example, we could write this:
func getMeaningOfLife() -> Int {
    return 42
}

/// Or we could just write this:
func getMeaningOfLifee() -> Int {
    42
}

getMeaningOfLife()
