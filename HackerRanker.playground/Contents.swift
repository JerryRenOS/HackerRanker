import UIKit


// MARK: - GemStone Finally Successful

//func gemstones(arr: [String]) -> Int {
//
//    func stringIntoSet(annoyingString: String) -> Set<String> {
//        var tempArray: [String] = []
//        for element in annoyingString {
//            tempArray.append(String(element))
//        }
//        return Set(tempArray)
//    }
//
//    var gemCount = 0
//
//    var reusableArray: [String] = []
//
//    var previousSet: Set<String> = []
//    var reusableSet: Set<String> = []
//
//    var setZero: Set<String> = []
//    var setOne: Set<String> = []
//
//    let rockZero = arr[0]
//    let rockOne = arr[1]
//
//    for mineralZero in rockZero {
//        reusableArray.append(String(mineralZero))
//    }
//
//    setZero = Set(reusableArray)
//    setOne = stringIntoSet(annoyingString: rockOne)
//
//    reusableArray = []  // clear it out
//
//    var initialIntersection = setZero.intersection(setOne)
//
//    var setIntersection: Set<String> = initialIntersection
//
//    if arr.count > 3 {
//        for index in 2...(arr.count-1) {
//            setIntersection = setIntersection.intersection(stringIntoSet(annoyingString: arr[index]))
//        }
//    } else if arr.count == 3 {
//        setIntersection = initialIntersection.intersection(stringIntoSet(annoyingString: arr[2]))
//    } else if arr.count == 2 {
//        setIntersection = initialIntersection
//    } else if arr.count == 1 {
//        setIntersection = setZero
//    }
//
//    gemCount = setIntersection.count
//
//    return gemCount
//}
//gemstones(arr: ["abcdde", "baccd", "eeabg"])
//
////var myString = "abghdgdfbh"
////print(myString.components(separatedBy: " "))


// MARK: - Gemstone failed 1

//func gemsstones(arr: [String]) -> Int {
//
//    var gemDict: [String:Int] = [:]
//    let numOfRocks = arr.count
//    for rocks in arr {
//        for mineral in rocks {
//            gemDict[String(mineral)] = (gemDict[String(mineral)] ?? 0) + 1
//        }
//    }
//    var gemCount = 0
//    for potentialGem in gemDict.keys {
//        if gemDict[potentialGem] == numOfRocks {
//            gemCount += 1
//        }
//    }
//    return gemCount
//}
//
//// MARK: - Gemstone failed 2
//func gemstones(arr: [String]) -> Int {
//    var gemCount = 0
//    let rockOne = arr[0]
//    var gemDict: [String:Int] = [:]
//    for mineral in rockOne {
//        gemDict[String(mineral)] = (gemDict[String(mineral)] ?? 0) + 1
//    }
//    let rockTwo = arr[1]
//    var countArray: [Int] = []
//    for rock in arr {
//        var tempCount = 0
//        for mineral in gemDict.keys {
//            if rock.contains(mineral) {
//                gemDict[String(mineral)] = (gemDict[String(mineral)] ?? 0) + 1
//            }
//        }
//        countArray.append(tempCount)
//    }
//    return gemCount
//}

// MARK: - Sock Merchant with forEach one-liner

// func sockMerchant(n: Int, ar: [Int]) -> Int {
//    var pairs = 0
//    var dict: [Int : Int] = [:]
//    ar.forEach { dict[$0, default: 0] += 1 }
//
//    for count in dict.values {
//        let pair = Int(count / 2)
//        pairs += pair
//    }
//    return pairs
//}
//sockMerchant(n: 9, ar: [3, 5, 3, 6, 6, 6, 7, 3, 3])
//
//
// MARK: - Repeated String (super simple)
//func repeatedString(s: String, n: Int) -> Int {
//
//    let length = s.count
//
//    var aInsideS = 0
//
//    for m in s {
//        if m == "a" {
//            aInsideS += 1
//        }
//    }
//
//    var numofA = 0
//    let howManyStrings = Int(n/length)
//
//    numofA += howManyStrings * aInsideS
//
//    let lenOfRemaining = n - howManyStrings * length
//
//    var aInRemaning = 0
//
//    var aRay: [String] = []
//
//    for i in s {
//        aRay.append(String(i))
//    }
//
//    if lenOfRemaining >= 1 {
//        for s in 0...(lenOfRemaining - 1) {
//            if aRay[s] == "a" {
//                aInRemaning += 1
//            }
//        }
//    }
//
//    numofA += aInRemaning
//
//    //    print(length)
//    //    print(howManyStrings)
//    //    print(lenOfRemaining)
//    //    print(aInRemaning)
//    //    print(numofA)
//    //
//    return numofA
//}
//
//repeatedString(s: "aba", n: 10)
//
//// MARK: - 2D Array
//
//
//
//func hourglassSum(arr: [[Int]]) -> Int {
//
//    var innerSum = 0
//
//    var comparisonArray: [Int] = []
//
//    for i in 0...3 {
//        for j in 0...3 {
//
//            let individualSum = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]
//
//            comparisonArray.append(individualSum)
//
//        }
//    }
//    print(comparisonArray)
//    guard let maximo = comparisonArray.max() else {return 0}
//    print(maximo)
//
//    return maximo
//
//}
//
//let testingArray = [[1, 1, 1, 0, 0, 0],[0, 1, 0, 0, 0, 0],[1, 1, 1, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]]
//
//hourglassSum(arr: testingArray)
//
//// MARK: -  Rotating Array
//
//func rotLeft(a: [Int], d: Int) -> [Int] {
//    let lengthOfArray = a.count
//    var newArray: [Int] = []
//
//    for s in d...(lengthOfArray-1) {
//        newArray.append(a[s])
//    }
//
//    for p in 1...d {
//        newArray.append(a[p-1])
//    }
//    print(newArray)
//    return newArray
//}
//
//rotLeft(a: [3, 1, 2, 4, 5, 8, 4, 7], d: 4)
//

//
//// MARK: - Ice Cream Parlor
//
//func whatFlavors(cost: [Int], money: Int) -> Void {
//
//    let numOfFlavors = cost.count
//
//    var firstID = 0
//    var secondID = 0
//
//    for s in 0...(numOfFlavors-1) {
//
//        for p in 0...(numOfFlavors) {
//            if p != s {
//                if cost[s] + cost[p] == money {
//                    firstID = s + 1
//                    secondID = p + 1
//                }
//            }
//        }
//    }
//
//    print(firstID, secondID)
//
//}

// MARK: - Utopian Tree

