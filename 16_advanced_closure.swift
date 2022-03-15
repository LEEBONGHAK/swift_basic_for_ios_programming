/* 클로저 고급 */

/*
    클로저는 아래 규칠을 통해 다양한 모습으로 표현 가능
    
    1. 후행 클로저: 함수의 매개변수 마지막으로 전달되는 클로저는 후행클로저(trailing closure)로 함수 밖에 구현할 수 있다.
    2. 반환타입 생량: 컴파일러가 클로저의 타입을 유추할 수 있는 경우 매개변수, 반환 타입 생략 가능
    3. 단축인자 이름: 전달인자의 이름이 굳이 필요없고, 컴파일러가 타입을 유추할 수 있는 경우 축약된 전달인자 이름($0, $1, $2, ...)을 사용 가능
    4. 암시적 반환 표현: 반환 값이 있는 경우, 암시적으로 클로저의 맨 마지막 줄은 return 키워드를 생략하더라도 반환 값으로 취급
*/

import Swift

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var result: Int

// MARK: - 후행 클로저
// 클로저가 함수의 마지막 전달인자라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현 가능
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left * right
}
print(result)   // 100


// MARK: - 반환타입 생략
// calculate 함수의 method 매개변수는 Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에 굳이  클로저에서 반환 타입을 명시해 주지 않아도 된다.
// 대신 in 키워드는 생략 불가능
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in
    return left + right
})
print(result)   // 20

// 후행 클로저와 함께 사용 가능
result = calculate(a: 10, b: 10) { (left: Int, right: Int) in
    return left + right
}
print(result)   // 20


// MARK: - 단축 인자 이름
// 클로저의 매개 변수 이름이 굳이 불필요하다면 단축 인자 이름을 활용 가능
// 단축 인자 이름은 클로저의 매개변수의 순서대로 $0, $1, $2, ... 처럼 표현
result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})
print(result)   // 20

// 후행 클로저와 함께 사용 가능
result = calculate(a: 10, b: 10) {
    return $0 + $1
}
print(result)   // 20


// MARK: - 암시적 반환 표현
// 클로저가 반환하는 값이 있다면 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급
result = calculate(a: 10, b: 10) {
    $0 + $1
}
print(result)

// 한 줄로도 표현 가능
result = calculate(a: 10, b: 10) { $0 + $1 }
print(result)