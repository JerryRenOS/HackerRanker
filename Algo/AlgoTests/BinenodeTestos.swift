//
//  BinenodeTestos.swift
//  AlgoTests
//
//  Created by Jerry Ren on 10/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest
@testable import Algo

// binarynode test rewritten for binenode //
class BinenodeTestos: XCTestCase {
        var treeConstruction: Binenode<Int> = {
        
        let zero = Binenode(val: 0)
        let one = Binenode(val: 1)
        let five = Binenode(val: 5)
        let seven = Binenode(val: 7)
        let eight = Binenode(val: 8)
        let nine =  Binenode(val: 9)
            seven.left = one
            one.left = zero
            one.right = five
            seven.right = nine
            nine.left = eight
            
        return seven
    }()
    
    func testingTraversingInOrder() {
        var testArr: [Int] = []
        treeConstruction.traversingInOrder { testArr.append($0) }
        XCTAssertEqual(testArr, [0, 1, 5, 7, 8, 9])
    }
}
  
