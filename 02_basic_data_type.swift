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

// Bool
var someBool: Bool = true
someBool = false
//someBool = 0  // error (Int 로 인식됨)
//someBool = 1  // error (Int 로 인식됨)

// Int
var someInt: Int = -100
//someInt = 100.1   // error

// UInt
var someUInt: UInt = 100
//someUInt = -100   // error
//someUInt = someInt    // error

// Float
var someFloat: Float = 3.14
someFloat = 3   // OK

// Double
var someDouble: Double = 3.14
someDouble = 3  // OK
//someDouble = someFloat    // error

// Character
var someCharacter: Character = "🇰🇷"   // unicode로 표현할 수 있는 모든 문자 가능
someCharacter = "😄"
someCharacter = "가"
someCharacter = "A"
//someCharacter = "하하하"  // error
print(someCharacter)

// String
var someString: String = "하하하 😄 "
someString = someString + "웃으면 복이 와요"
print(someString)
//someString = someCharacter    // error