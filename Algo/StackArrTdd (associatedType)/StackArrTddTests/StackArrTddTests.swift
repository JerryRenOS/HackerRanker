//
//  StackArrTddTests.swift
//  StackArrTddTests
//
//  Created by Jerry Ren on 11/2/20.
//

import XCTest
@testable import StackArrTdd

final class StackArrTddTests: XCTestCase {
    
    var stackToBeTested = StackFromArrStruct<Double>()

    override func setUpWithError() throws {
        stackToBeTested.pushing(element: 1.34)
        stackToBeTested.pushing(element: 2.45)
        stackToBeTested.pushing(element: 3.56)
        stackToBeTested.pushing(element: 4.67)
        stackToBeTested.pushing(element: 5.78)
        stackToBeTested.pushing(element: 6.89)
    }
    
    func testingStackPopping() {
        XCTAssertEqual(stackToBeTested.popping(), 6.89)
    }
    
    func testingStackPeeking() {
        XCTAssertEqual(stackToBeTested.peeking(), 6.89)
    }
    
    func testingEmptiness() {
        XCTAssertFalse(stackToBeTested.emptyOrNot)
    }
    
    func testingStackPushing() {
        XCTAssertEqual(stackToBeTested.described(), "1.34 | 2.45 | 3.56 | 4.67 | 5.78 | 6.89")
    }
}
