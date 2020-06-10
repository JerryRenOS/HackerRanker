//
//  FlowingStack.swift
//  Algo
//
//  Created by Jerry Ren on 6/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
 
//public struct Stack<Element>: CustomStringConvertible {
//    public var description: String {
//        return storage.map { "\($0)"}.joined(separator: " ")
//    }
//
//    public var storage: [Element] = []
//
//    public mutating func push(_ element: Element) {
//        storage.append(element)
//    }
//}
    
struct Stack<Element: Equatable>: Equatable  {
  
    var emptyOrNot: Bool {
        return peek() == nil 
    }
    
    var storage: [Element] = []
    
    init() { }
    
    init(_ elements: [Element]){
        storage = elements 
    }
    
    
    func peek() -> Element? {
        return storage.last
    }
     
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        return storage.map { "\($0)"}.joined(separator: " ")
    }
    
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
      