//func utopianTree(n: Int) -> Int {
//
//    var treeHeight = 0
//
//    let cycle = Double(n/2).rounded(.up)
//    var powered = pow(Double(2), cycle)
//
//    if n == 0 {
//        return 1
//    }
//
//    else if n >= 1, (n % 2) == 0 {
//        treeHeight = (utopianTree(n: n - 1)) + 1                // Int(powered + Double(utopianTree(n: n-2)))
//    }
//
//    else if n >= 1, (n % 2) == 1 {
//        treeHeight = 2 * utopianTree(n: n - 1)                                     //Int(powered + Double(utopianTree(n: n-2))) + 1
//    }
//
//    print(treeHeight)
//    return treeHeight
//}
//
//print(utopianTree(n: 7))


// MARK: - Fibo

//func fibonacci (n: Int) -> Int {
//
//    var fiboResult = 0
//
//    if n >= 0, n <= 1 {
//        fiboResult = n
//
//    } else if n >= 2 {
//        fiboResult = fibonacci(n: n-2) + fibonacci(n: n-1)
//    }
//    print(fiboResult)
//    return fiboResult
//}
//
//fibonacci(n: 6)

// MARK: - Two Strings

//func twoStrings(s1: String, s2: String) -> String {
//
//    var binar = 0
//    var yesOrNo = ""
//
//    for m in s1 {
//        for q in s2 {
//            if q == m {
//                binar += 1
//            }
//        }
//    }
//    if binar == 0 {
//         yesOrNo = "NO"
//    } else if binar >= 1 {
//        yesOrNo = "YES"
//    }
//
//    return yesOrNo
//}
//
//print(twoStrings(s1: "ebcda", s2: "qqeh"))

// MARK: - Make Anagram

//func makeAnagram(a: String, b: String) -> Int {
//
//    var numOfDeletions = 0
//    var dictA: [String : Int] = [:]
//    var dictB: [String:Int] = [:]
//
//    for q in a {
//
//        if let qq = dictA[String(q)] {
//            dictA.updateValue(qq+1, forKey: String(q))
//        } else {
//            dictA.updateValue(1, forKey: String(q))
//        }
//    }
//
//    for q in b {
//
//        if let qq = dictB[String(q)] {
//            dictB.updateValue(qq+1, forKey: String(q))
//        } else {
//            dictB.updateValue(1, forKey: String(q))
//        }
//    }
//
//    for (keyB, valueB) in dictB {
//
//        if dictA.keys.contains(keyB) == true {
//            numOfDeletions += abs(valueB - (dictA[keyB] ?? 0))
//        } else if dictA.keys.contains(keyB) == false {
//
//            numOfDeletions += valueB
//        }
//    }
//
//    for (keyA, valueA) in dictA {
//
//        if dictB.keys.contains(keyA) == false {
//            numOfDeletions += valueA
//        }
//    }
//
//    return numOfDeletions
//}
//
//print(makeAnagram(a: "cde", b: "abc"))


// MARK: - Time Conversion

//func timeConversion(s: String) -> String {
//    var arrayAmPm: [String] = []
//    var militaryString = ""
//
//    for element in s {
//        arrayAmPm.append(String(element))
//    }
//
//    var shortenedS = ""
//    for index in 2...7 {
//        shortenedS += arrayAmPm[index]
//    }
//
//    if arrayAmPm.contains("A") {
//
//        if arrayAmPm[0] == "1", arrayAmPm[1] == "2" {
//
//            militaryString = "0" + "0" + shortenedS
//        }
//        else {
//
//            for index in 0...7 {
//                militaryString += arrayAmPm[index]
//            }
//        }
//    }
//
//    else {  // if contains "P"
//        if arrayAmPm[0] == "1", arrayAmPm[1] == "2" {
//
//            militaryString = "1" + "2" + shortenedS
//        }
//
//        else {
//
//            let hour1 = String((Int(arrayAmPm[0]) ?? 0) + 1)
//            let hour2 = String((Int(arrayAmPm[1]) ?? 0) + 2)
//
//            militaryString += (hour1 + hour2)
//
//            for index in 2...7 {
//                militaryString += arrayAmPm[index]
//            }
//        }
//    }
//
//    return militaryString
//}
//
//let timeA = "12:05:39AM"
//let timeB = "12:45:54PM"
//
//print(timeConversion(s: timeA))
//print(timeConversion(s: timeB))

// MARK: - DayOfProgrammer

//func dayOfProgrammer(year: Int) -> String {
//
//    var pDayString = ""
//
//    let yearSring = String(year)
//
//    if year < 1918 {
//
//        if year % 4 == 0 {
//            pDayString = "12.09." + yearSring
//        }
//        else {
//            pDayString = "13.09." + yearSring
//        }
//    }
//
//    else if year == 1918 {
//        pDayString = "26.09." + yearSring
//    }
//
//    else if year > 1918 {
//
//        if year % 400 == 0 {
//            pDayString = "12.09." + yearSring
//        } else if year % 4 == 0 && year % 100 != 0 {
//            pDayString = "12.09." + yearSring
//        } else {
//            pDayString = "13.09." + yearSring
//        }
//    }
//
//    return pDayString
//}

// MARK: - Magical Square (incomplete)

//func formingMagicSquare(s: [[Int]]) -> Int {
//
//    let possibleCombos = [
//        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
//        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
//        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
//        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
//        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
//        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
//        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
//        [[2, 7, 6], [9, 5, 1], [4, 3, 8]],
//    ]
//
//    var differencesArray: [Int] = []
//
//    for index in 0...7 {
//        var currentCombo = possibleCombos[index]
//        var differenceTotal = 0
//
//        for i in 0...2 {
//            for j in 0...2 {
//
//                differenceTotal += abs(s[i][j] - currentCombo[i][j])
//
//            }
//        }
//        differencesArray.append(differenceTotal)
//
//    }
//
//    print(differencesArray)
//
//    guard let minimumCost = differencesArray.min() else {return 0}
//
//    return minimumCost
//}

//formingMagicSquare(s: [[4, 8, 2], [4, 5, 7],[6, 1, 6]])

// MARK: - staircase

//func staircase(n: Int) -> Void {
//
//    var toBePrinted = ""
//
//    for s in 1...n {
//
//        let spaced = String(repeating: " ", count: (n - s))
//        let dialed = String(repeating: "#", count: s)
//
//        toBePrinted +=  spaced + dialed + "\n"
//    }
//    print(toBePrinted)
//}


//// MARK: - Encription
//
//func encryption(s: String) -> String {
//
//    let length = s.count
//
//    let row = Int(sqrt(Double(length)))
//
//    var column = 0
//    if row * row == length {
//        column = row
//    } else {
//        column = row + 1
//    }
//
//    var sArray: [String] = []
//
//    for characters in s {
//        sArray.append(String(characters))
//    }
//
//    var newArray: [String] = []
//
//        for q in 0...(column-1) {
//            for index in 0...(length-1) {
//
//            if index % column == q {
//
//                newArray.append(sArray[index])
//
//            }
//        }
//            newArray.append(" ")
//    }
//
//    var newString = ""
//
//    for i in 0...(newArray.count-1) {
//        newString += newArray[i]
//    }
//
//    return newString
//}
//
//encryption(s: "haveaniceday")
//
//encryption(s: "sbbbbgghhhbbh")

