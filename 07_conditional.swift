/* 조건문 */

import Swift

let someInteger = 100

// MARK: - if-else
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