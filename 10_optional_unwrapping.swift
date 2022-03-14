/* 옵셔널 추출 - optional unwrapping */

import Swift

/*
    옵셔널 추출?
    - 옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 것

    옵셔널을 추출하는 방법
    1. Optional Binding - 옵셔널 바인딩
    2. Force Unwrapping - 강제 추출
*/


/*
    Optional Binding - 옵셔널 바인딩

    - nil 체크 + 안전한 추출
    - 옵셔널 안에 값이 들어있는지 확인하고 값이 있으면 값을 꺼내온다.
    - if-let 방식 사용
*/
func printName(_ name: String) {
    print(name)
}

var myNmae: String? = nil
//printName(myName)   // 전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생

// if-let 방식
if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

// 여러 옵셔널 변수들을 한번에 바인딩 가능
var name1: String? = "bonghak"
var name2: String? = nil

if let name = name1, let friend = name2 {
    print("\(name) and \(friend)")
} else {
    print("one of these is nil")
}

name2 = "hana"
if let name = name1, let friend = name2 {
    print("\(name) and \(friend)")
} else {
    print("one of these is nil")
}


/*
    Force Unwrapping - 강제 추출

    - 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식
    - 만약 값이 없을 경우(nil) 런타임 오류가 발생하기 때문에 추천되지 않는다.
*/
var forceName1: String? = "bonghak"
printName(forceName1!)
forceName1 = nil
//printName(forceName1!)     // 강제 추출 시 값이 없으므로 런타임 오류 발생

var forceName2: String! = nil
//printName(forceName2)       // nil 값이 전달되기 때문에 런타임 오류 발생