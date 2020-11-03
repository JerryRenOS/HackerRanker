//
//  StackFromArr.swift
//  StackArrTdd
//
//  Created by Jerry Ren on 11/2/20.
//

import Foundation
import UIKit

// LiFo

class StackFromArrClass<Element: Equatable>: Equatable {

    var emptyOrNot: Bool {
        return self.peeking() == nil
    }
    
    var storageArr: [Element] = []

    func peeking() -> Element? {
        return storageArr.last
    }
    
    func popping()-> Element? {
        let len = storageArr.count
        let poppedElement = storageArr.last
        storageArr.remove(at: len - 1)
        return poppedElement
    } 
    
    func pushing(element: Element) {
        storageArr.append(element)
    }
    
    static func == (lhs: StackFromArrClass<Element>, rhs: StackFromArrClass<Element>) -> Bool {
        return true //just clicked on 'fixing the erro', ain't no idea what this does though hh
    }
    
    func described() -> String {
        let description = storageArr.map({"\($0)"}).joined(separator: " | ")
        print(description)
        return description
    }
}                            
