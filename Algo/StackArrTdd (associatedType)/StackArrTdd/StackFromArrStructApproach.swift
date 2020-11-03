//
//  StackFromArrStructApproach.swift
//  StackArrTdd
//
//  Created by Jerry Ren on 11/2/20.
//

import Foundation

//associatedType in replacement of generics

protocol PeekPopPushProtocol {
    associatedtype GenericElement
    var storageArr: [GenericElement] { get }
    var emptyOrNot: Bool { get }
    func peeking() -> GenericElement?
    mutating func popping() -> GenericElement?
    mutating func pushing(genericElement: GenericElement)
}
       
struct StackFromArrProtocolStruct<GenericElement> : PeekPopPushProtocol, Equatable {
    static func == (lhs: StackFromArrProtocolStruct<GenericElement>, rhs: StackFromArrProtocolStruct<GenericElement>) -> Bool {
        return true
    }
    
    var storageArr: [GenericElement] = []

    typealias GenericElement = GenericElement
    
    var emptyOrNot: Bool {
        return self.peeking() == nil
    }

    func peeking() -> GenericElement? {
        return storageArr.last
    }
    
    mutating func popping() -> GenericElement? {
        return storageArr.popLast()
    }
    
    mutating func pushing(genericElement: GenericElement) {
        storageArr.append(genericElement)
    }

    func described() -> String {
        let description = storageArr.map({"\($0)"}).joined(separator: " | ")
        print(description)
        return description
    }
}

// _______________________________________________

struct StackFromArrStruct<Element: Equatable>: Equatable {
    
    var emptyOrNot: Bool {
        return self.peeking() == nil
    }
    var storageArr: [Element] = []

    func peeking() -> Element? {
        return storageArr.last
    }
    
    mutating func popping() -> Element? {
        return storageArr.popLast()
    }
    
    mutating func pushing(element: Element) {
        storageArr.append(element)
    }
    
    static func == (lhs: StackFromArrStruct<Element>, rhs: StackFromArrStruct<Element>) -> Bool {
        return true
    }
    
    func described() -> String {
        let description = storageArr.map({"\($0)"}).joined(separator: " | ")
        print(description)
        return description
    }
}
