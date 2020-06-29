//
//  BSTsortability.swift
//  Algo
//
//  Created by Jerry Ren on 6/29/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

// TreeNodo already created in the BinaTree file

class SortedBinarySearchTree {
    
    var root: TreeNodo
    
    init(rootValue: Int) {
        self.root = TreeNodo(value: rootValue)
    }
    
    fileprivate func bstSearch(_ current: TreeNodo?, value: Int) -> Bool {
        if let current = current {
            if value == current.value {
                return true
            } else if value > current.value {
                return bstSearch(current.right, value: value)
            } else if value < current.value {
                return bstSearch(current.left, value: value)
            }
        }
        return false
    }
    
    private func fundamentalSearch(_ value: Int) -> Bool {
        return bstSearch(root, value: value)
    }
}

extension SortedBinarySearchTree {
    
    fileprivate func bstInsert(_ current: TreeNodo, value: Int) {
        
        if current.value < value {
        if let rightNodo = current.right {
            bstInsert(rightNodo, value: value)
        } else {
            current.right = TreeNodo(value: value)
        }
        } else {
            if let leftNodo = current.left {
                bstInsert(leftNodo, value: value)
            } else {
                current.left = TreeNodo(value: value)
            }
        }
    }
    private func rudimentaryInsertion(_ value: Int) {
        bstInsert(root, value: value)
    }
}      
