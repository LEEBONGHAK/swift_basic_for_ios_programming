/* 함수 고급 */

import Swift

// MARK: - 매개변수 기본값

// 매개변수에 기본적으로 전달될 값을 미리 지정해 줄 수 있다.
// 기본값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋다.
/*
    func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수 기본값, ...) -> 반환타입 {
        함수 구현부
        return 반환값
    }
*/
func greeting(friend: String, me: String = "bonghak") {
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 생략 가능
greeting(friend: "name")
greeting(friend: "brizo", me: "kim")


// MARK: - 전달인자 레이블

/*
    전달인자 레이블은 함수를 호출할 때 매개변수의 역할을 좀 더 명확하게 하거나함수 사용자의 입장에서 표현하고자 할 때 사용한다.
    전달인자 레이블은 변경하여 동일한 이름의 함수를 중복으로 생성가능하다.
*/
/*
    func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입, ...) -> 반환타입 {
        함수 구현부
        return 반환값
    }
*/

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용한다.
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 한다.
greeting(to: "brizo", from: "kim")


// MARK: - 가변 매개변수

// 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있다.
// 가변 매개변수는 함수당 하나만 가질 수 있다.
// 기본값이 있는 매개변수와 같이 가변 매개변수 역시 매개변수 목록 중 뒤쪽에 위지하는 것이 좋다.
/*
    func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
        함수 구현부
        return 반환값
    }
*/
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}
print(sayHelloToFriends(me: "bonghak", friends: "lee", "kim", "park"))
// Hello ["lee", "kim", "park"]! I'm bonghak!

print(sayHelloToFriends(me: "bonghak"))
// Hello []! I'm bonghak!


// MARK: - 데이터 타입으로서의 함수

/*
    스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이다.
    스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고 매개변수를 통해 전달핤 수도 있다.
*/

// MARK: - 함수의 타입표현

// 반환타입을 생략할 수 없다.
// (매개변수1타입, 매개변수2타입, ...) -> 반환타입
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("brizo", "lee")

someFunction = greeting(friend:me:)
someFunction("brizo", "lee")

// 타입이 다른 함수는 할당할 수 없다.
//someFunction = sayHelloToFriends(me:friends:)     // error

func runAnother(function: (String, String) -> Void) {
    function("bonghak", "lee")
}

runAnother(function: greeting(friend:me:))
runAnother(function: someFunction)