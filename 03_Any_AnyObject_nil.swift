/* Any, AnyObject, nil */

import Swift

/*
    Any - Swift의 모든 타입을 지칭하는 키워드
    AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
    nil - 없음을 의미하는 키워드 (다른 언어의 NULL, Null, null 등과 유사한 표현)
*/

// MARK: - Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능하다"
someAny = 123.12
someAny = true
someAny = "하"

//let someCharacter: Character = someAny    // error (서로 다른 타입이기 때문에)


// MARK: - AnyObject
class SomeClass {}

var someAnyObject: AnyObject = SomeClass()
//someAnyObject = 123.12    // error


// MARK: - nil
//someAny = nil         // error
//someAnyObject = nil   // error


/*
    1. 사람이 사용하는 숫자 '0'은 '없음'이라는 의미를 갖고 있다. 프로그래밍에서 0은 없을을 나타낼 수 있나?
    - 조건문 등을 통해 0을 '없음'을 표현하는 state로 만들 수 있지만 결국 Int나 Float의 0이다.

    2. 0이 있는데 nil이라는 표현은 왜 존재할까?
    - 사람은 문맥에 따라 0이라는 단어를 '없을'으로 이해할 수도 '0이라는 숫자'라고 이해할 수도 있다.
    하지만 모든 것이 명확해야하는 컴퓨터에서는 '0'이라는 것은 '0이라는 숫자'를 위한 reserved word로 사용되어야 하고, '없음'을 나타내는 별개의 표현이 필요하기 때문에 nil이라는 표현이 필요하다.
*/