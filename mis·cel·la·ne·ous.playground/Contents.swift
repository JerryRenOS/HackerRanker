import Foundation
import UIKit

// A constantly evolving mis·cel·la·ne·ous collection in-progress //
   
 
// __________________________________ //
// Oct 22nd 2020
// BinaTreeBine

open class Binenode<DesiredType> {
    var val: DesiredType
    init(val: DesiredType) {
        self.val = val
    }
    var right: Binenode?
    var left: Binenode?
}

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
        ;
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


