import Foundation
import UIKit
import XCTest
// A constantly evolving mis·cel·la·ne·ous collection in-progress //


// MARK: - linked list jumping around based on index

private func jumpingList(_ A: inout [Int]) -> Int {
    var pointer = 0
    var counter = 0
    var boolArr = Array(repeating: false, count: A.count)
    while true {
        if pointer == -1 {
            return counter
        }
        pointer = A[pointer]
        if boolArr[pointer] == true {
            return counter
        }
        boolArr[pointer] = true
        counter += 1
    }
}
var testArr = [1, 4, -1, 3, 2]
var testArr0 = [2, 1, 3, 5, 4, 0]
var testArr1 = [1, 0] // without -1
jumpingList(&testArr0)
            

// _____________________________________________
// Nov 17th
// Sorting dictionary by key - definitely useful

var dictNotsorted = [7: "π", 5: "£", 3: "ø", 6: "ƒ"]
let dictSorted  =  dictNotsorted.sorted { (first, second) -> Bool in
    return first.key < second.key
}
print(dictSorted)


// ________________________________________
// Nov 17th sudden realization
// Darn it, doing this transformation for almost a year now smh, can just do a one liner)

let originalStr = "hahaha,deprecated func below"

//func stringIntoArr(preTransformed: String) -> Array<String> {
//    var tempaArr: [String] = []
//    for element in preTransformed {
//        tempaArr.append(String(element))
//    }
//    return tempaArr
//}
// print(stringIntoArr(preTransformed: originalStr))

let originalArrFromString = Array(originalStr) // one-liner smh
print(originalArrFromString)

// Enumerated( ) is pretty powerful too, and can be used in conjunction with dict (below)

var dictFromArr: [Int:String] = [:]
for (index, element) in originalArrFromString.enumerated() {
    dictFromArr.updateValue(String(element), forKey: index)
}
print("dictFromArr is: ", dictFromArr)

let dictFromArrSorted = dictFromArr.sorted { $0.value > $1.value }
// slightly different syntax than above, but achieving the sort as well haha
print(dictFromArrSorted)


// ___________________________________________________________________
// Nov 2nd
// One-liner for counting occurrences of unique elements in an array
var ar: [Int]?
var dict: [Int : Int] = [:]
ar?.forEach { dict[$0, default: 0] += 1 }
// comes in handy so frickin' much honestly

// _____________________________________________________________//
// Oct 27th / Oct 30th
// Extensions that come in handy

extension StringProtocol {
    subscript(offsetNumb: Int) -> Character {  //this extension would allow me to subscript a string like this "tairengan"[3]  haha //
        self[index(startIndex, offsetBy: offsetNumb)]
    }
}               
print("tairengan"[3])

extension String {
    func removingAllTheWhiteSpaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

func gettingIndexInAString(targetString: String, index:Int) -> String {
    let beginner = targetString.startIndex
    let starter = targetString.index(beginner, offsetBy: index)
    let finisher = targetString.index(beginner, offsetBy: index + 1)
    
    let toBeReturned = targetString[starter..<finisher]
    print(toBeReturned)
    return String(toBeReturned)
}

// __________________________________ //
// Nov 14th -
// Create a fruit class returning the required output

final class FruitDataClass {
    let fruitName: String
    let fruitCount: Int
    
    init(_ fruitName: String, _ fruitCount: Int) {
        self.fruitName = fruitName
        self.fruitCount = fruitCount
    }
    
