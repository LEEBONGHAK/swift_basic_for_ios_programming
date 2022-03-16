/* 타입 캐스팅 - type casting */

/*
    스위프트 타입 캐스팅

    - 인스턴스의 타입을 확인하는 용도
    - 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도
    - is, as 사용

    * 형변환 (ex. let someDouble = Double(2))은 타입 캐스팅이 아닌 새로운 값을 생성하는 것
*/

import Swift

/*
// 타입 캐스팅이 아닌 더블 타입의 인스턴스를 새로 생성하는 것
let someInt: Int = 100
let someDouble: Double = Double(someInt)
*/

// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String

    func breath() {
        print("숨을 쉽니다.")
    }
}

class Student: Person {
    var school: String = ""

    func goToSchool() {
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""

    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!!")
    }
}

var bonghak: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()


// MARK: - 타입 확인
// is를 사용해 타입을 확인
var result: Bool

result = bonghak is Person  // true
result = bonghak is Student // false
result = bonghak is UniversityStudent   // false

result = hana is Person  // true
result = hana is Student // true
result = hana is UniversityStudent   // false

result = jason is Person  // true
result = jason is Student // true
result = jason is UniversityStudent   // true

if bonghak is UniversityStudent {
    print("bonghak은 대학생입니다.")
} else if bonghak is Student {
    print("bonghak은 학생입니다")
} else if bonghak is Person {
    print("bonghak은 사람입니다.")
}   // bonghak은 사람입니다.

switch jason {
    case is Person:
        print("person")
    case is Student:
        print("student")
    case is UniversityStudent:
        print("university student")
    default:
        print("no person, no student, no university student")
}   // person


switch jason {
    case is UniversityStudent:
        print("university student")
    case is Person:
        print("person")
    case is Student:
        print("student")
    default:
        print("no person, no student, no university student")
}   // university student


// MARK: - 업 캐스팅

/*
    - as 를 사용해 부모 클래스의 인스턴스로 사용할 수 있도록 커마일러에게 타입 정보를 전환
    - Any 호는 AnyObject로도 타입 정보 변환 가능
    - 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략 가능
    - 믾이 사용하진 않음
*/
var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent   // 컴파일 오류
var jina: Any = Person()    // as Any 생략 가능


// MARK: - 다운 캐스팅

// as? 또는 as!를 사용해 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환

/*
    조건부 다운 캐스팅
    - as? 사용
    - 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 nil을 반환하기 때문에 결과의 타입은 옵셔널 타입
*/
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudnet
optionalCasted = jenny as? UniversityStudent    // nil
optionalCasted = jina as? UniversityStudent     // nil
optionalCasted = jina as? Student   // nil

/*
    강제 다운 캐스팅
    - as! 사용
    - 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 '런타임 오류'가 발생
    - 캐스팅에 성공하면 옵셔널이 아닌 일반 타일을 반환
*/
var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
//forcedCasted = jenny as? UniversityStudent    // 런타임 오류
//forcedCasted = jina as? UniversityStudent     // 런타임 오류
//forcedCasted = jina as? Student   // 런타임 오류

// 활용
func doSomethingWithSwith (someone: Person) {
    switch someone {
        case is UniversityStudent:
            (someone as! UniversityStudent).goToMT()
        case is Student:
            (someone as! Student).goToSchool()
        cas is Person:
            (someone as! Person).breath()
    }
})

doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: jenny) // 등교를 합니다
doSomethingWithSwitch(someone: yagom) // 숨을 쉽니다

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let sudent = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: yagom) // 숨을 쉽니다