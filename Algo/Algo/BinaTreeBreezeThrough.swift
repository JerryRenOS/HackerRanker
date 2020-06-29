//
//  BinaTreeBreezeThrough.swift
//  Algo
//
//  Created by Jerry Ren on 6/29/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class TreeNodo {
    var value: Int
    var left: TreeNodo?
    var right: TreeNodo?
    
    init(value: Int) {
        self.value = value
    }
}

class BinaTree {
    
    var root: TreeNodo
    
    init(rootValue: Int) {
        self.root = TreeNodo(value: rootValue)
    }

    func preOrderTreeSearch(_ startNode: TreeNodo?, value: Int) -> Bool {
        
        if let startNode = startNode {
            if startNode.value == value {
                return true
            } else {
                return preOrderTreeSearch(startNode.left, value: value) || preOrderTreeSearch(startNode.right, value: value)
            }
        }
        return false
    }
}


