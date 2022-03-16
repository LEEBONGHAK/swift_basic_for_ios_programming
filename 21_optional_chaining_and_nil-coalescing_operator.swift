/* 옵셔널 체이닝과 nil 병합 연산자 - optional chaining and nil-coalescing operator */

/*
    옵셔널 체이닝

    - 옵셔널 체이닝은 옵셔널의 내부의 내부의 내부로 옵셔널이 연결되어 있릉 때 유용하게 활용 가능
    - nil 확인을 하지 않고 최종적으로 원하는 값이 있는지 없는지 확인 가능
*/

import Swift

class Person {
    var name: String
    var job: String?
    var home: Apartment?

    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?

    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let bonghak: Person? = Person(name: "bnnghak")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로 결과 타입도 옵셔널

// 만약 우리집의 경비원의 직없이 궁금하다면...?
// 옵셔널 체이닝을 사용하지 않는다면...
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직없은 \(guardJob)입니다.")
                } else {
                    print("우리집 경비원의 직업이 없어요")
                }
            }
        }
    }
}
guarJob(owner: bonghak)

// 옵셔널 체이닝을 사용핟다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    } else {
        print("우리집 경비원은 직없이 없어요")
    }
}
guardJobWithOptionalChaining(owner: bonghak)


bonghak?.home?.guard?.job       // nil

bonghak?.home = apart
bonghak?.home   // Optional(Apartment)
bonghak?.home?.guard    //nil

bonghak?.home?.guard = superman
bonghak?.home?.guard    // Optional(Person)
bonghak?.home?.guard?.name  // superman
bonghak?.home?.guard?.job   // nil


/*
    nil 병합 연산자

    - 중위 연산자 입니다. : ??
    - Optional ?? Value
    - 옵셔널 값이 nil일 경우, 우측의 값을 반환
    - 띄어쓰기 주의!
*/
var guardJob: String

bonghak?.home?.guard?.job = "경비원"
guardJob = bonghak?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 경비원

bonghak?.home?.guard?.job = nil
guardJob = bonghak?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