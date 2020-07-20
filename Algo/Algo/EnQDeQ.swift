//
//  EnQDeQ.swift
//  Algo
//
//  Created by Jerry Ren on 7/19/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class Queue {
    
    var storage: [Int]
    
    init(head: Int) {
        storage = [head]
    }

    func enqueue(_ element: Int) {
        storage.append(element)
    }

    func peek() -> Int? {
             
        var toBePeeked: Int?
        
        if storage.isEmpty {
            toBePeeked = nil
        } else {
            toBePeeked = storage[0]
        }
        return toBePeeked
    }
    
    func dequeue() -> Int? {
        var toBeReturned: Int?
        
        if storage.isEmpty {
            toBeReturned = nil
        } else {
         storage.remove(at: 0)
        }
        
        return toBeReturned
    }
}