// MARK: - saveThePrisoner

//func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
//
//    var unluc = 0
//
//    let remainder = m % n
//
//    if s + remainder - 1 > n {
//        unluc = remainder + s - 1 - n
//    }
//    else {
//    unluc = remainder + s - 1
//    }
//
//    if unluc == 0 {
//        unluc = n
//    }
//
//    return unluc
//}
//
//print(saveThePrisoner(n: 57109959, m: 451440582, s: 4188603))

// MARK: - gradingStudents

//func gradingStudents(grades: [Int]) -> [Int] {
//
//    var roundedGrade = 0
//
//    var roundedArray: [Int] = []
//
//    for grade in grades {
//
//        if grade < 38 {
//            roundedGrade = grade
//        }
//
//        else if grade >= 38 {
//
//        var remained = grade % 5
//
//        if remained == 0 {
//            roundedGrade = grade
//        } else if remained > 2 {
//            roundedGrade = grade + 5 - remained  // + or - ? or (+ 5 - remained)
//        } else {
//            roundedGrade = grade
//            }
//        }
//        roundedArray.append(roundedGrade)
//    }
//
//    return roundedArray
//}

//var arrayA = [3, 1, 4, 1, 5, 9, 2, 6]

// MARK: - Circular Array

//
//func circularArrayRotation(a: [Int], k: Int, queries: [Int]) -> [Int] {
//
//    let length = a.count
//    var rotatedArray: [Int] = []
//    var returnedArray:[Int] = []
//
//    let secondHalf = a[length-k..<length]
//    let firstHalf = a[0..<length-k]
//
//    rotatedArray = Array(secondHalf) + Array(firstHalf)
//
//    for index in queries {
//        returnedArray.append(rotatedArray[index])
//    }
//
//    return returnedArray
//}

// MARK: - Picking Numbers

//func pickingNumbers(a: [Int]) -> Int {
//
//    var dictNum: [Int:Int] = [:]
//
//    for element in a {
//        dictNum[element] = (dictNum[element] ?? 0) + 1
//    }
//
//    var someNum = 0
//    var someArray:[Int] = []
//
//    for key in dictNum.keys {
//
//        if dictNum.keys.contains(key+1) {
//            someNum = (dictNum[key] ?? 0) + (dictNum[key+1] ?? 0)
//        } else {
//            someNum = dictNum[key] ?? 0
//        }
//        someArray.append(someNum)
//    }
//
//    guard let toBeReturned = someArray.max() else {return 0}
//
//    return toBeReturned
//
//}
//
//
//pickingNumbers(a:[4, 6, 5, 3, 3, 1])
//
////    var counterArray:[Int] = []
////    for jndex in 0...(a.count - 1) {
////        var counter = 0
////        for index in 0...(a.count - 1) {
////
////            if abs(a[index] - a[jndex]) <= 1 {
////                counter += 1
////            }
////            counterArray.append(counter)
////        }
////    }
////
////    guard let maxCounter = counterArray.max() else {
////        return 0
////    }
////
////    return (maxCounter - 1)
//
//
//pickingNumbers(a: [9, 6, 13, 16, 5, 18, 4, 10, 3, 19, 4, 5, 8, 1, 13, 10, 20, 17, 15, 10, 6, 10, 13, 20, 18, 17, 7, 10, 6, 5, 16, 18, 13, 20, 19, 7, 16, 13, 20, 17, 4, 17, 8, 19, 12, 7, 17, 1, 18, 3, 16, 4, 5, 3, 15, 17, 6, 17, 14, 11, 11, 7, 11, 6, 15, 15, 12, 6, 17, 19, 8, 6, 13, 9, 10, 19, 14, 18, 7, 9, 11, 16, 11, 20, 4, 20, 10, 7, 8, 4, 2, 12, 11, 8, 12, 13, 19, 8, 8, 5])



// MARK: - Ransom Magazine (unsuccessful attempt)
//
//func checkMagazine(magazine: [String], note: [String]) -> Void {
//
//    let magaCount = magazine.count
//    let notoCount = note.count
//
//    var basicCounter = 0
//
//    if magaCount < notoCount {
//        print("No")
//    } else if magaCount >= notoCount {
//
//        for s in note {
//
//            for q in 0...(magaCount-1) {
//                if s == magazine[q] {
//                    basicCounter += 1
//                }
//            }
//        }
//
//        if notoCount == basicCounter {
//            print("Yes")
//        } else {
//            print("No")
//        }
//    }
//}

// MARK: - Ransom Magazine re-try
//func checkMagazine(magazine: [String], note: [String]) -> Void {
//
//    var magaDict: [String:Int] = [:]
//    var noteDict: [String:Int] = [:]
//
//    for words in magazine {
//        magaDict[words] = (magaDict[words] ?? 0) + 1
//    }
//
//    for words in note {
//        noteDict[words] = (noteDict[words] ?? 0) + 1
//    }
//
//    let noteSize = noteDict.count
//    var counter = 0
//
//    for noteKey in noteDict.keys {
//
//        if magaDict.keys.contains(noteKey) {
//            if let noteValue = noteDict[noteKey], let magaValue = magaDict[noteKey] {
//                if magaValue >= noteValue {
//                    counter += 1
//                }
//            }
//        }
//    }
//
//    if counter == noteSize {
//        print("Yes")
//    } else {
//        print("No")
//    }
//}
//
//checkMagazine(magazine: ["give", "me", "one", "grand", "today", "night"], note: ["give", "one", "grand", "today"])


// MARK: - Migrate Birds

//func migratoryBirds(arr: [Int]) -> Int {
//
//    var birdDiction: [Int:Int] = [:]
//
//    for bird in arr {
//        birdDiction[bird] = (birdDiction[bird] ?? 0) + 1
//    }
//
//    print(birdDiction)
//
//    let maxBirdCount = birdDiction.values.max() ?? 0
//
//    let birdKeys = (birdDiction as NSDictionary).allKeys(for: maxBirdCount) as! [Int]
//
//    guard let birdTypeUltimate = birdKeys.min() else { return 1 }
//
//    return birdTypeUltimate
//}
//
//print(migratoryBirds(arr: [1, 2 ,3, 4, 5, 4, 3, 2, 1, 3, 4]))


// MARK: - Two Strings