    func makeFruitList() -> [String] {
        var fruitList: Array<String> = []
        for index in 0..<fruitCount {
            fruitList.append(fruitName)
        }
        return fruitList
    }}

private func listOf(listOfFruits: [FruitDataClass]) -> [String] {
    return listOfFruits.flatMap {$0.makeFruitList()}
}

listOf(listOfFruits: [FruitDataClass("Coconut", 3), FruitDataClass("Pineapple", 2)])

// __________________________________ //
// Nov 3rd tackled & (Nov 25th revisitation)
// Counting the number of palindromes in a string

func palindromaCounta(targetStr: String) -> Int {
    let leng = targetStr.count
    let strArr = Array(targetStr)
    var palinCounter = 0
    for x in 0...leng - 1 {
        for y in 1...leng {
            if x < y {
                let currentSlice = (strArr[x..<y]).map(String.init) //妙手回春的conversion
                if checkingForPalinArr(targetArr: currentSlice) {
                    print(currentSlice)
                    palinCounter += 1
                }
            }
        }
    }
    return palinCounter
}
// map(String.init)太妙了

fileprivate func checkingForPalinArr(targetArr: Array<String>) -> Bool { // helper to check if an array of strings is a palindrome or not
    var trueOrFalse = true
    let leng = targetArr.count
    var leftIndex = 0
    
    while leftIndex < leng / 2 {
        let rightIndex = leng - leftIndex - 1
        if targetArr[leftIndex] != targetArr[rightIndex] {
            return false
        }
        leftIndex += 1
    }
    return true
}

let tac = "tacoocat"
print(checkingForPalinArr(targetArr: Array(arrayLiteral: tac)))
print(palindromaCounta(targetStr: tac))

let potentialPalin = "igBufQfobGi"
print(checkingForPalinArr(targetArr: Array(arrayLiteral: potentialPalin)))
print(palindromaCounta(targetStr: potentialPalin))



// __________________________________ //
// Oct 28th 2020
// reverse-summing two linkedlists - arr approach

func summationOfLinkedLists( linkedArrayOne: Array<Int>, linkedArrayTwo: [Int]) -> Int {
    
    let reversedLinkedOne = Array(linkedArrayOne.reversed())
    let reversedLinkedTwo = Array(linkedArrayTwo.reversed())
    
    let linkedOneLength = reversedLinkedOne.count
    let linkedTwoLength = reversedLinkedTwo.count
    let biggerLength = max(linkedOneLength, linkedTwoLength)
    let smallerLength = min(linkedOneLength, linkedTwoLength)
    
    var biggerLinked: Array<Int>
    var smallerLinked: Array<Int>
    
    switch linkedOneLength > linkedTwoLength {
    case true:
        biggerLinked = reversedLinkedOne
        smallerLinked = reversedLinkedTwo
    case false:
        biggerLinked = reversedLinkedTwo
        smallerLinked = reversedLinkedOne
    }
    var carryOver = 0
    var digitsArr = [Int].init()
    
    for index in 0...biggerLength-1 {
        let upperNum = biggerLinked[index]
        
        if index <= smallerLength-1 {
            let lowerNum = smallerLinked[index]
            let upperlowerSum = upperNum + lowerNum
            
            let currentDigit = (carryOver + upperlowerSum) % 10
            carryOver = upperlowerSum / 10
            digitsArr.append(currentDigit)
        }
        else {
            let currentDigit = (upperNum+carryOver) % 10
            switch carryOver + upperNum {
            case 10:
                carryOver = 1
            default:
                carryOver = 0
            }
            digitsArr.append(currentDigit)
        }
    }
    if carryOver == 1 {
        digitsArr.append(1)
    }
    let strArr = digitsArr.map { String($0) }
    let digitsStr = strArr.joined()
    let finalResult = Int(digitsStr)
    
    return finalResult ?? 0
}
summationOfLinkedLists(linkedArrayOne: [2, 4, 3], linkedArrayTwo: [5, 6, 4])
summationOfLinkedLists(linkedArrayOne: [0], linkedArrayTwo: [0])
summationOfLinkedLists(linkedArrayOne: [9,9,9,9,9,9,9], linkedArrayTwo: [9,9,9,9])


// __________________________________ //
// Oct 22nd & Oct 23rd 2020
// BinaTreeBine

open class Binenode<DesiredType> {
    var val: DesiredType
    init(val: DesiredType) {
        self.val = val
    }
    var right: Binenode?
    var left: Binenode?
}

// left -> root -> right -> repeat (traverseinorder)
extension Binenode { // questionable but ...
    func traversingInOrder(visting: (DesiredType) -> Void) {
        left?.traversingInOrder(visting: visting)
        visting(val)
        right?.traversingInOrder(visting: visting)
    }
}

// xctestos in pground lmao
class BinaTest: XCTestCase {
    var treeConstruction: Binenode<Int> = {
        let zero = Binenode(val: 0)
        let one = Binenode(val: 1)
        let five = Binenode(val: 5)
        let seven = Binenode(val: 7)
        let eight = Binenode(val: 8)
        let nine =  Binenode(val: 9)
        seven.left = one
        one.left = zero
        one.right = five
        seven.right = nine
        nine.left = eight
        return seven
    }()
    
