/* 클래스 - class */

import Swift

/*
    클래스 - class

    - 클래스는 참조(reference) 타입이다.
    - 타입이름은 대문자 카멜케이스를 사용하여 정의한다.
    - 스위프트의 클래스는 다중 상속이 되지 않는다.
*/


// MARK: - 정의

/*
    class 이름 {
        /* 구현부 */
    }
*/


// MARK: 프로퍼티 및 메서드

class Sample {
    var mutableProperty: Int = 100  // 가변 프로퍼티
    let immutableProperty: Int = 100    // 불변 프로퍼티

    static var typeProperty: Int = 100  // 타입 프로퍼티

    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }

    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }   

    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}


// MARK: - 클래스 사용
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
//mutalbeReference.immutableProperty = 200  // error

let immutableReference: Sample = Sample()

immutableReference.mutableProperty = 200
//immutalbeReference.immutableProperty = 200    // error


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

//mutableReference.typeProperty = 300   // error
//mutableReference.typeMethod() //error


// MARK: - 학생 클래스

class Student {
    var name: String = "unknown"
    var `class`: String = "Swift"

    class func selfIntroduce() {
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

let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce()   // 저는 Swift반 jina입니다.