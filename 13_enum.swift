/* 열거형 - enum */

import Swift

// MARK: - 정의
/*
    열거형

    - 유사한 종류의 여러 값을 한 곳에 모아서 정의한 것
    - enum 자체가 하나의 데이터 타입으로, 대문자 카멜케이스를 사용하여 이름을 정의
    - 각 case는 소문자 카멜케이스로 정의
    - 각 case는 그 자체가 고유의 값이다 (각 case에 자동으로 정수값이 할당되지 않음)
    - 각 case는 한 줄에 개별로도, 한 줄에 여러 개도 정의 가능
*/
/*
    enum 이름 {
        case 이름1
        case 이름2
        case 이름3, 이름4, 이름5
        ...
    }
*/


// MARK: 열거형 사용

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue  // 타입이 명확할 경우, 열거형의 이름 생략 가능

print(day)

/*
    switch의 비교값에 열거형 타입이 위치할 때
    모든 열거형 케이스를 포함한다면 default를 작성할 필요가 없음
*/
switch day {
    case .mon, .tue, .wed, .thu:
        print("평일입니다.")
    case Weekday.fri:
        print("불금 파티!!!")
    case .sat, .sun:
        print("신나는 주말!!!")
}


// MARK: - 원시값

/*
    rawValue (원시값)

    - C 언어의 enum 처럼 정수 값을 가질 수 있다.
    - rawValue는 case 별로 각각 다른 값을 가져야 한다.
    - 자동으로 1이 증가된 값이 할당됨
    - rawValue를 반드시 지닐 필요가 없다면 굳이 안만들어도 됨
*/
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    //case mango = 0    // error
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")

// 정수 타입 뿐만 아니라, Hashable 프로토콜을 따르는 모든 타입을 원시값의 타입으로 지정 가능
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")    // School.middle.rawValue == 중등
print("School.university.rawValue == \(School.university.rawValue)")    // School.university.rawValue == university


// MARK: - 원시값을 통한 초기화

/*
    - rawValue를 통해 초기화 가능
    - rawValue가 case에 해당하지 않을 수 있으므로, rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입
*/

//let apple: Fruit = Fruit(rawValue: 0)   // error (not Optional type)
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다.")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
}


// MARK: - 메서드

// 스위프트의 enum에는 메서드도 추가 가능
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov

    func printMessage() {
        switch self {
            case .mar, .apr, .may:
            print("따스한 봄")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()