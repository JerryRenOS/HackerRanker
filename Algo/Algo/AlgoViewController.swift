//
//  AlgoViewController.swift
//  Algo
//
//  Created by Jerry Ren on 6/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class AlgoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printlnList(headNode: myReversedList)
    }
}

//extension Stack: CustomStringConvertible {
//    var description: String {
//        return storage.map { "\($0)"}.joined(separator: " ")
//    }
//}

