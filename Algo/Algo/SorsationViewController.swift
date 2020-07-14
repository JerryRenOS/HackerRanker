//
//  SorsationViewController.swift
//  Algo
//
//  Created by Jerry Ren on 7/14/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class SorsationViewController: UIViewController {
    
    var arrayForExperiment = [7, 1, 5, 3, 2, 9, 6, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        insertionality(unsorted: &arrayForExperiment)
    }
}


func insertionality(unsorted: inout[Int]) -> [Int] {
    guard unsorted.count > 1 else { return unsorted }
    for index1 in 1..<unsorted.count {
        for index2 in (1...index1).reversed() {
            if unsorted[index2] < unsorted[index2 - 1] {
                unsorted.swapAt(index2 - 1, index2)
            } else {
                break
            }
        }
    }
    let sorted = unsorted
    print(sorted)
  
    return sorted
}
         




