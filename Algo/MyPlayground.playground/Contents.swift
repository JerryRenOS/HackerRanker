import UIKit

var str = "Hello, playground"

let numbersForTestings = [1, 2, 4, 6, 8, 9, 11, 13, 16, 17, 20]


func binarySearch(searchValue: Int, array: [Int]) -> Bool {
    
    var rightIndex = array.count - 1
    var leftIndex = 0
    
    while leftIndex <= rightIndex {
        
        let middleIndex = Int((leftIndex + rightIndex) / 2)
        let middleValue = array[middleIndex]
        
        if middleValue == searchValue {
            return true
        }
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        if searchValue > middleValue {
            leftIndex = middleIndex + 1
        }
    }
    return false
}

print(binarySearch(searchValue: 18, array: numbersForTestings))


func linearSearch(searchValue: Int, array: [Int]) -> Bool {
    for num in array {
        if num == searchValue {
            return true
        }
    }
    return false
}
         
print(linearSearch(searchValue: 11, array: numbersForTestings))
