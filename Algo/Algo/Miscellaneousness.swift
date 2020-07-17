//
//  Miscellaneousness.swift
//  Algo
//
//  Created by Jerry Ren on 7/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

fileprivate func occurencesCounting(targetString: String) {
    
    for eachChar in targetString {
        var counter = 0
        let filteredString = targetString.filter( {$0 == eachChar})
        counter = filteredString.count
        print("There are \(counter) occurences of \(eachChar)")
    }
}
