//
//  CursiveCursion.swift
//  Algo
//
//  Created by Jerry Ren on 6/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

func getFib(_ position: Int) -> Int {
    
    var finalFib = 0
    
    if position <= 1 {
        finalFib = position
    } else {
        finalFib = getFib(position - 1)
        + getFib(position - 2)
    }
              
    return finalFib
}


