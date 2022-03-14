/* 콘솔로그와 문자열 보간법 */

 /*
    String Interpolation
    - 프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용
    - \()
 */

 import Swift

let age: Int = 10

"안녕하세요! 저는 \(age)살 입니다"
// == "안녕하세요! 저는 10살 입니다"

"안녕하세요! 저는 \(age + 5)살 입니다"
// == "안녕하세요! 저는 15살 입니다"

print("안녕하세요 저는 \(age + 5)살입니다")

print("\n########################\n")


class Person {
   var name: String = "bonghak"
   var age: Int = 10
}

let bonghak: Person = Person()

print(bonghak)

print("\n########################\n")

dump(bonghak)
