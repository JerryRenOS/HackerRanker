import Foundation
import UIKit
import XCTest
// A constantly evolving mis·cel·la·ne·ous collection in-progress //

// __________________________________ //
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

func stringIntoArr(preTransformed: String) -> Array<String> {
    var tempaArr: [String] = []
    for element in preTransformed {
        tempaArr.append(String(element))
    }
    return tempaArr
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

fileprivate func Average(arr: [Double]) -> [Double] {
    
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


