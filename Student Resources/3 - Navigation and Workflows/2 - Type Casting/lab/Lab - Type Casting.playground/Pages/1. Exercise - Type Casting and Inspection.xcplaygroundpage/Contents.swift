/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var items: [Any] = [0.75, "macaco", 8, "miojo", 9.57]
print(items)
/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
for item in items {
    if let myItem = item as? Int {
        print("The integer has a value of: \(myItem)")
    }
    else if let myItem = item as? Double {
        print("The Double has a value of: \(myItem)")
    }
    else if let myItem = item as? String {
        print("The String has a value of: \(myItem)")
    }
}
/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
var dictionary: [String : Any] = ["A" : 12, "B" : "mehrdad", "C" : "snebneb", "D" : 3.99, "E" : 4, "F" : "30"]
for item in dictionary {
    print(item)
}
/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0
for (_, item) in dictionary {
    if let myItem = item as? Int {
        total += Double(myItem)
    }
    else if let myItem = item as? Double {
        total += myItem
    }
}
print(total)
/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2: Double = 0
for (_, item) in dictionary {
    if let myItem = item as? Int {
        total2 += Double(myItem)
    }
    else if let myItem = item as? Double {
        total2 += myItem
    }
    else if let myItem = item as? String {
        if let myString = Double(myItem) {
            total2 += myString
        }
    }
}
print(total2)
//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
