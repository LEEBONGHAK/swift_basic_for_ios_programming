/* 익스텐션 - extension */

/*
    익스텐션
    - 익스텐션(Extension)은 스위프트의 강력한 기능 중 하나
    - 익스텐션은 '구조체, 열거형, 프로토콜 타입에 새로운 기능 추가' 가능
    - 기능을 추가하려는 타입의 소스 코드를 알지 못하거나 볼 수 없다 해도, 타입만 알고 있다면 그 타입의 기능을 확장할 수도 있다.

    << 스위프트의 익스텐션이 타입에 추가할 수 있는 기능 >>
    - 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
    - 타입 메서드 / 인스턴스 메서드
    - 이니셜라이저
    - 서브스크립트
    - 중첩타입
    - 특정 프로토콜을 준수할 수 있도록 기능 추기
    ** 익스텐션ㄴ은 타입에 새로운 기능을 추가할 수 있지만, 기존에 존재하는 기능을 '재정의할 수 없다.'

    << 클래스의 상속과 익스텐션 비교 >>
    클래스 상속
    - 클래스 타입에서만 가능
    - 특정 타입을 물려받아 하나의 새로운 타입을 정의하고 추가 기능을 구현하는 수직 확장
    - 상속을 받으면 기존 기능 재정의 가능

    익스텐션 상속
    - 구조체, 클래스, 프로토콜 등에 적용 가능한 상속
    - 기존의 타입에 기능을 추가하는 수평 확장
    - 상속을 받으면 기존의 기능을 재정의 불가능

    << 익스텐션 활용 >>
    - 외부에서 가져온 타입에 내가 원하는 기능을 추가하고자 할 때 사용
    - 따로 상속을 받지 않아도 되고, 구조체와 열거형에도 기능을 추가할 수 있다.
    - 모든 타입 즉, 구조체, 열거형, 프로토콜, 제네릭 타입 등에 적용 가능
    - 익스텐션을 통해 연산 프로퍼티, 메서드, 이니셜라이저, 서브스크립트, 중첩 데이터 타입 등 추가 가능
    - '프로토콜과 함께 사용'하면 매우 강격 -> 프로토콜 중심 프로그래밍(Protocol Oriented Programming)에 대해 더 알아보기  
*/

import Swift

// MAKR: - 정의 문법
/*
    extension 확장할 타입 이름 {
        /* 타입에 추가될 새로운 기능 구현 */
    }
*/

// 익스텐션은 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장도 가능
// 이 경우 클래스나 구조체에서 사용하ㅏ던 것과 같은 방법으로 프로토콜 이름 나욜
/*
    extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3, ... {
        /* 프로토콜 요구사항 구현 */
    }
*/

// MARK: - 익스텐션 구현

// 연산 프로퍼티 추가
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd)  // true
print(2.isOdd)  // false

var number: Int = 3
print(number.isEven)    // false
print(number.isOdd)     // true

number = 2
print(number.isEven)    // true
print(number.isOdd)     // false

// 메서드 추가
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}

print(3.multiply(by: 2))    // 6
print(4.multiply(by: 5))    // 20

number = 3
print(number.multiply(by: 2))   // 6
print(number.multiply(by: 3))   // 9

// 이니셜라이저 추가
extension String {
    init(int: Int) {
        self = "\(int)"
    }

    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(Int: 100)    // "100"
let stringFromDouble: String = String(Double: 100.0)    // "100.0"

// 익스텐션을 활용하면 다양하고 강력한 기능을 구현할 수 있지만, 해당 타입에 적합한 익스텐션을 구현하도록 주의