    func testingTraversingInOrder() {
        var testArr: [Int] = []
        treeConstruction.traversingInOrder { testArr.append($0) }
        XCTAssertEqual(testArr, [0, 1, 5, 7, 8, 9])
    }
}

// binatree from binenode
class BinaTree<DesiredType> {
    var root: Binenode<Int>?
    init(rootVal: Int) {
        self.root = Binenode(val: rootVal)
    }
    fileprivate func preOrderTreeSearch(_ starterNode: Binenode<Int>?, val: Int) -> Bool {
        // if let starterNode = starterNode as? BinaryInteger {
        guard let starterNode = starterNode else { return false }
        
        if starterNode.val == val {
            return true
        } else {
            return preOrderTreeSearch(starterNode.left, val: val) || preOrderTreeSearch(starterNode.right, val: val)
        }
        return false
    }
}

// binesearchtree from binenode
class BineSearchTree {
    var rootNode: Binenode<Int>?
    
    fileprivate func insertion(intVal: Int) {
        let newNode = Binenode(val: intVal)
        
        if let rootNode = self.rootNode {
            self.insertionHelper(rootNode, newNode)
        }
        else {
            self.rootNode = newNode
        }
    }
    private func insertionHelper(_ root: Binenode<Int>, _ newNode: Binenode<Int>) {
        if newNode.val > root.val {
            if let rightNode = root.right {
                self.insertionHelper(rightNode, newNode)
            } else {
                root.right = newNode
            }
        } else {
            if let leftNode = root.left {
                self.insertionHelper(leftNode, newNode)
            } else {
                root.left = newNode
            }
        }
    }
}


// _________________________________________ //
// Oct 26th
// Coding challenge

fileprivate func Average(arr: [Double]?) -> [Double] {
    guard let arr = arr else { return [Double].init()}
    
    if arr.count == 0 {
        return []
    } else if arr.count == 1 {
        return arr
    } else if arr.count == 2 {
        let avg = (arr[0] + arr[1]) / 2
        return [avg, avg]
    }
    else {
        var newArr: [Double] = [(arr[0] + arr[1])/2]
        let arrLength = arr.count
        
        for index in 1...arrLength - 2 {
            
            let newElement = (arr[index+1] + arr[index] + arr[index-1]) / 3
            newArr.append(newElement)
        }
        newArr.append((arr[arrLength-1] + arr[arrLength-2])/2)
        
        return newArr
    }
}

var input3 = [-1.0,-2.0,-3.0,-4.0,-5.0]
var input2 = [3.7, 7.3]
var input1 = [11.11]
var input0: [Double] = []

print(Average(arr: input3))
print(Average(arr: input2))
print(Average(arr: input1))
print(Average(arr: input0))

XCTAssertEqual(Average(arr: input0), [] as [Double])
XCTAssertEqual(Average(arr: input1), [11.11])
XCTAssertEqual(Average(arr: input2), [5.5, 5.5])
XCTAssertEqual(Average(arr: input3), [1.5, 2, 3, 4, 4.5])

class PlayXTest: XCTest {
    func testostAverage() {
        // PlayXTest.defaultTestSuite.run()
    }
}



// _________________________________________ //
// Oct 22nd 2020
// KVC & KVO
class KVCProfile: NSObject {
    var followersCount: Int?
    var followingsCount: Int?
    var profileName: String?
    var customProfile: KVCProfile?
    
