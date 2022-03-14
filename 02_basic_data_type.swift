/* 기본 데이터 타입 */

import Swift

/*
    Swift의 기본 데이터 타입

    - Bool
    - Int
    - UInt
    - Float
    - Double
    - Character
    - String
*/

// Bool - true와 flase만을 값으로 가지는 타입
var someBool: Bool = true
someBool = false
//someBool = 0  // error (Int 로 인식됨)
//someBool = 1  // error (Int 로 인식됨)

// Int - 정수 타입. 현재는 기본적으로 64비트 정수형
var someInt: Int = -100
//someInt = 100.1   // error

// UInt - 양의 정수 타입, 현재는 기본적으로 64비트 양의 정수형
var someUInt: UInt = 100
//someUInt = -100   // error
//someUInt = someInt    // error

// Float - 실수 타입, 32비트 부동소수형
var someFloat: Float = 3.14
someFloat = 3   // OK

// Double - 실수 타입, 64비트 부동소수형
var someDouble: Double = 3.14
someDouble = 3  // OK
//someDouble = someFloat    // error

// Character - 문자 타입, 유니코드 사용, 큰따음표("") 사용
var someCharacter: Character = "🇰🇷"   // unicode로 표현할 수 있는 모든 문자 가능
someCharacter = "😄"
someCharacter = "가"
someCharacter = "A"
//someCharacter = "하하하"  // error
print(someCharacter)

// String - 문자 타입, 유니코드 사용, 큰따음표("") 사용
var someString: String = "하하하 😄 "
someString = someString + "웃으면 복이 와요"
print(someString)
//someString = someCharacter    // error