/* 프로퍼티 감시자 - property observer */

/*
    프로퍼티 감시자

    - 프로퍼티 감시자를 사용하면 프로퍼티의 값이 변경될 때 원하는 동잘 수행 가능
    - 값이 변경되기 직전에 willSet 블럭이, 값이 변경된 직후에 didSet 블러이 호출됨
    - 둘 중 필요한 하나만 구현해 주어도 무관
    - 변경되려는 값이 기존값고 같더라도 프로퍼티 감시자는 항상 동작
    - willSet 블럭에서는 암시적 매개변수 newValue를, didSet 블럭에서는 oldValue를 사용 가능
    - 프로퍼티 감시자는 연산 프로퍼티에는 사용 불가
    - 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등 지역변수, 전역변수 모두 사용 가능
*/

// MARK: - 정의
struct Money {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.")
        }

        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.")
        }
    }

    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }

        // didSet의 암시적 매개변수 이름 oldSet
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다.")
        }
    }

    //  연산 프로퍼티
    var won: Double = {
        get {
            return dollar * currencyRate
        }

        set {
            dollar = newValue / currencyRate
        }
        
        /*
        // 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용 불가
        whillSet {

        }
        */
    }
}


// MARK: - 사용
var money: Money = Money()

money.currencyRate = 1150

money.dollar = 10

print(money.won)


// 프로퍼티 감시자의 기능은 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역/전역 변수에도 모두 사용 가능
 var a: Int = 100 {
    willSet {
        print("\(a)에서 \(newValue)로 변경될 예정입니다.")
    }

    didSet {
        print("\(oldValue)에서 \(a)로 변경되었습니다.")
    }
 }

 a = 200