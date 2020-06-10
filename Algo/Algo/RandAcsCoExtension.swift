//
//  RandAcsCoExtension.swift
//  Algo
//
//  Created by Jerry Ren on 6/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Element: Comparable {
    
    func splitInHalvesSearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else { return nil }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let midpoint = index(range.lowerBound, offsetBy: size / 2)
    
        if self[midpoint] == value {
            return midpoint
        } else if self[midpoint] > value {
            return splitInHalvesSearch(for: value, in: range.lowerBound..<midpoint)
        } else {
            return splitInHalvesSearch(for: value, in:  index(after: midpoint)..<range.upperBound)
        }
         
        
    }
    
}
