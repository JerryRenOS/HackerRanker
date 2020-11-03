//
//  AlgoTests.swift
//  AlgoTests
//
//  Created by Jerry Ren on 6/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest
@testable import Algo

final class StackTests: XCTestCase {
    var stack = Stack<Int>()
    
    override func setUp() {
        stack.push(1)
        stack.push(2 )
    }
    
    func test_emptiness() {
        XCTAssertFalse(stack.emptyOrNot)
    }

    func test_peep() {
        XCTAssertEqual(stack.peek(), 2)
    }
    
    func test_pop() {
        XCTAssertEqual(stack.pop(), 2)
    } 
    
    func test_push() {
        XCTAssertEqual(stack.description, "1 2" )
    }
    
    func test_init() {
        let arlist = [1, 2]
        XCTAssertEqual(stack, Stack(storage: arlist))
 //       XCTAssertEqual(stack, Stack(arlist))
    }

}
     
