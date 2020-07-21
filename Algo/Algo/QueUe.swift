//
//  QueUe.swift
//  Algo
//
//  Created by Jerry Ren on 7/20/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

func queuesWithQoS() {
    
    let queueFirst = DispatchQueue(label: "queue1", qos: DispatchQoS.userInteractive)
    let queueSecond = DispatchQueue(label: "queue2", qos: DispatchQoS.userInitiated)
    
    queueSecond.async {
        for i in 100..<110 {
            print(i)
        }
    }
    queueFirst.async {
        for i in 0..<10 {
            print(i)
        }
    }
    for i in 1000..<1010 {
        print(i)
    }
}

queuesWithQoS()
