/* 컬렉션 타입 - collection type */
/* Array, Dictionary, Set */

import Swift

/*
    Array - 순서가 있는 리스트 컬렉션
    Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
    Set - 순서가 없고, 멤버가 유일한 컬렉션(중복되지 않음)
*/

// MARK: - Array
var integers: Array<Int> = Array<Int>() // 빈 Int Array 생성 []
integers.append(1)  // [1]
integers.append(100)    // [1, 100]
//integers.append(101.1)    // error

integers.contains(100)  // true
integers.contains(99)   // false

integers.remove(at: 0)  // 1 제거
integers.removeLast()   // 마지막 elemet 제거
integers.removeAll()    // 모든 element 제거

integers.count  // element 개수

//integers[0]   // error - 비어 있기 때문에

// Array<Double>과 [Double]은 동일한 표현
var doubles: Array<Double> = [Double]()
var strings: [String] = [String]()
var characters: [Character] = []

// let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1, 2, 3]
//immutableArray.appent(4)      // error
//immutableArray.removeAll()    // error


// MARK: - Dictionary
var anyDictionary: Dictionary<String, Any> = [String: Any]()    // Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
anyDictionary

anyDictionary["someKey"] = "dictionary"
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey")    // 하딩 키의 값 제거
anyDictionary["someKey"] = nil  // 하딩 키의 값 제거
anyDictionary

let emptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name": "bonghake", "gender": "male"]

//let someValue: String = initalizedDictionary["name"]  // 해당 key에 value가 존재하는 것이 보장되지 않기 때문에 error


// MARK: - Set
var integerSet: Set<Int> = Set<Int>()   // 축약 문법이 없음
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)
integerSet  // {100, 99, 1} - 순서가 보장되지 않는다.

integerSet.contains(1)  // true
integerSet.contains(2)  // false

integerSet.remove(100)
integerSet.removeFrist()    // 가장 처음 element 제거

integerSet.count

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = SetA.union(setB)  // 합집합
let sortedUnion: [Int] = union.sorted()
let intersection: Set<Int> = setA.intersection(setB)    // 교집합
let subtracting: Set<Int> = setA.subtracting(setB)  // 차집합