//func twoStrings(s1: String, s2: String) -> String {
//
//    var yesOrNo = "NO"
//    var sOneDict: [String:Int] = [:]
//    var sTwoDict: [String: Int] = [:]
//
//    for char in s1 {
//        sOneDict[String(char)] = (sOneDict[String(char)] ?? 0) + 1
//    }
//
//    for char in s2 {
//
//        sTwoDict[String(char)] = (sTwoDict[String(char)] ?? 0) + 1
//    }
//
//    for dictOneKey in sOneDict.keys {
//        if sTwoDict.keys.contains(dictOneKey) {
//            yesOrNo = "YES"
//        }
//    }
//
//    return yesOrNo
//}
//
//twoStrings(s1: "aardvark", s2: "aardvarkddfdfdf")


// MARK: - MCS Pop-Test

// MARK: - Question 1

//func countStudents(height: [Int]) -> Int {
//
//    var numOfStudentsNotCorrect = 0
//
//    let correctOrder = height.sorted()
//
//    for index in 0...(height.count - 1) {
//
//        if height[index] != correctOrder[index] {
//            numOfStudentsNotCorrect += 1
//        }
//    }
//
//    return numOfStudentsNotCorrect
//}
//
//var height = [1, 1, 3, 3, 4, 1]
//
//print(height.sorted())
//
//countStudents(height: height)

// MARK: - Question 2

//func mergeStrings(a: String, b: String) -> String {
//
//    var mergeComplete = ""
//
//    var aArray: [String] = []
//    var bArray: [String] = []
//
//    for element in a {
//        aArray.append(String(element))
//    }
//    for element in b {
//        bArray.append(String(element))
//    }
//
//    let lengthOfA = aArray.count
//    let lengthOfB = bArray.count
//
//    var overlapSize = 0
//    var longerLength = 0
//    var longerArray: [String] = []
//
//    if lengthOfA > lengthOfB {
//        overlapSize = lengthOfB
//        longerLength = lengthOfA
//        longerArray = aArray
//
//    } else if lengthOfA < lengthOfB {
//        overlapSize = lengthOfA
//        longerLength = lengthOfB
//        longerArray = bArray
//    }
//
//    var mergedArray: [String] = []
//
//    if overlapSize != 0 {
//
//        for index in 0...(overlapSize-1) {
//            mergedArray = mergedArray + [aArray[index]] + [bArray[index]]
//        }
//
//        for extraIndex in overlapSize...(longerLength-1) {
//            mergedArray += [longerArray[extraIndex]]
//        }
//    } else if overlapSize == 0 {
//        for index in 0...(lengthOfA-1) {
//            mergedArray = mergedArray + [aArray[index]] + [bArray[index]]
//        }
//    }
//
//    for element in mergedArray {
//        mergeComplete += element
//    }
//
//    return mergeComplete
//}
//
//var a = "abc"
//var b = "def"
//
//mergeStrings(a: a, b: b)

// MARK: - Climbing Leaderboard

//func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int] {
//
//    var aliceRankings: [Int] = []
//
//    var scoreDict: [Int:Int] = [:]
//
//    for score in scores {
//        scoreDict[score] = (scoreDict[score] ?? 0) + 1
//    }
//
//    print(scoreDict)
//
//    var aliceRank = 1
//    var aliceRankArray: [Int] = []
//
//    for aliceScore in alice {
//        for scoreKey in scoreDict.keys {
//            if aliceScore < scoreKey {
//                aliceRank += 1
//            }
//        }
//        aliceRankArray.append(aliceRank)
//        aliceRank = 1
//    }
//
//    return aliceRankArray
//}
//
//print(climbingLeaderboard(scores: [100, 90, 90, 80, 75, 60], alice: [50, 65, 77, 90, 102]))
//// answer should be 6 5 4 2 1

// MARK: - Insertion Sort 1

//func insertionSort1(n: Int, arr: [Int]) -> Void {
//
//    let lastItem = arr.last ?? 0
//    var arrayInProcess: [Int] = arr
//
//    var index = arr.count - 2
//
//    while index >= 0 {
//
//        if lastItem < arrayInProcess[index] {
//            arrayInProcess[index + 1] = arrayInProcess[index]
//            arrayInProcess[index] = lastItem
//        }
//        print(arrayInProcess)
//
//        index -= 1
//    }
//}

//func insertionSort1(n: Int, arr: [Int]) -> Void {
//
//    let lastItem = arr.last ?? 0
//    var arrayInProcess: [Int] = arr
//
//    var index = arr.count - 2
//
//    if lastItem >= arrayInProcess[0] {
//
//    while lastItem <= arrayInProcess[index], index >= 1 {
//
//        arrayInProcess[index + 1] = arrayInProcess[index]
//        print((arrayInProcess.map{String($0)}).joined(separator: " "))  // crucial line
//
//        index -= 1
//    }
//    arrayInProcess[index+1] = lastItem
//    }
//
//    else if lastItem < arrayInProcess[0] {
//        while lastItem <= arrayInProcess[index], index >= 1 {
//
//            arrayInProcess[index + 1] = arrayInProcess[index]
//            print((arrayInProcess.map{String($0)}).joined(separator: " "))  // crucial line
//
//            index -= 1
//        }
//        arrayInProcess[1] = arrayInProcess[0]
//        print((arrayInProcess.map{String($0)}).joined(separator: " "))
//
//        arrayInProcess[0] = lastItem
//    }
//
//    print((arrayInProcess.map{String($0)}).joined(separator: " "))
//}
//
//insertionSort1(n: 10, arr: [2, 3, 4, 5, 6, 7, 8, 9, 10, 1])
//
//let testArray2 = [1, 3, 5, 9, 13, 22, 27, 35, 46, 51, 55, 83, 87, 23]
//insertionSort1(n: 14, arr: testArray2)
//
//let arr = [2, 4, 6, 8, 3]
//
//insertionSort1(n: 5, arr: [2, 4, 6, 8, 3])
//
//let formattedArray = (arr.map{String($0)}).joined(separator: " ")

// MARK: - Nacci Modified (not time-efficient though)

//func fibonacciModified(t1: Int, t2: Int, n: Int) -> Int {
//
//    var fiboResult = 0
//
//    if n <= 3 {
//        fiboResult = t1 + t2 * t2
//    }
//
//    if n > 3 {
//
//    fiboResult = fibonacciModified(t1: t1, t2: t2, n: n-2) + (fibonacciModified(t1: t1, t2: t2, n: n-1) * fibonacciModified(t1: t1, t2: t2, n: n-1))
//
//    }
//
//    return fiboResult
//}
//
//fibonacciModified(t1: 0, t2: 1, n: 7)

// MARK: - Between Two Sets

//func getTotalX(a: [Int], b: [Int]) -> Int {
//
//    var numOfQualified: [Int] = []
//
//    guard let aMax = a.max() else {return 0}
//
//    guard let bMin = b.min() else {return 0}
//
//    for integer in aMax...bMin {
//
//        for elementA in a {
//                for elementB in b {
//                    if elementB % integer == 0, integer % elementA == 0 {
//                        numOfQualified.append(integer)
//                }
//            }
//        }
//        print(numOfQualified)
//    }
//
//    return numOfQualified.count
//}
//
//getTotalX(a: [3, 4], b: [24, 48])

