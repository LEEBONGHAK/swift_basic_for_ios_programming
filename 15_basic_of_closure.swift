/* 클로저 - closure */

import Swift

/*
    클로저(closure)

    - 클로저는 실행가능한 코드 블럭
    - 함수와 다르게 이름정의는 필요하지는 않지만, 매개변수 전달과 반환값이 존재할 수 있다.
    - 함수는 이름이 있는 클로저
    - 일급객체로 전달인자, 변수, 상수 등에 저장 및 전달 가능
*/

// MARK: - 정의
/*
    {(매개변수 목록) -> 반환타입 in
        실행 코드
    }
*/

// 함수를 사용한다면
func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)
print(sumResulst)   // 3

// 클로저의 사용
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in 
    return a + b 
}

sumResult = sum(1, 2)
print(sumResult)    // 3

// 함수는 클로저의 일종이므로 sum 변수에는 당연히 함수도 할당 가능
sum = sumFunction(a:b:)

sumResult = sum(1, 2)
print(sumResult)    // 3


// MARK: - 함수의 전달인자로서의 클로저
/*
    - 클로저는 주로 함수의 전달인자로 많이 사용됨
    - 함수 내부에서 원하는 코드 블럭을 실행 가능
*/
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) -> Int in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int -> Int)) -> Int {
    return method(a, b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)
print(calculated)   // 60

calculated = calculate(a: 50, b: 10, method: substract)
print(calculated)   // 40

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)   // 5

calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})
print(calculated)   // 500