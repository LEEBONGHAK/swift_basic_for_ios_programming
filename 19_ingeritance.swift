/* 상속 - inheritance */

/*
    스위프트 상속

    - 상속은 클래스, 프로토콜 등에서 가능
    - 열거형, 구조체는 상속 불가
    - 스위프트의 클래스는 단일 상속으로, 다중 상속 지원하지 않음
*/

import Swift

// MARK: - 클래스의 상속과 재정의
/*
    class 이름: 상속받을 클래스 이름 {
        /* 구현부 */
    }
*/
class Person {
    var name: String = ""

    func selfIntrodue() {
        print("저는 \(name)입니다.")
    }

    // final 키워드를 사용하여 재정의를 방지
    final func sayHello() {
        print("hello")
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

    // 재정의 가능한 class 메서드라도 final 키워드를 사용하면 재정의 할 수 없다.
    // 메서드 앞의 'static'과 'final class'는 같은 역할
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

class Student: Person {
    //var name: String = "" // 상속을 받은 상태이기 때문에 오류 발생
    var major: String = ""

    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다.")
    }

    override class func classMethod() {
        print("overriden type method - class")
    }

    // static을 사용한 타입 메서드는 재정의 불가
    //override static func typeMethod() {}

    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 불가
    //override func sayHello() {}
    //override class func finalClassMethod() {}
}

let bonghak: Person = Person()
let hana: Student = Student()

bonghak.name = "bonghak"
hana.name = "hana"
hana.major = "Swift"

bonghak.selfIntroduce()
hana.selfIntroduce()

Person.classMethod()
Person.typeMethod()
Person.finalClassMethod()

Student.classMethod()
Student.typeMethod()
Student.finalClassMethod()