/* 조건문 */

import Swift

let someInteger = 100

// MARK: - if-else

/*
    - if만 단독으로 사용해도 되고, else, else if 와 조합하여 사용 가능
    - if 뒤의 조건 값에는 Bool타입의 값만 위치해야 한다.
    - 조건을 감싸는 소괄호()는 선택 사항
*/
/*
    if condition {
        statements
    } else if condition {
        statements
    } else {
        statements
    }
*/
if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
}

// 스위프트의 조건에는 항상 Bool 타입이 들어와야 한다.
// someInteger는 Bool 타입이 아닌 Int 타입이기 때문에 'if someInteger {}'은 컴파일 에러


// MARK: - switch
/*
    - 기본적으로 사용하던 정수타입의 값만 비교하는 것이 아닌 대부분의 스위프트 기본 타입을 지원하며, 다양한 패턴과 응용이 가능
    - 스위프트의 다양한 패턴은 https://docs.swift.org/swift-book/index.html 에서 확인 가능
    - 각각의 case 내부에는 실행가능한 코드가 반드시 위치해야 한다.
    - 매우 한정적인 값(ex. enum의 case 등)이 비교값이 아닌 한 default 구문은 반드시 작성해야 한다.
    - 쉼표(,)를 사용해 하나의 case에 여러 패턴을 명시할 수 있다.
*/
/*
    switch value {
        case pattern:
            code
        default:
            code
    }
*/

// 범위 연산자를 활용하면 더욱 쉽고 유용하다.
switch someInteger {
    case 0:
        print("zero")
    case 1..<100:
        print("1~99")
    case: 100
        print("100")
    case: 101...Int.max:
        print("over 100")
    default:
        print("unknown")
}

// 정수 외의 대부분의 기본 타입을 사용할 수 있다.
switch  "bonghak" {
    case "jake":
        print("jake")
    case "mina":
        print("mina")
    case "bonghak":
        print("bonghak")
    default:
        print("unknown")
}

// default는 꼭 작성해야 한다.
// 명시적으로 break를 써주지 않아도 된다. (자동으로 걸림)\
// 자동으로 break가 걸리지 않게 하려면 fallthrough를 명시적으로 적어주어야 한다.