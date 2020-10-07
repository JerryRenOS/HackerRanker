//
//  AlgoViewController.swift
//  Algo
//
//  Created by Jerry Ren on 6/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class AlgoViewController: UIViewController {
    
    private var bstTree = BineSearchTree.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        printlnList(headNode: myReversedList)
        binaTreeSertionTester()
    }
    
    func binaTreeSertionTester() {
        bstTree.root = Binenode(val: 10)
        bstTree.root?.left = Binenode(val: 7)
        bstTree.root?.right = Binenode(val: 14)
        
        print(bstTree.root!.val as Int)
        bstTree.insertion(intVal: 12)
        print(bstTree.root?.right?.left?.val)
    }
}

//extension Stack: CustomStringConvertible {
//    var description: String {
//        return storage.map { "\($0)"}.joined(separator: " ")
//    }
//}