    override init() { // the override&super are sketchy
        super.init()
        self.setValue("enokania", forKey: "profileName")
    }
    func prtPfilena() {
        let pfilena = self.value(forKey: "profileName")
        print(pfilena as? String)
    }
}
// the above code is erroneous dunno why

// MARK: - Nov 23rd
// Async illustrator simplistic 

let randDispatchTime = (.now() + Double.random(in: 1.0...5.0)) as DispatchTime
// no idea why I had to cast these two as dispatchtime, but it works haha.
let anotherArbituaryDispatchTime = (.now() + Double.random(in: 1.0...5.0)) as DispatchTime
var numb: Double = 0.33
DispatchQueue.main.asyncAfter(deadline: randDispatchTime) {
    numb += 0.33
}
DispatchQueue.main.asyncAfter(deadline: anotherArbituaryDispatchTime) {
    print(numb)
}



// __________________________________ //
// Oct 20th 2020

func solut(N: Int) -> Int{
    var arr = String( N )
    var negative = false
    if N < 0 {
        negative = true
        arr = String(-N)
    }
    for (i,v) in arr.enumerated() {
        let ind = arr.index(arr.startIndex, offsetBy: i)
        if negative, Int(String(v))! > 5{
            arr.insert("5", at: ind)
            break
        } else if !negative, Int(String(v))! < 5 {
            arr.insert("5", at: ind)
            break
        }
        if (i == arr.count - 1){
            arr.insert("5", at: arr.endIndex)
            break
        }
    }
    return negative ? Int("-"+arr)! : Int(arr)!
}

solut(N: 65566)
// 53564

func helper(N: Int) -> Int{
    if N > 0 {
        var str = String( N )
        var arr = Array(str)
        var res = ""
        for i in 0..<arr.count {
            if let a = Int(String(arr[i]))
            {
                if a > 5 {
                    print(arr[i])
                    res.append(arr[i])
                }
                else {
                    res.append("5")
                    for j in i..<arr.count {
                        res.append(arr[j])
                    }
                    break
                }
            }
        }
        return Int(res) ?? 0
    }
    else {
        var str = String( N )
        var arr = Array(str)
        var res = "-"
        for i in 0..<arr.count {
            if let a = Int(String(arr[i]))
            {
                if a <= 5 {
                    print(arr[i])
                    res.append(arr[i])
                }
                else {
                    res.append("5")
                    for j in i..<arr.count {
                        res.append(arr[j])
                    }
                    break
                }
            }
        }
        print(Int(res) ?? 0)
        return Int(res) ?? 0
    }
}
print(helper(N: 556))


//Oct 21st 2020
// LinkedList implementation (not complete tho)

class LinkedNode {
    var nextNode: LinkedNode?
    var val: Int
    
    init(nextNode: LinkedNode?, val: Int) {
        self.val = val
        self.nextNode = nextNode
    }
}
class OneDirectionLinkedList {
    var initialNode: LinkedNode?
    