// MARK: - Funny String

//func funnyString(s: String) -> String {
//
//    var funnyOrNaw = "Not Funny"
//
//    var sArray: [String] = []
//
//    for character in s {
//        sArray.append(String(character))
//    }
//
//    var reversedSArray: [String] = []
//    var reversedS = ""
//
//    var index = s.count - 1
//    while index >= 0 {
//        reversedSArray.append(sArray[index])
//        index -= 1
//    }
//
//    var reversedAscii: [Int] = []
//    var originalAscii: [Int] = []
//
//    for index in 0...(reversedSArray.count-1) {
//
//        reversedAscii.append(Int(Character(reversedSArray[index]).asciiValue!))
//        originalAscii.append(Int(Character(sArray[index]).asciiValue!))
//
//    }
////    print(reversedAscii)
////    print(originalAscii)
//
//    var originalDifference: [Int] = []
//    var reversedDifference: [Int] = []
//
//    for index in 0...(reversedAscii.count-2) {
//
//        var absoluteDiffR = abs(reversedAscii[index] - reversedAscii[index+1])
//        var absoluteDiffO = abs(originalAscii[index+1] - originalAscii[index])
//
//        reversedDifference.append(absoluteDiffR)
//        originalDifference.append(absoluteDiffO)
//
//    }
//
//    if reversedDifference == originalDifference {
//        funnyOrNaw = "Funny"
//    }
//
//    return funnyOrNaw
//}
//
//print(funnyString(s: "niubaracaca"))

//for charac in "abcdefghijklmnopqrstuvwxyz" {
//    print(Character(String(charac)).asciiValue!)
//}



// MARK: - Weighted Uniform String (two approached below neither completely right but tried super hard haha)


//func weightedUniformStringsPrevious(s: String, queries: [Int]) -> [String] {
//
//    var yesNo = "Yes"
//    var weightedValues: [Int] = []
//
//    for charac in s {
//        var weightedInt = Character(String(charac)).asciiValue! - 96
//        weightedValues.append(Int(weightedInt))
//    }
//
//    print(weightedValues)
//
//    let arrayS = Array(s)
//    var scoreArray: [Int] = []
//
//    for index in 0...(s.count - 2) {  //有待微调
//
//        var uniCounter = 1
//        var score = weightedValues[index+1]  //有待微调
//
//        var pointer = index   //有待微调
//        var boolio = true
//
//        scoreArray.append(weightedValues[index])
//
//        while pointer < (s.count - 1), boolio == true { //有待微调
//
//            if arrayS[pointer] == arrayS[pointer+1] {
//                uniCounter += 1
//            } else {
//             //   uniCounter = 1
//                boolio = false
//            }
//            scoreArray.append(score * uniCounter)
//            pointer += 1
//        }
//
//    }
//
//    print(scoreArray)
//
//    var yesNoArray: [String] = []
//    for element in queries {
//
//        if scoreArray.contains(element) {
//            yesNo = "Yes"
//        } else {
//            yesNo = "No"
//        }
//        yesNoArray.append(yesNo)
//    }
//
//    return yesNoArray
//}
//
//weightedUniformStringsPrevious(s: "abccddde", queries: [6,1,3,12,5,9,10])
//
//[6,1,3,12,5,9,10]
//
//func weightedUniformStrings(s: String, queries: [Int]) -> [String] {
//
//    var yesNo = "Yes"
//    var weightedValues: [Int] = []
//
//    for charac in s {
//        var weightedInt = Character(String(charac)).asciiValue! - 96
//        weightedValues.append(Int(weightedInt))
//    }
//
//    var valueArray = weightedValues
//
//    var prev = 1
//    var length = 0
//
//    for value in valueArray {
//
//        if prev == value {
//            length += 1
//            valueArray.append(value * length)
//        } else {
//            prev = value
//            length = 1
//        }
//    }
//
//    var yesNoArray: [String] = []
//    for element in queries {
//
//        if valueArray.contains(element) {
//            yesNo = "Yes"
//        } else {
//            yesNo = "No"
//        }
//        yesNoArray.append(yesNo)
//    }
//
//    return yesNoArray
//}
//
//weightedUniformStrings(s: "abccddde", queries: [6,1,3,12,5,9,10])

// MARK: - Protocol Revisited

//enum ExtinguisherType: String {
//    case water, foam, sand, ice
//}
//
//protocol RespondToEmergency {
//    func putOutFire(with material: ExtinguisherType)
//}
//protocol fireStationDelegate {
//    func handleEmergency()
//}
//
//class FireStation {
//    var delegate: fireStationDelegate?
//    func emergencyCallReceived() {
//        delegate?.handleEmergency()
//    }
//}
//
//class Fireman: RespondToEmergency, fireStationDelegate {
//    func handleEmergency() {
//        putOutFire(with: .water)
//    }
//
//    func putOutFire(with material: ExtinguisherType) {
//        print("Fire was put out by \(material.rawValue)")
//    }
//}
//var fireman: Fireman = Fireman()
//fireman.putOutFire(with: .foam)
//var iceMan = Fireman()
//iceMan.putOutFire(with: .ice)
//
//let fireStation: FireStation = FireStation()
//fireStation.delegate = fireman
//fireStation.emergencyCallReceived()

// MARK: - Computed Properties
//var pizzaInInches: Int = 12 {
//    willSet {
//        print(newValue)
//    }
//    didSet {
//        if pizzaInInches >= 18 {
//            print("Invalid size requested, pizza set to our largest size 18")
//            pizzaInInches = 18
//        }
//    }
//}
//
//pizzaInInches = 33
//print(pizzaInInches)
//
//
//var numberOfPeople: Int = 6
//let slicesPerPerson: Int = 5
//
//var numberOfSlices: Int {
//
//    get {
//        return pizzaInInches - 4
//    }
//}
//
//var numberOfPizza: Int {
//    get {
//        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
//        return numberOfPeople / numberOfPeopleFedPerPizza
//    }
//    set {
//        let totalSlices = numberOfSlices * newValue
//        numberOfPeople = totalSlices / slicesPerPerson
//    }
//}
//
//print(numberOfPeople)

//var width: Float = 1.5
//var height: Float = 2.4
//
//// single bucket covers 1.5 meters squared
//var bucketsOfPaint: Int {
//    get {
//    return Int(ceilf((width * height) / 1.5))
//    }
//    set {
//        let areaCovered = Double(newValue) * 1.5
//        print("area covered is \(areaCovered)")
//    }
//}
//width = 17
//
//print(bucketsOfPaint)
//
//bucketsOfPaint = 191

// ------------------------------------------------------
// MARK: - Failed Attempt(s) at Super large Factorials

