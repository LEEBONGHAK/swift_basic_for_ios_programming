/* 옵셔널 - Optional */

import Swift

/*
    Optional
    - 값이 있을 수도, 없을 수도 있음을 표현
    - nil이 할당 될 수 있는지 없는지 표현

    Optional이 필요한 이유
    - nil의 가능성을 명시적 표현
    - 즉, nil의 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능해 문서/주석 작성 시간을 절약할 수 있다.
    - 전달 받은 값이 옵셔널이 아니라면 nil 체크를 하지 않더라도 안심하고 사용할 수 있어 효율적이고 예외 상황을 최소화하는 안전한 코딩을 할 수 있다.
*/
// someOprionLParam에 nil이 할당 될 수 있다.
func someFunction(someOptionalParam: Int?) {
    // ...
}

// someParam에 nil이 할당 될 수 없다.
func someFunction(someParam: Int) {
    // ...
}

someFunction(someOptionalParam: nil)
//someFunction(someParam: nil)


// enum + general = optional
enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
}

let optionalValue: Optional<Int> = nil
let optionalValue: Int? = nil


// Implicitly Unwrapped Optional - 암시적 추출 옵셔널 (!)
var optionalValue: Int! = 100

switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
optionalValue = optionalValue + 1
// nil 할당 가능
optionalValue = nil
// 잘못된 접근으로 인한 런타임 오류 발생
//optionalValue = optionalValue + 1


// 물음표(?)를 이용한 옵셔널
var optionalValue1: Int? = 100

switch optionalValue1 {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
}

// nil 할당 가능
optionalValue1 = nil
// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산 불가
//optionalValue1 = optionalValue1 + 1