//
//  SomDemOfHigherOrder.swift
//  Algo
//
//  Created by Jerry Ren on 7/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

// MARS: - Higher-Orders

func CompactMapEx() {
    let op1: String? = "Lok"
    let op2: String? = "Mit"
    
    let ar = [op1, op2, nil, ""]
    let unwrappedAr = ar.compactMap({$0})
    print(unwrappedAr)
}

func MapEx() {
    let mappable = ["shabee", "nubee"].map({$0.capitalized})
    print(mappable)
}

func FlatMapEx(){
    let flapped = [[3, 1], [11, 101], [77, 13]].flatMap({$0})
    print(flapped)
}

func FilterEx() {
    let filteration = ["shabee", "nubee", "kubee"].filter({$0.count <= 5})
    print(filteration)
}

class BatchMate {
    var name: String
    init(name: String) {
        self.name = name
    }
}

fileprivate func f() {
    let kingsley = BatchMate(name: "Kingsley")
    let sheryl = BatchMate(name: "Sheryl")
    let chen = BatchMate(name: "Chen")
    let omar = BatchMate(name: "Omar")
    let batchmateList = [kingsley, sheryl, chen, omar].map({$0.name})
    batchmateList.filter({$0.count >= 5})
}

class UmbrellaForTheSakeOfIt: UIViewController {
    
    enum info: CaseIterable {
           case name
           case hobby
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var mInfo = [info: String]()
        
        for cases in info.allCases {
            switch cases {
            case .hobby:
                mInfo[.hobby] = "set value to .hobby"
            case .name:
                mInfo[.name] = "set value to .name"
            }
        }
        print(mInfo.values)
        
        #warning("my own warning message (look to the right)")
        
        var intCollection = [1,3, 5, 7, 9, 11, 13, 15, 17]
        
        // shuffled vs shuffle()
        let q = intCollection.shuffle()
        print(q)
        print(intCollection)
        print(intCollection.shuffled())
        print(intCollection)
        
        intCollection.allSatisfy { (individualNumber) -> Bool in
            return individualNumber >= 7
        }
        intCollection.allSatisfy{$0 >= 7}
    }

}
