//
//  BinaryTest.swift
//  AlgoTests
//
//  Created by Jerry Ren on 6/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest
@testable import Algo

class BinaryTest: XCTestCase {
    
    var tree: BinaryNode<Int> = {
        
        let zero = BinaryNode(initValue: 0)
        let one = BinaryNode(initValue: 1)
        let five = BinaryNode(initValue: 5)
        let seven = BinaryNode(initValue: 7)
        let eight = BinaryNode(initValue: 8)
        let nine =  BinaryNode(initValue: 9)
        
        seven.leftKid = one
        one.leftKid = zero
        one.rightKid = five
        seven.rightKid = nine
        nine.leftKid = eight
        
       
        return seven
    }()
    
    func test_traversalInOrder() {
        var testArray: [Int] = []
        tree.traversalInOrder {  testArray.append($0) }
        XCTAssertEqual(testArray, [0, 1, 5, 7, 8, 9])
    }
    
    func test_traversalPreOrder() {
           var testArray: [Int] = []
           tree.traversalPreOrder(visiting: { testArray.append($0) } )
           XCTAssertEqual(testArray, [7, 1, 0, 5, 9, 8])
       }
    
    func test_traversalPostOrder() {
        var testArray: [Int] = []
        tree.traversalPostOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [0, 5, 1, 8, 9, 7])
    }
}

final class SplitInHalvesSearchTest: XCTestCase {
    
    func test_splitInHalves() {
        let testArray = [7, 9, 11, 18, 26, 29, 31, 37, 38]
        XCTAssertEqual(testArray.splitInHalvesSearch(for: 11), 2)
    }
    
}




