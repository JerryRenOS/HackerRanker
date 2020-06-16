//
//  Uda.swift
//  Algo
//
//  Created by Jerry Ren on 6/15/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class UdaStack {
    
    var ll: LinkedList
    
    init(top: UdaNodo?) {
        self.ll = LinkedList(head: top)
    }

    func push(_ node: UdaNodo) {
     //   self.ll.append(node)    (onaji crap)
        self.ll.insertNode(node, at: 1)
    }

    func pop() -> UdaNodo? {
        
//   ll.deleteNode(withValue: node)
        
        let nodeToBeDeleted = ll.getNode(atPosition: 1)
        
        if let unwrappedValue = nodeToBeDeleted?.value {
            
            ll.deleteNode(withValue: unwrappedValue)
        }
        return nodeToBeDeleted
    }
}

class UdaNodo {
    
    var value: Int
    var next: UdaNodo?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    var head: UdaNodo?
    
    init(head: UdaNodo?) {
        self.head = head
    }
    
    func append(_ node: UdaNodo) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    func getNode(atPosition position: Int) -> UdaNodo? {
        guard position > 0 else {
            return nil
        }
        
        var counter = 1
        var current = head
        
        while current != nil && counter <= position {
            if counter == position {
                return current
            }
            current = current?.next
            counter += 1
        }
        return nil
    }
    
    func insertNode(_ node: UdaNodo, at position: Int) {
        guard position > 0 else {
            return
        }
        
        var counter = 1
        var current = head
        
        if position > 1 {
            while current != nil && counter < position {
                if counter == position - 1 {
                    node.next = current?.next
                    current?.next = node
                }
                current = current?.next
                counter += 1
            }
        } else if position == 1 {
            node.next = head
            head = node
        }
    }
    
    func deleteNode(withValue value: Int) {
        var current = head
        var previous: UdaNodo?
        
        while current?.value != value && current?.next != nil {
            previous = current
            current = current?.next
        }
        
        if current?.value == value {
            if previous != nil {
                previous?.next = current?.next
            } else {
                head = current?.next
            }
        }
    }
}


