/* 프로퍼티 - Property */

/*
    프로퍼티의 종류

    - 저장 프로퍼티(stored property)
    - 연산 프로퍼티(computed property)
    - 인스턴스 프로퍼티(instance property)
    - 타입 프로퍼티(type property)
*/

import Swift

/*
    프로퍼티 정의와 사용
    
    - 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다.
    - 다만 열거형 내부에는 연산 프로퍼티만 구현 가능
    - 연산 프로퍼티는 var로만 선언 가능
    - 연산 프로퍼티를 읽기 전용으로 구현할 수 있지만, 쓰기 전용으로는 구현 불가능
    - 읽기 전용으로 구현하려면 get 블럭만 작성하면 됨. 읽기 전용은 get 블럭을 생략 가능
    - 읽기, 쓰기 모두 가능하게 하려면 get 블럭과 set 블럭을 모두 구현
    - set 블럭에서 암시적 매개변수 newValue 사용가능
*/

// MARK: - 정의
struct Student {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0

    // 인스턴스 연산 프로퍼티 - 값들을 연산해 주는 것
    var westernAge: Int {
        get {
            return koreanAge - 1
        }

        set (inputValue) {
            koreanAge = inputValue + 1
        }
    }

    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"

    /*
    // 인스턴스 메서드
    func selfintroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
    */

    // 읽기 전용 인스턴스 연산 프로퍼티
    var selfintroduce(): String {
        get{
            print("저는 \(self.class)반 \(name)입니다.")
        }
    }

    /*
    // 타입 메서드
    static func selfIntroduce() {
        print("학생 타입입니다.")
    }
    */

    // 일기 전용 타입 연산 프로퍼티
    // 읽기 전용에서는 get 생략 가능
    static var selfIntroduction: String {
        return "학생입니다."
    }
}


// MARK: - 사용

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)

// 인스턴스 생성
var bonghak: Student = Student()
bonghak.koreanAge = 27

// 인스턴스 저장 프로퍼티 사용
bonghak.name = "bonghak"
print(bonghak.name)

// 인스턴스 연산 프로퍼티 사용
print(bonghak.selfIntroduction)

print("제 한국 나이는 \(bonghak.koreanAge)살이고, 미국 나이는 \(bonghak.westernAge)살 입니다.")


// MARK: - 응용
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollor * currencyRate
        }
        set {
            dollor = newValue / currencyRate
        }
    }
}

var money = Money()

money.won = 11000
print(money.won)    // 11000

money.dollor = 10
print(money.won)    // 110000


// MARK: - 지역 변수, 전역 변수
/*
    저장 프로퍼티와 연산 프로퍼티의 기능은 함수, 메서드, 클로저, 타입 등의 외부에 위치한
    지역 변수, 전역 변수에도 모두 사용 가능하다.
*/

var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum)  // 300