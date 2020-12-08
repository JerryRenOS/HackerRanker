//
//  GenericQueue.swift
//  Algo
//
//  Created by Jerry Ren on 12/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct GenericQueue<T> {
    private var internalizedArr = [T]()
    var counter: Int {
        return internalizedArr.count
    }
    mutating func addition(_ element: T) {
        internalizedArr.append(element)
    }
    mutating func removal() -> T? {
        switch internalizedArr.count {
        case let counter where counter > 0:
            return internalizedArr.removeFirst()
        default:
            return nil
        }
    }
}



