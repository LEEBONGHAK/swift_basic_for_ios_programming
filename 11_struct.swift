/* 구조체 - struct */

import Swift

/*
    구조체란?

    - 스위프트 대부분 타입은 구조체로 이루어져 있다.
    - 구조체는 값(value) 타입이다.
    - 타입 이름은 대문자 카멜케이스를 사용하여 정의한다.
*/

// MARK: - 정의

/*
    struct 이름 {
        /* 구현부 */
    }
*/


// MARK: - 프로퍼티 및 메서드

/*
    프로퍼티(property) - 구조체 안에 들어가는 인스턴스 변수
    메서드(method) - 구조체 안에 들어있는 함수
*/
struct Sample {
    var mutableProperty: Int = 100  // 가변 프로퍼티
    let immutableProperty: Int = 100    //불변 프로퍼티

    static var typeProperty: Int = 100  // 타입 프로퍼티

    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }

    // 타입 메서드
    static func typeMethod() {
        print("type method")
    }
}


// MARK: - 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()

mutable.mutableProperty = 200
//mutable.immutableProperty = 200   // error

// 불변 인스턴스
let immutable: Sample = Sample()
//immutable.mutableProperty = 200   // error
//immutable.immutableProperty = 200 // error

// 타입 프로퍼티 및 메서드 - 타입 자체가 사용할 수 있는 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

//mutable.typeProperty = 400    // error
//mutable.typeMethod()          // error


// MARK: - 학생 구조체

struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"

    static func selfIntroduce() {
        print("학생 타입입니다.")
    }

    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce() // 학생 타입입니다.

var bonghak: Student = Student()
bonghak.name = "bonghak"
bonghak.class = "스위프트"
bonghak.selfIntroduce()     // 저는 스위프트반 bonghak입니다.

// 불변 인스턴스 생성
let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//jina.name = "jina"

// 하지만 인스턴스 메서드는 여전히 사용 가능
jina.selfIntroduce()    // 저는 Swift반 unknown입니다.