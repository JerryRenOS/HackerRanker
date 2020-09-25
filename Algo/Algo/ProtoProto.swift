//
//  ProtoProto.swift
//  Algo
//
//  Created by Jerry Ren on 9/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

protocol TogglableProtocol {
    mutating func toggle()
}

enum OnAndOff: TogglableProtocol {
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

fileprivate func electricSwitchToggling() {
    var electricSwitch = OnAndOff.on
    electricSwitch.toggle()
}

// ____________________

protocol mockProtocol {
    mutating func whateverFunc()
    init(initializer1: String, initializer2: String)
    var protocolProperty: String { get }
}

extension mockProtocol {
    func whateverFunc() {
        print("whateverFunc inside protocol extension")
    }
}

struct MyStruct: mockProtocol {
    
    var protocolProperty: String { return "qpq"}
    var structProperty: String
    
    mutating func whateverFunc() {
        structProperty = structProperty + structProperty
        print("func inside struct")
    }
    
    init(initializer1: String, initializer2: String) {
        self.structProperty = initializer1
        //        self.protocolProperty = initializer2
    }
}

protocol RandNumbGenerator: AnyObject { //class-only protocol
    func random() -> Double
}
