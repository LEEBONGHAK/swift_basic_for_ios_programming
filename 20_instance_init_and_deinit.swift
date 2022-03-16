/* 
    인스턴스의 생성과 소멸 

    - 프로퍼티 초기값
    - 이니셜라이저 init
    - 디이니셜라이저 deinit
*/

import Swift

// MARK: - 프로퍼티 초기값

// 스위프트의 모든 인스턴스 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다.
// 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 된다.
class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당 - 필수
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let jason: PersonA = PersonA()
json.name = "jason"
jason.age = 30
jason.nickName = "j"


// MARK: - 이니셜라이저

// 프로퍼티 초기값을 지정하기 어려운 경우에는 이니셜라이저 init을 통해 인스턴스가 가져야할 초기값을 전달할 수 있다.
class PersonB {
    var name: String
    var age: Int
    var nickName: String

    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")
//let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "")  // 다채울 필요가 없을 때 애매함


// MARK: - 프로퍼의 초기값이 꼭 필요 없을 때

// 옵셔널 사용
// class 내부의 init을 사용할 때는 convenience 키워드 사용
class PersonC {
    var name: String
    var age: Int
    var nickName: String?

    convenience init(name: String, age: Int, nickName: String) {
        // self.name = name
        // self.age = age
        self.init(name: name, age: age)
        self.nickName = nickName
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 25, nickName: "m")

// 암시적 추출 옵셔널읜 인스튼스 사용에 꼭 필요하지만 초기값을 할당할지 않고자 할 때 사용
class Puppy {
    var name: String
    var owner: PersonC! // 꼭 필요하지만 init을 사용하기 어려워 다중에 넣어 주겠다!

    init(name: String) {
        self.name = name
    }

    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다.")
    }
} 

let happy: Puppy = Puppy(name: "happy")
//hppy.goOut()  // owner가 초기화되지 않아 오류
happy.owner = jenny
happy.goOut()


// MARK: - 실패 가능한 이니셜라이저

/*
    - 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있다.
    - 인스턴스 생성에 실패하면 nil 반환
    - 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입
    - init? 사용
*/
class PersonD {
    var name: String
    var age: Int
    var nickName: String?

    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }

        if name.characters.count == 0 {
            return nil
        }

        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)    // error
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batmen: PersonD? = PersonD(name: "", age: 23)

print(joker)    // nil
print(batmen)   // nil


// MARK: - 디이니셜라이저

/*
    - deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출
    - 인스턴스가 해제되는 시점에 해야할 일을 구현 가능
    - deinit은 매개변수를 진닐 수 없음
    - 자동으로 호출되기 때문에 직접 호출 불가
    - 디이니셜라이저는 클래스 타입에만 구현 가능
    - 인스턴스가 메머리에서 해제된느 시점은 ARC(Autometic Reference Counting)의 규칭에 따라 결정
    - ARC 문서 : https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
*/
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC

    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }

    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil    // donalld 인스턴사가 더이상 필요 없으므로 메모리에서 해제된다. -> deinit 호출
// donald가 jenny에게 happy를 인도합니다.