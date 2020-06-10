//
//  OnesAndZerosSearch.swift
//  Algo
//
//  Created by Jerry Ren on 6/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

let numbersForTestings = [1, 2, 4, 6, 8, 9, 11, 13, 16, 17, 20]

func binarySearch(searchValue: Int, array: [Int]) -> Bool {
    
    var rightIndex = array.count - 1
    var leftIndex = 0
    
    while leftIndex <= rightIndex {
        
        let middleIndex = Int((leftIndex + rightIndex) / 2)
        let middleValue = array[middleIndex]
        
        if middleValue == searchValue {
            return true
        }
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        if searchValue > middleValue {
            leftIndex = middleIndex + 1
        }
    }
    return false
}

// print(binarySearch(searchValue: 18, array: numbersForTestings))

