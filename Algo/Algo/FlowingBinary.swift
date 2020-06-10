//
//  FlowingBinary.swift
//  Algo
//
//  Created by Jerry Ren on 6/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class BinaryNode<Element> {
    var value: Element
    
    var rightKid: BinaryNode?
    var leftKid: BinaryNode?
    
    init(initValue: Element) {
        self.value = initValue
    }
}


extension BinaryNode {
    func traversalInOrder(visting: (Element) -> Void) {
        leftKid?.traversalInOrder(visting: visting)
        visting(value)
        rightKid?.traversalInOrder(visting: visting)
    }
    
    func traversalPreOrder(visiting: (Element) -> Void) {
        visiting(value)
        leftKid?.traversalPreOrder(visiting: visiting)
        rightKid?.traversalPreOrder(visiting: visiting )
    }
    
    func traversalPostOrder(visiting: (Element) -> Void) {
        leftKid?.traversalPostOrder(visiting: visiting)
        rightKid?.traversalPostOrder(visiting: visiting)
        visiting(value)
    }
    
}


 
