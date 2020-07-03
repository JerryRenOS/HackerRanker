//
//  PrimeFiboFacto.swift
//  Algo
//
//  Created by Jerry Ren on 7/2/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Primes

class FPF: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isItPrime(targetNumber: 43)
        isItPrime(targetNumber: 999)
        isItPrime(targetNumber: 11100113)
        isItPrime(targetNumber: 11100111)
        isItPrime(targetNumber: 2)
        
        fiboNacci(targetNumber: 10)
        fiboNacci(targetNumber: 87)
        
        factCalc(targetNumber: 6)
        factCalc(targetNumber: 20)
    }
    
    fileprivate func isItPrime(targetNumber: Int) -> Bool {
        
        var primeOrNot: Bool = false
        
        guard targetNumber > 1 else { return false }
        
        if (targetNumber == 2) { primeOrNot = !primeOrNot}
            
        else {
            let checkPoint = Int(sqrt(Double(targetNumber))) + 1
            
            for factor in 2...checkPoint {
                if targetNumber % factor == 0 {
                    primeOrNot = false
                    break
                } else {
                    primeOrNot = true
                }
            }
        }
        print(primeOrNot)
        return primeOrNot
    }
    
    
    // MARK: - Fibonacci Builder
    
    func fiboNacci(targetNumber: Int) -> Int {
        
        var fiboResult = 0
        
        if targetNumber >= 0 && targetNumber <= 1 {
            fiboResult = targetNumber
        }
        var x = 0
        var y = 1
        var z = 2
        
        for _ in 2..<targetNumber {
            z = x + y
            x = y
            y = z
        }
        fiboResult = x + y
        print(fiboResult)
        
        return fiboResult
    }
    
    
    // MARK: - Factorial Calculator
    
    func factCalc(targetNumber: Int) -> Int {
        
        var finalFact = 0
        var transitionArray: [Int] = []
        
        for index in 1...targetNumber {
            transitionArray.append(index)
        }
        
        finalFact = transitionArray.reduce(1, { (m, n) in
            m * n
        })                   // or .reduce(1, { $0 * $1 })
        print(finalFact)
        return finalFact
    }
}


// MARK: -  Too time-inefficient sadly
//func fibonacciRecursive (target: Int) -> Int {
//    var fiboResult = 0
//    if target >= 0, target <= 1 {
//        fiboResult = target
//    } else if target >= 2 {
//        fiboResult = fibonacciRecursive(target: target-2) + fibonacciRecursive(target: target-1)
//    }
//    return fiboResult
//}
//fibonacciRecursive(target: 10)