//func factorials(n: Int) -> Double {
//
//    var factOfN: Double = 1
//
////    if n == 1 {
////        factOfN = 1
////    } else {
////        factOfN = n * factorials(n: n - 1)
////    }
////
//    for index in 1...n {
//        factOfN = factOfN * Double(index)
//    }
//    return factOfN
//}
//
//func extraLongFactorials(n: Int) -> Void {
//    print(Int((factorials(n: n))))
//}
//
//extraLongFactorials(n: 20)

// MARK: - Non-recursive factorial attempt

//func factCalculation(_ targetNumber: Int) -> Double {
//
//    var transitionArray: [Double] = []
//    for index in 1...targetNumber {
//        var tweakedIndex = Double(index)
//        transitionArray.append(tweakedIndex)
//    }
//    let s = transitionArray.reduce(1, { (m, n) in
//        m * n
//    })
//    print(Int(s))
//
//    return s
//}

//factCalculation(19) // turning 'em into doubles still can't penetrate the 20 -> 21 barrier smh

// MARK: - Separating Numbers

//func separateNumbers(s: String) -> Void {
//    let sArray = Array(s)
//
//    let numOfDigits = s.count
//
////    for possibleLength in 1...Int(numOfDigits/2) {
////
////        var index = possibleLength - 1
////
////    }
//
//    for intChar in s {
//
//    }
//}


// MARK: - Append and Delete (almost completely right)

//func appendAndDelete(s: String, t: String, k: Int) -> String {
//
//    var yesOrNo = "No"
//
//    let sLen = s.count
//    let tLen = t.count
//
//    let lenCommon = [sLen, tLen].min() ?? 1
//
//    var samenessCount = 0
//
//    var same = true
//    var index = 0
//
//    while index < lenCommon {
//
//        if s.prefix(index) == t.prefix(index) {
//        index += 1
//        samenessCount += 1
//        }
//            else {
//                index = lenCommon
//        }
//    }
//    let minimumChange = abs(sLen - samenessCount) + abs(tLen - samenessCount)
//
//    if k >= sLen + tLen {
//        yesOrNo = "Yes"
//    }
//
//    if k >= minimumChange, (k - minimumChange) % 2 == 0 {
//        yesOrNo = "Yes"
//    }
//
//    return yesOrNo
//}
//
//let stringG = "opopy"
//let goodo = stringG.prefix(2)
//print(goodo)

// MARK: - Special Substring (unsolved) below are just thougt processes

//func specialSubstring(givenString: String) -> Int {
//
//    return 12
//}
//
//var myString = "kgkhhhlopooopooo"
//
//// dictionary of string character: array of their positions
//
//var dict: [String: [Int]] = ["x": [0]] // = [:]
//
//func stringIntoSet(annoyingString: String) -> Array<String> {
//        var tempArray: [String] = []
//        for element in annoyingString {
//            tempArray.append(String(element))
//        }
//        return tempArray
//    }
//
//var stringArray = stringIntoSet(annoyingString: myString)
//
//for index in 0...(stringArray.count-1) {
//
//    if var updatedArray = dict[stringArray[index]] {
//        dict.updateValue(updatedArray += [index], forKey: stringArray[index])
//    }
//
//    print(stringArray)
//
//}
////        if let qq = dictA[String(q)] {
////            dictA.updateValue(qq+1, forKey: String(q))
////        } else {
////            dictA.updateValue(1, forKey: String(q))
////        }
////    }
//print(dict)
//
//// how to get the index of all the same string in the array


// MARK: - Super easy challenge from the sorting category

//func maximumToys( prices: [Int], k: Int) -> Int {
//    var sortedPrices = prices.sorted()
//    var summed = 0
//    var counter = 0
//    while summed <= k {
//        summed += sortedPrices[counter]
//        counter += 1
//    }
//    return counter - 1
//}
//maximumToys(prices: [1, 12, 5, 111, 200, 1000, 10], k: 50)
//
// ______________________________________________


// https://stackoverflow.com/questions/24028860/how-to-find-index-of-list-item-in-swift


//func cutTheSticks(arr: [Int]) -> [Int] {
//
//    var stickLenArray: [Int] = [arr.count]
//
//    var mutableArr = arr
//
//    while mutableArr.count > 1 {
//        var arrMin = mutableArr.min() ?? 0
//        let newArr = mutableArr.filter {$0 != arrMin}
//        var subtractedArr = newArr.map {$0 - arrMin}
//        mutableArr = subtractedArr
//
//        var currentCount = mutableArr.count
//        stickLenArray.append(currentCount)
//    }
//    stickLenArray = stickLenArray.filter {$0 != 0}
//
//    return stickLenArray
//}
//
//print(cutTheSticks(arr: [8, 8, 14, 10, 3, 5, 14, 12]))
//print(cutTheSticks(arr: [1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1]))


// MARK: - Binary & Linear search

//let numbersForTestings = [1, 2, 4, 6, 8, 9, 11, 13, 16, 17, 20]
//
//func linearSearch(searchValue: Int, array: [Int]) -> Bool {
//    for num in array {
//        if num == searchValue {
//            return true
//        }
//    }
//    return false
//}
//print(linearSearch(searchValue: 11, array: numbersForTestings))

//func binarySearch(searchValue: Int, array: [Int]) -> Bool {
//
//    var rightIndex = array.count - 1
//    var leftIndex = 0
//
//    while leftIndex <= rightIndex {
//
//        let middleIndex = Int((leftIndex + rightIndex) / 2)
//        let middleValue = array[middleIndex]
//
//        if middleValue == searchValue {
//            return true
//        }
//        if searchValue < middleValue {
//            rightIndex = middleIndex - 1
//        }
//        if searchValue > middleValue {
//            leftIndex = middleIndex + 1
//        }
//    }
//    return false
//}
//print(binarySearch(searchValue: 18, array: numbersForTestings))


//let str = "qifaiqspp"
//let arrFromStr = str.components(separatedBy: "")
//print(arrFromStr)



// MARK: - Average over nearest neighbors

//private func nearestNeighbors(originalList: [Double]) -> [Double] {
//
//    let lenOfList = originalList.count
//    var resultList: Array<Double>
//
//    switch lenOfList {
//    case 0, 1:
//        return originalList
//    case 2:
//        let avg = (originalList[0] + originalList[1]) / 2
//        return [avg, avg]
//    default:
//        let firstElement = (originalList[0] + originalList[1]) / 2
//        resultList = [firstElement]
//
//        for index in 1...lenOfList-2 {
//            let sum = originalList[index-1] + originalList[index] + originalList[index + 1]
//            resultList.append(sum/3)
//        }
//        let lastElement = (originalList[lenOfList-2] + originalList[lenOfList-1]) / 2
//        resultList.append(lastElement)
//        print(resultList)
//        return resultList
//    }
//}
//
//nearestNeighbors(originalList: [1.0, 2.0, 3, 4, 5])
//nearestNeighbors(originalList: [3.7, 7.3])
//nearestNeighbors(originalList: [11.011])


