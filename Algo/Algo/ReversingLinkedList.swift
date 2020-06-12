//
//  ReversingLinkedList.swift
//  Algo
//
//  Created by Jerry Ren on 6/11/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

let nodeThree = Node(value: 3, next: nil)
let nodeTwo = Node(value: 2, next: nodeThree)
let nodeOne = Node(value: 1, next: nodeTwo)

func printlnList(headNode: Node?) {
    print(headNode)
    
    var currentNode = headNode
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        currentNode = currentNode?.next
    }
}

func reverseLinkedList(headNode: Node?) -> Node? {
    
    var currentNode = headNode
    var previousNode: Node?
    var nextNode: Node?
    
    while currentNode != nil {
        
        nextNode = currentNode?.next
        currentNode?.next = previousNode
        previousNode = currentNode
        currentNode = nextNode
  
    }
    return previousNode
}

let myReversedList = reverseLinkedList(headNode: nodeOne)
