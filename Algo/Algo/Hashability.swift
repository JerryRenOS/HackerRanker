//
//  Hashability.swift
//  Algo
//
//  Created by Jerry Ren on 6/22/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class HashTableImplementation {
    
    var hashTableObject: [[String]]
    
    init() {
        hashTableObject = Array(repeating: [], count: 10000)
    }

    func calculateHashValue(_ input: String) -> Int {
        
        let hashValue = getFirstCharsValue(input) * 100 + getSecondCharsValue(input)
        return hashValue
    }
    
    func storeInputInTable(_ input: String) {
        let hashedValue = calculateHashValue(input)
        hashTableObject[hashedValue].append(input)
    }

    func checkIfStoredInTheTableOrNot(_ input: String) -> Bool {
        var thereOrNot = false
        
        let hashedValue = calculateHashValue(input)
        
        thereOrNot = hashTableObject[hashedValue].contains(input)
        
        return thereOrNot
    }

    func getFirstCharsValue(_ input: String) -> Int {
        if input.count > 0 {
            return Int(input[input.startIndex].unicodeScalars.first!.value)
        }
        return 0
    }

    func getSecondCharsValue(_ input: String) -> Int {
        if input.count > 1 {
            return Int(input[input.index(after: input.startIndex)].unicodeScalars.first!.value)
        }
        return 0
    }
}

let hashTableObject = HashTableImplementation()


