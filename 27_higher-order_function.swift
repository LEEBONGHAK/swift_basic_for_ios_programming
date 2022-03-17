/* 고차 함수 - higher-order function */

/*
    - 고차 함수 (Higher-order function)는 '다른 함수를 전달인자로 받거나 함수 실행의 결과를 함수로 반환하는 함수'를 뜻한다.
    - 스위프트의 함수(클로저)는 일급시민(일급객체)이기 때문에 함수의 전달인자로 전달할 수 있으며, 함수의 결과값으로 반환할 수 있다.
*/

import Swift

// MARK: - map
// 컨테이너 내부의 기준 데이터를 변형(transform)하여 새로운 컨테이너를 생성

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

// 기존의 for 구문
doubleNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)  // ["0", "1", "2", "3", "4"]

// map 메서드 사용
doubledNumbers = numbers.map({ (number: Int) -> Int in 
    return number * 2
})

strings = numbers.map({ (number: Int) -> Int in
    return "\(number)"
)})

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)  // ["0", "1", "2", "3", "4"]

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
doubledNubmers = numbers.map { $0 * 2 }
print(doubledNumbers)   // [0, 2, 4, 6, 8]


// MARK: - filter
// 컨테이너 내부의 값을 걸러서 새로운 켄테이너로 추출

// 기존의 for 구문 사용
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered) // [0, 2, 4]

// filter 메서드 사용
let evenNumbers: [Int] = number.filter { (nubmer: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)  // [0, 2, 4]

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
let oddNumbers: [Int] = numbers.filter { $0 % 2 != 0 }
print(oddNumbers)   // [1, 3]


// MARK: - reduce
// 컨테이너 내부의 콘텐츠를 하나로 통합

// 기존의 for 구문 사용
var result: Int = 0

for number in someNumbers {
    result += number
}

print(result)   // 25

// reduce 메서드 사용
let sum: Int = someNumbers.reduce(0, {first: Int, second: Int) -> Int in
    return first + second
})
print(sum)

var subtract: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first - second
})
print(subtract) // -25


let sumFromThree = someNumbers.reduce(3) { $0 + $1 }
print(sumFromThree) // 28

print(someNumbers.reduce(1) { $0 * $1 })    // 240