    func printingLinkedList(initialNode: LinkedNode?) {
        var currentNode = initialNode
        while currentNode != nil {
            currentNode = currentNode?.nextNode
            print(currentNode?.val)
        }
    }
}
let secondNode = LinkedNode(nextNode: nil, val: 36)
let initalNode = LinkedNode(nextNode: secondNode, val: 33)
OneDirectionLinkedList().printingLinkedList(initialNode: initalNode)


// __________________________________________________ //
// Nov 17th
// My two drastically different solutions for reversing the string with the special characters in place

// Approach 1 is harder to conceive but my fav, and used a bit of indo-onnanoko's help
fileprivate func reversingStringBarringSpecialChars(originalStr: String) -> String {
    
    let azRange = 97...122
    let AZrange = 65...90
    var newStr = String.init()
    
    let originalArr = Array(originalStr)
    var filteredArr: [String] = []
    var specialCharDict: [Int:String] = [:]
    
    for (index, element) in originalArr.enumerated() {
        let asciiVal = Int(element.asciiValue ?? 0)
        let elementString = String(element)
        
        if azRange.contains(asciiVal) || AZrange.contains(asciiVal) {
            filteredArr.append(elementString)
        }
        else {
            specialCharDict.updateValue(elementString, forKey: index)
        }
    }
    filteredArr.reverse()
    
    let sortedCharDict = specialCharDict.sorted { (first, second) -> Bool in
        return first.key < second.key
    }
    
    let diff = originalArr.count - filteredArr.count
    for index in 0..<diff {
        filteredArr.append("")
    }
    for (index, specialchar) in sortedCharDict {
        filteredArr.insert(specialchar, at: index)
    }
    newStr = filteredArr.joined(separator: "")
    print(newStr)
    return newStr
}

let preStr1 = "Ab,c,de!$"
// "ed,c,bA!$"
reversingStringBarringSpecialChars(originalStr: preStr1)

let preStr2 = "a,b$c"
// "c,b$a"
reversingStringBarringSpecialChars(originalStr: preStr2)

// _______________________________________________________
// Approach 2 - a more standard method with swaps

private func confirmedAsLatinAlphabetLetter(targetStr: String) -> Bool {  // helper to check if an element belongs to
    let azRangeAscii = 97...122
    let AZrangeAscii = 65...90
    let targetChar = Character(targetStr)
    let asciiVal = Int(targetChar.asciiValue ?? 0)
    return azRangeAscii.contains(asciiVal) || AZrangeAscii.contains(asciiVal)
}

func reversalBySwap(originalStr: String) -> String {
    var newStr = String.init()
    var originalArr = Array(originalStr)
    var leftMost = 0
    var rightMost = originalArr.count - 1
    
    while rightMost > leftMost {
        let leftElement = String(originalArr[leftMost])
        let rightElement = String(originalArr[rightMost])
        if !confirmedAsLatinAlphabetLetter(targetStr: leftElement) {
            leftMost += 1
        } else if !confirmedAsLatinAlphabetLetter(targetStr: rightElement) {
            rightMost -= 1
        } else {
            originalArr.swapAt(rightMost, leftMost)
            rightMost -= 1
            leftMost += 1
        }
    }
    newStr = String(originalArr)
    return newStr
}

let orig = "Ab,c,de!$"
let end = "ed,c,bA!$"
print(reversalBySwap(originalStr: orig))

// _____________________________________________
// Nov 18th
// writing this protocol out helps me thoroughly understand the string dataType
protocol ConstructingStringProtocol: StringProtocol
where Self.Element == Character, Self.Index == String.Index,
      Self.StringInterpolation == DefaultStringInterpolation,
      Self.SubSequence: StringProtocol { }


// _____________________________________________
// Nov 20th
// MARK: - Contacts searcher

private func contactsSearcher(arrOfNames: [String], arrOfPhoneNumbers: [String], searchString: String) -> String? {
    var matchingIndexes = Array<Int>.init()
    var matchesNames = [String].init()
    
    for( index, phoneNumber) in arrOfPhoneNumbers.enumerated() {
        switch phoneNumber.contains(searchString) {
        case true:
            matchingIndexes.append(index)
        default:
            ()
        }
    }
    matchesNames = matchingIndexes.map { arrOfNames[$0] } // filtering the array based on indexes
    
    let namesSorted = matchesNames.sorted(by: <)
    guard let contactFound = namesSorted.first else { return "nobody"}
    print("Contact found is: \(contactFound)")
    return contactFound
}

contactsSearcher(arrOfNames: ["pom", "pim"], arrOfPhoneNumbers: ["13240", "32410"], searchString: "324")
contactsSearcher(arrOfNames: ["sander", "ann", "amy", "michael"], arrOfPhoneNumbers: ["123", "234", "345", "456"], searchString: "3")


// MARK: - Minimum number of coins flipped

// Approach 1, more concise

private func coinFlippingConcise(arrOfCoins: [Int]) -> Int {
    
    guard !arrOfCoins.isEmpty else { return 0 }
    var numOfFlips: Int = 0
    let leng = arrOfCoins.count
    
    var alternatingArr: Array<Int> = []
    for index in 0...leng-1 {
        switch index%2 {
        case 0:
            alternatingArr.append(0)
        default:
            alternatingArr.append(1)
        }
    }
    for index in 0...leng-1 {
        let coinElement = arrOfCoins[index], alternatingElement = alternatingArr[index]
        switch coinElement == alternatingElement {
        case true:
            break
        default:
            numOfFlips += 1
        }
    }
    return min(numOfFlips, leng-numOfFlips)
}

//___________________________
// Approach 2, more verbose
private func coinFlippingVerbose(arrOfCoins: [Int]) -> Int {
    
    guard !arrOfCoins.isEmpty else { return 0 }
    var numOfFlipsOne: Int = 0
    var numOfFlipsTwo: Int = 0
    let leng = arrOfCoins.count
    
    var alternatingArrOne: Array<Int> = []
    for index in 0...leng-1 {
        switch index%2 {
        case 0:
            alternatingArrOne.append(0)
        default:
            alternatingArrOne.append(1)
        }
    }
    
    var alternatingArrTwo = alternatingArrOne
    alternatingArrTwo.removeFirst(1)
    switch alternatingArrOne.last {
    case 0:
        alternatingArrTwo.append(1)
    default:
        alternatingArrTwo.append(0)
    }
    
    for index in 0...leng-1 {
        let currentElement = arrOfCoins[index]
        switch alternatingArrTwo[index] == currentElement{
        case false:
            numOfFlipsTwo += 1
        case true:
            break
        }
        switch alternatingArrOne[index] == currentElement {
        case true:
            break
        default:
            numOfFlipsOne += 1
        }
    }
    return min(numOfFlipsTwo, numOfFlipsOne)
}

let arr0: Array<Int> = []
let arr1 = [1]
let arr2 = [1, 0]
let arr3 = [0 , 1, 1, 0]
let arr4 = [1, 1, 0, 1, 1]
let arr5 = [1, 0, 1, 0, 1, 1]

coinFlippingVerbose(arrOfCoins: arr0)
coinFlippingVerbose(arrOfCoins: arr1)
coinFlippingVerbose(arrOfCoins: arr2)
coinFlippingVerbose(arrOfCoins: arr3)
coinFlippingVerbose(arrOfCoins: arr4)
coinFlippingVerbose(arrOfCoins: arr5)

coinFlippingConcise(arrOfCoins: arr0)
coinFlippingConcise(arrOfCoins: arr1)
coinFlippingConcise(arrOfCoins: arr2)
coinFlippingConcise(arrOfCoins: arr3)
coinFlippingConcise(arrOfCoins: arr4)
coinFlippingConcise(arrOfCoins: arr5)


// MARK: - Balanced fragments
// Nov 21st

// 微暴力 approach & 非暴力 approach
private func balancedFragments(targetString: String) -> Int {
    
    let targetArr = Array(targetString)
    let leng = targetArr.count
    var fragmentLengthArr = Array<Int>.init()
    
    var indexA = 1
    //    var breakIt = false
    while indexA <= leng {                  // breakIt != true
        for indexB in 0...leng-indexA {
            
            var setUpper: Set = Set<Character>.init()
            var setLower: Set<String.Element> = Set.init()
            
            let subArr = targetArr[indexB..<(indexB+indexA)]
            
            for element in subArr {
                switch element.isUppercase {
                case false:
                    setLower.insert(element)
                default:
                    setUpper.insert(element)
                }
            }
            
            if setUpper.count == setLower.count {
                var upperAsciiCumulated = 0
                var lowerAsciiCumulated = 0
                
                setLower.forEach { lowerAsciiCumulated += Int($0.asciiValue ?? 0) }
                for char in setUpper {
                    upperAsciiCumulated += Int(char.asciiValue ?? 0)
                }
                let diff = lowerAsciiCumulated - upperAsciiCumulated
                
                switch diff%32 {
                case 0:
                    let subStr = subArr.map {String.init($0)}.reduce("") {$0 + $1}
                    print(subStr)
                    return indexA
                default:
                    break
                }
            }
            //___________________________________________________
            // Initial approach, but relatively slower (by a lot haha)
            
            //            var setUpperToLower = Set<Character>()
            //            setUpper.forEach { setUpperToLower.insert(Character($0.lowercased())) }
            //            switch setUpperToLower == setLower {
            //            case true:
            //                 fragmentLengthArr.append(indexA)
            //                print(String(subArr))
            ////                breakIt = !breakIt   //对于Big(o)蛮重要的一行
            //                return indexA
            //            default:
            //                break
            //            }
            //________________________________________________
        }
        indexA += 1
    }
    
    return -1
    // fragmentLengthArr.isEmpty ? -1 : (fragmentLengthArr.min() ?? -1)
}



// Nov 17th (redoing 陈旧 hackerrank)
// MARK: - Number of letters to strip off in order to make an anagram

func makeAnagram(a: String, b: String) -> Int {
    var numOfDeletions = 0
    var dictA: [String : Int] = [:]
    var dictB: [String:Int] = [:]
    
    for q in a {
        if let qq = dictA[String(q)] {
            dictA.updateValue(qq+1, forKey: String(q))
        } else {
            dictA.updateValue(1, forKey: String(q))
        }
    }
    for q in b {
        if let qq = dictB[String(q)] {
            dictB.updateValue(qq+1, forKey: String(q))
        } else {
            dictB.updateValue(1, forKey: String(q))
        }
    }
    for (keyB, valueB) in dictB {
        if dictA.keys.contains(keyB) {
            numOfDeletions += abs(valueB - (dictA[keyB] ?? 0))
        } else if false==dictA.keys.contains(keyB) {
            numOfDeletions += valueB
        }
    }
    for (keyA, valueA) in dictA {
        if !dictB.keys.contains(keyA) {
            numOfDeletions += valueA
        }
    }
    return numOfDeletions
}

print(makeAnagram(a: "cde", b: "abc"))


// Nov 17th (redoing 陈旧 hackerrank)
// MARK: - Funny String

func funnyString(s: String) -> String {
    var funnyOrNot = "Not Funny"
    var sArray = [String].init()
    
    for character in s {
        sArray.append(String(character))
    }
    var reversedSArray = Array<String>.init()
    var reversedS = String.init()
    
    var index = s.count - 1
    while index >= 0 {
        reversedSArray.append(sArray[index])
        index -= 1
    }
    var reversedAscii = [Int].init()
    var originalAscii: [Int] = []
    
    for index in 0...(reversedSArray.count-1) {
        reversedAscii.append(Int(Character(reversedSArray[index]).asciiValue!))
        originalAscii.append(Int(Character(sArray[index]).asciiValue!))
    }
    var originalDifference = [Int].init()
    var reversedDifference = Array<Int>.init()
    
    for index in 0...(reversedAscii.count-2) {
        let absoluteDiffR = abs(reversedAscii[index] - reversedAscii[index+1])
        let absoluteDiffO = abs(originalAscii[index+1] - originalAscii[index])
        reversedDifference.append(absoluteDiffR)
        originalDifference.append(absoluteDiffO)
    }
    if reversedDifference == originalDifference {
        funnyOrNot = "Funny"
    }
    return funnyOrNot
}

print(funnyString(s: "niubaracaca"))
for charac in "abcdefghijklmnopqrstuvwxyz" {
    print(Character(String(charac)).asciiValue!)
}

// MARK: - Babe Hack (hackingwithswift)  ~ Nov 17th

var firstArr = [1, 2, 3]
var secondArr = ["one", "two", "three"]
var zippedArr = Array(zip(secondArr, firstArr))
print(zippedArr)


func squareOne<T: BinaryInteger>(_ value: T) -> T {
    return value * value
}
print(squareOne(5))

func squareTwo<T: FloatingPoint>(_ value: T) -> T {
    return value * value
}
print(squareTwo(5))


let string: String = String(describing: String.self)
print(string)

enum Planet: Int {
    case Mercury = 1
    case Venus
    case Earth
    case Mars
}

let testa = Planet(rawValue: 3)

let names = ["Pilot": "Wash", "Doctor": "Simon"]
for (key, value) in names.enumerated() {
    let testVar = value
    print(testVar)
}

let testaraay = [9, 7, 6, 3, 1]
let testaraay2 = [9, 7, 6, 3, 1]

let zipped = zip(testaraay, testaraay2)
print(zipped)


// MARK: - Dec 6th 2020

// Find the max sum of numbers on consecutive indices.
// array = new Integer[] {-5, 2, 2, 3, 4, -7, -3, 120}; // 121
// array = new Integer[] {-5, 1, 2, 3, 4, 5, 6, -10, -5, 100}; // 106
// array = new Integer[] {1, 2, 3, 4, 5, 6, 7, 8}; // 36
// array = new Integer[] {-5, 1, 2, 3, 4, -10}; //10
// array = new integer[] {-10, 2, 1, -1,-5} // 3 */

private func maxiSummationFinder(arr: Array<Int>) -> Int {
    let leng = arr.count
    guard !arr.isEmpty else { return 0 }
    guard leng > 1 else { return arr[0] }
    let experimentedsum = arr.reduce(0) { $0 + $1 }
    print(experimentedsum)
    var currentSum = 0
    var ultimateSum = Int.min
    for element in arr {
        currentSum += element
        switch ultimateSum {
        case let self where self < currentSum:
            ultimateSum = currentSum
        default:
            ()
        }
        switch currentSum {
        case let cself where cself < 0:
            currentSum = 0
        default:
            break
        }
    }
    return ultimateSum
}

maxiSummationFinder(arr: [-5, 2, 2, 3, 4, -7, -3, 120])
maxiSummationFinder(arr: [-5, 1, 2, 3, 4, 5, 6, -10, -5, 100])
maxiSummationFinder(arr: Array(arrayLiteral: -10, 2, 1, -1,-5))
      
      
// MARK: -  Dec 8th 2020
// Finding longest common prefix between a collection of strings.
// Almost solved, but needs some micro-revisions.

private func commonPrefixBetweenTwoStrs(strOne: String, strTwo: String) -> String {
    var resultStr: String = String.init()
    let lenOne = strOne.count, lenTwo = strTwo.count
    let strArrOne = Array(strOne), strArrTwo = Array(strTwo)
    var indexOne = 0, indexTwo = 0
    var breaking = false
    
    while indexOne < lenOne, indexTwo < lenTwo, breaking == false {
        switch strArrTwo[indexTwo] {
        case let valTwo where valTwo != strArrOne[indexOne]:
            breaking = true
        default:
            resultStr += String(strArrTwo[indexTwo])
            indexOne += 1
            indexTwo += 1
        }
    }
    return resultStr
}

commonPrefixBetweenTwoStrs(strOne: "31415926", strTwo: "31415767")

private func longestCommonPrefix(_ strs: [String]) -> String {
    guard !strs.isEmpty else { return "" }
    
    var prefixShared: String = strs[0]
    for index in 1..<strs.count {
        prefixShared = commonPrefixBetweenTwoStrs(strOne: prefixShared, strTwo: strs[index])
        print(prefixShared)
    }
    return prefixShared
}

longestCommonPrefix(Array.init())
longestCommonPrefix(["flower","flow","flight"])

