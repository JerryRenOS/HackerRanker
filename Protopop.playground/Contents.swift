import Foundation
import UIKit

// MARK: - Dec 11th
           
// Failable
struct Employee {
    var entryname: String
    var passcode: String
    
    init?(entryname: String, passcode: String) {  // Failable (init?) initialization
        guard passcode.count >= 11 else { return nil }
        guard passcode.lowercased() != passcode else { return nil }
        self.entryname = entryname
        self.passcode = passcode
    }
}


// DiscardableResult (can return something or return nothing, silencing the warning of result not being used)

@discardableResult
private func settabledefaults(val: Int, forKey key: String) -> Bool {
    guard val >= 0 && val <= 99 else { return false }
    UserDefaults.standard.setValue(val, forKey: key)
    UserDefaults.standard.synchronize()
    return true
}
                
private func gettabledefaults(forKey key: String) -> Int {
    return UserDefaults.standard.integer(forKey: key)
}
                        
let percentageVal = 77
let percentageValDiscardable = 111
let percentageKey = "%"

settabledefaults(val: percentageValDiscardable, forKey: percentageKey)
gettabledefaults(forKey: percentageKey)
                     


        






// MARK: - 9.24 & 9.30 & 10.8
      
// Sep 24  ____________________________

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

var electricSwitch = OnAndOff.on
electricSwitch.toggle()

protocol RandNumbGenerator: AnyObject { //class-only protocol
    func random() -> Double
}

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

class MyClass: mockProtocol {
    var protocolProperty: String
    
    required init(initializer1: String, initializer2: String) {
        self.protocolProperty = initializer1 + initializer2
    }

    func whateverFunc() {
        print("whateverFunc inside class")
    }
}

var myObj = MyClass.init(initializer1: "init uno", initializer2: "init er")
myObj.whateverFunc()
 
 
 
// 9/30 below ___________________________________

@objc protocol ObjcPrintable {
    @objc optional func canPrint() -> Bool
}

protocol AppleEmployees {
    func attendWWDC()
}
extension AppleEmployees {
    func attendWWDC() {
        print("let's go")
    }
}
struct SteveJobs: AppleEmployees {
    func attendWWDC() {
        print("nah")
    }
}

protocol Logs {
    var fileName: String { get }
}

extension Logs {
    var fileName: String {
        return "default.logs"
    }
}

// 1. Default protocol implementation
// 2. Creating optional and required method for protocol

typealias CodableNewProtocolAlias = Encodable & Decodable


// October 8th
// tuples vs array
fileprivate func dmy() -> (date: Int, month: String, year: Int) {
    return (2020, "December", 17)
}

let d = dmy()
var date = d.date
date += 1
print(date)

fileprivate func dmy2() -> [Any] {
    return ([2020, "December", 17] as? [Any])!
}

let date2 = dmy2()[0] as! Int
print(date2)
