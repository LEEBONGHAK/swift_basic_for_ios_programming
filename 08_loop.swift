/* 반복문 */

import Swift

var integer = [1, 2, 3]
let people = ["bonghake": 10, "eric": 15, "mike": 12]

// MARK: - for-in

// 기존 언어의 for-each 구문과 유사
/*
    for item in items {
        code
    }
*/
for integer in integers {
    print(integer)
}

//Dictionary의 item은 key와 value로 구성된 튜플 타입입니다.
for (name, age) in people {
    print("\(name): \(age)")
}


// MARK: - while

/*
    while condition {
        code
    }
*/
while integers.count > 1 {
    integers.removeLast()
}


// MARKS: - repeat-while

// - 기존 언어의 do-while 구문과 형태/동작이 유사
/*
    repeat {
        code
    } while condition
*/
repeat {
    integers.removeLast()
} while integers.count > 0