// MARK: - Create a fruit class returning the required output
    
//final class FruitDataClass {
//    let fruitName: String
//    let fruitCount: Int
//
//    init(_ fruitName: String, _ fruitCount: Int) {
//        self.fruitName = fruitName
//        self.fruitCount = fruitCount
//    }
//
//    func makeFruitList() -> [String] {
//        var fruitList: Array<String> = []
//        for index in 0..<fruitCount {
//            fruitList.append(fruitName)
//        }
//        return fruitList
//    }}
//
//private func listOf(listOfFruits: [FruitDataClass]) -> [String] {
//    return listOfFruits.flatMap {$0.makeFruitList()}
//}
//
//listOf(listOfFruits: [FruitDataClass("Coconut", 3), FruitDataClass("Pineapple", 2)])
    
   

// MARK: - Reversing the string without moving speical characters
// Nov 17th
// My two drastically different solutions for reversing the string with the special characters in place

// Approach 1 is harder to conceive but my fav, and used a bit of indo-onnanoko's help
fileprivate func reversingStringBarringSpecialChars(originalStr: String) -> String {
    
    let azRange = 97...122
    let AZrange = 65...90
    var newStr = String.init()
    
    let originalArr = Array(originalStr)
    var filteredArr: [String] = []
    var specialCharDict: [Int:String] = [:]
    
    for (index, element) in originalArr.enumerated() {
        let asciiVal = Int(element.asciiValue ?? 0)
        let elementString = String(element)
        
        if azRange.contains(asciiVal) || AZrange.contains(asciiVal) {
            filteredArr.append(elementString)
        }
        else {
            specialCharDict.updateValue(elementString, forKey: index)
        }
    }
    filteredArr.reverse()

    let sortedCharDict = specialCharDict.sorted { (first, second) -> Bool in
        return first.key < second.key
    }
    
    let diff = originalArr.count - filteredArr.count
    for index in 0..<diff {
        filteredArr.append("")
    }
    for (index, specialchar) in sortedCharDict {
       filteredArr.insert(specialchar, at: index)
    }
    newStr = filteredArr.joined(separator: "")
    print(newStr)
    return newStr
}

let preStr1 = "Ab,c,de!$"
// "ed,c,bA!$"
reversingStringBarringSpecialChars(originalStr: preStr1)

let preStr2 = "a,b$c"
// "c,b$a"
reversingStringBarringSpecialChars(originalStr: preStr2)

//// ___________________________________________________________
//// Approach 2 - a more standard method with swaps
//
//private func confirmedAsLatinAlphabetLetter(targetStr: String) -> Bool {  // helper to check if an element belongs to
//        let azRangeAscii = 97...122
//        let AZrangeAscii = 65...90
//        let targetChar = Character(targetStr)
//        let asciiVal = Int(targetChar.asciiValue ?? 0)
//        return azRangeAscii.contains(asciiVal) || AZrangeAscii.contains(asciiVal)
//}
//
//func reversalBySwap(originalStr: String) -> String {
//    var newStr = String.init()
//    var originalArr = Array(originalStr)
//    var leftMost = 0
//    var rightMost = originalArr.count - 1
//
//    while rightMost > leftMost {
//        let leftElement = String(originalArr[leftMost])
//        let rightElement = String(originalArr[rightMost])
//        if !confirmedAsLatinAlphabetLetter(targetStr: leftElement) {
//            leftMost += 1
//        } else if !confirmedAsLatinAlphabetLetter(targetStr: rightElement) {
//            rightMost -= 1
//        } else {
//            originalArr.swapAt(rightMost, leftMost)
//            rightMost -= 1
//            leftMost += 1
//        }
//    }
//    newStr = String(originalArr)
//    return newStr
//}
//
//let orig = "Ab,c,de!$"
//let end = "ed,c,bA!$"
//print(reversalBySwap(originalStr: orig))

// _____________________________________________
 

// _____________________________________________
// Nov 20th
// MARK: - Contacts searcher

private func contactsSearcher(arrOfNames: [String], arrOfPhoneNumbers: [String], searchString: String) -> String? {
    var matchingIndexes = Array<Int>.init()
    var matchesNames = [String].init()
    
    for( index, phoneNumber) in arrOfPhoneNumbers.enumerated() {
        switch phoneNumber.contains(searchString) {
        case true:
            matchingIndexes.append(index)
        default:
            ()
        }
    }
    matchesNames = matchingIndexes.map { arrOfNames[$0] } // filtering the array based on indexes

    let namesSorted = matchesNames.sorted(by: <)
    guard let contactFound = namesSorted.first else { return "nobody"}
    print("Contact found is: \(contactFound)")
    return contactFound
}
        
//contactsSearcher(arrOfNames: ["pom", "pim"], arrOfPhoneNumbers: ["13240", "32410"], searchString: "324")
//contactsSearcher(arrOfNames: ["sander", "ann", "amy", "michael"], arrOfPhoneNumbers: ["123", "234", "345", "456"], searchString: "3")


// MARK: - Minimum number of coins flipped

// Approach 1, more concise
    
private func coinFlippingConcise(arrOfCoins: [Int]) -> Int {
    
    guard !arrOfCoins.isEmpty else { return 0 }
    var numOfFlips: Int = 0
    let leng = arrOfCoins.count

    var alternatingArr: Array<Int> = []
    for index in 0...leng-1 {
        switch index%2 {
        case 0:
            alternatingArr.append(0)
        default:
            alternatingArr.append(1)
        }
    }
    for index in 0...leng-1 {
        let coinElement = arrOfCoins[index], alternatingElement = alternatingArr[index]
        switch coinElement == alternatingElement {
        case true:
            break
        default:
            numOfFlips += 1
        }
    }
    return min(numOfFlips, leng-numOfFlips)
}

//___________________________
// Approach 2, more verbose
private func coinFlippingVerbose(arrOfCoins: [Int]) -> Int {
    
    guard !arrOfCoins.isEmpty else { return 0 }
    var numOfFlipsOne: Int = 0
    var numOfFlipsTwo: Int = 0
    let leng = arrOfCoins.count

    var alternatingArrOne: Array<Int> = []
    for index in 0...leng-1 {
        switch index%2 {
        case 0:
            alternatingArrOne.append(0)
        default:
            alternatingArrOne.append(1)
        }
    }
             
    var alternatingArrTwo = alternatingArrOne
    alternatingArrTwo.removeFirst(1)
    switch alternatingArrOne.last {
    case 0:
        alternatingArrTwo.append(1)
    default:
        alternatingArrTwo.append(0)
    }
    
    for index in 0...leng-1 {
        let currentElement = arrOfCoins[index]
        switch alternatingArrTwo[index] == currentElement{
        case false:
            numOfFlipsTwo += 1
        case true:
            break
        }
        switch alternatingArrOne[index] == currentElement {
        case true:
            break
        default:
            numOfFlipsOne += 1
        }
    }
    return min(numOfFlipsTwo, numOfFlipsOne)
}

//let arr0: Array<Int> = []
//let arr1 = [1]
//let arr2 = [1, 0]
//let arr3 = [0 , 1, 1, 0]
//let arr4 = [1, 1, 0, 1, 1]
//let arr5 = [1, 0, 1, 0, 1, 1]
//
//coinFlippingVerbose(arrOfCoins: arr0)
//coinFlippingVerbose(arrOfCoins: arr1)
//coinFlippingVerbose(arrOfCoins: arr2)
//coinFlippingVerbose(arrOfCoins: arr3)
//coinFlippingVerbose(arrOfCoins: arr4)
//coinFlippingVerbose(arrOfCoins: arr5)
//
//coinFlippingConcise(arrOfCoins: arr0)
//coinFlippingConcise(arrOfCoins: arr1)
//coinFlippingConcise(arrOfCoins: arr2)
//coinFlippingConcise(arrOfCoins: arr3)
//coinFlippingConcise(arrOfCoins: arr4)
//coinFlippingConcise(arrOfCoins: arr5)



//
//// MARK: - Babe Hack (hackingwithswift)  ~ Nov 17th
//
//var firstArr = [1, 2, 3]
//var secondArr = ["one", "two", "three"]
//var zippedArr = Array(zip(secondArr, firstArr))
//print(zippedArr)
//
//
//func squareOne<T: BinaryInteger>(_ value: T) -> T {
//   return value * value
//}
//print(squareOne(5))
//
//func squareTwo<T: FloatingPoint>(_ value: T) -> T {
//   return value * value
//}
//print(squareTwo(5))
//
//
//let string: String = String(describing: String.self)
//print(string)
//
//enum Planet: Int {
//   case Mercury = 1
//   case Venus
//   case Earth
//   case Mars
//}
//
//let testa = Planet(rawValue: 3)
//
//let names = ["Pilot": "Wash", "Doctor": "Simon"]
//for (key, value) in names.enumerated() {
//   let testVar = value
//   print(testVar)
//}
//
//let testaraay = [9, 7, 6, 3, 1]
//let testaraay2 = [9, 7, 6, 3, 1]
//
//let zipped = zip(testaraay, testaraay2)
//print(zipped)



// MARK: - Balanced fragments
// Nov 21st
    
// 微暴力 approach & 非暴力 approach
private func balancedFragments(targetString: String) -> Int {
    
    let targetArr = Array(targetString)
    let leng = targetArr.count
    var fragmentLengthArr = Array<Int>.init()
    
    var indexA = 1
    //    var breakIt = false
    while indexA <= leng {                  // breakIt != true
        for indexB in 0...leng-indexA {
            
            var setUpper: Set = Set<Character>.init()
            var setLower: Set<String.Element> = Set.init()
            
            let subArr = targetArr[indexB..<(indexB+indexA)]
            
            for element in subArr {
                switch element.isUppercase {
                case false:
                    setLower.insert(element)
                default:
                    setUpper.insert(element)
                }
            }
            
            if setUpper.count == setLower.count {
                var upperAsciiCumulated = 0
                var lowerAsciiCumulated = 0
                
                setLower.forEach { lowerAsciiCumulated += Int($0.asciiValue ?? 0) }
                for char in setUpper {
                    upperAsciiCumulated += Int(char.asciiValue ?? 0)
                }
                let diff = lowerAsciiCumulated - upperAsciiCumulated
                
                switch diff%32 {
                case 0:
                    let subStr = subArr.map {String.init($0)}.reduce("") {$0 + $1}
                    print(subStr)
                    return indexA
                default:
                    break
                }
            }
            //___________________________________________________
            // Initial approach, but relatively slower (by a lot haha)
            
            //            var setUpperToLower = Set<Character>()
            //            setUpper.forEach { setUpperToLower.insert(Character($0.lowercased())) }
            //            switch setUpperToLower == setLower {
            //            case true:
            //                 fragmentLengthArr.append(indexA)
            //                print(String(subArr))
            ////                breakIt = !breakIt   //对于Big(o)蛮重要的一行
            //                return indexA
            //            default:
            //                break
            //            }
            //________________________________________________
        }
        indexA += 1
    }
    
    return -1
    // fragmentLengthArr.isEmpty ? -1 : (fragmentLengthArr.min() ?? -1)
}



// MARK: - Dec 6th

// Find the max sum of numbers on consecutive indices.
// array = new Integer[] {-5, 2, 2, 3, 4, -7, -3, 120}; // 121
// array = new Integer[] {-5, 1, 2, 3, 4, 5, 6, -10, -5, 100}; // 106
// array = new Integer[] {1, 2, 3, 4, 5, 6, 7, 8}; // 36
// array = new Integer[] {-5, 1, 2, 3, 4, -10}; //10
// array = new integer[] {-10, 2, 1, -1,-5} // 3 */

private func maxiSummationFinder(arr: Array<Int>) -> Int {
    let leng = arr.count
    guard !arr.isEmpty else { return 0 }
    guard leng > 1 else { return arr[0] }
    let experimentedsum = arr.reduce(0) { $0 + $1 }
    print(experimentedsum)
    var currentSum = 0
    var ultimateSum = Int.min
    for element in arr {
        currentSum += element
        switch ultimateSum {
        case let self where self < currentSum:
            ultimateSum = currentSum
        default:
            ()
        }
        switch currentSum {
        case let cself where cself < 0:
            currentSum = 0
        default:
            break
        }
    }
    return ultimateSum
}

maxiSummationFinder(arr: [-5, 2, 2, 3, 4, -7, -3, 120])
maxiSummationFinder(arr: [-5, 1, 2, 3, 4, 5, 6, -10, -5, 100])
maxiSummationFinder(arr: Array(arrayLiteral: -10, 2, 1, -1,-5))

// MARK: - Dec 23th
// All occurences of "a" need to precede all occurences of "b" (easy peezy)

private func abOccurences(targetStr: String) -> Bool {
    let targetArr = Array(targetStr)
    var aIndexes : [Int] = []
    var bIndexes: [Int] = []
    for index in 0...targetArr.count - 1 {
        let element = String(targetArr[index])
        switch element {
        case "b":
            bIndexes.append(index)
        case "a":
            aIndexes.append(index)
        default:
            print(aIndexes, bIndexes) // never gon be here tho
        }
    }
    let aHigh = aIndexes.max() ?? 0
    let bLow = bIndexes.min() ?? targetArr.count
    return (aHigh<=bLow)
}
