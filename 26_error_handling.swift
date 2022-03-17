/* 오류처리 - error handling */

/*
    - 스위프트에서 오류(Error)는 'Error'라는 프로토콜을 준사하는 타입의 값을 통해 표현
    - 'Error'프로토콜은 사실상 요구사항이 없는 빈 프로토콜일 뿐이지만, 오류를 표현하기 위한 타입(주로 열거형)은 이 프로토콜을 채택
    - 스위프트의 열거형은 오류의 종류를 나타내기에 아주 적합
    - 연관 값을 통해 오류에 관한 부가 정보를 제공 가능
*/

import Swift

// MARK:: - 오류표현
// Error 프로토콜과 (주로) 열거형을 통해 오류를 표현

/*
    enum 오류종류이름: Error {
        case 종류1
        case 종류2 
        case 종류3
        // ...
    }
*/

// 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
enum VendingMachinError: Error {
    case invalidInput
    case insufficientFunds(moneyNeed: Int)
    case outOfStock
}

// MARK: - 함수에서 발생한 오류 던지기
// 오류발생의 여지가 있는 메서드는 'throws'를 사용하여 오류를 내표하는 함수임을 표시
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0

    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {

        // 입력한 돈이 0이하면 오류를 던짐
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }

        // 오류가 없으면 정상처리
        self.deposited += money
        print("\(money)원을 받음")
    }

    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {

        // 원하는 아이템의 수량이 잘 못 입력 시 오류
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }

        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류 발생
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited

            throw VendingMachineError.insufficiendFunds(moneyNeeded: moneyNeeded)
        }

        // 구매하려는 수량보다 요구하는 수량이 많으면 오류
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }

        // 오류가 없으면 정상처리
        let totalPrice = numberOfItemsToVend * itemPrice

        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend

        return "\(numberOfItemsToVend)개 제공함"
    }
}

let machine: VendingMachine = VendingMachine()
var result: String?

// MARK: - 오류처리
/*
    오류처리
    - 오류를 던질 수도 있지만 오류가 던져지는 것에 대비해 던져진 오류를 처리하기 위한 코드도 필요
    - 오류발생의 여지가 있는 throws 함수(메서드)는 try를 사용하여 호출해야한다. try와 do-catch, try?, try! 세가지 종류가 존재한다.
*/

/*
    << do-catch >>
    - 오류발생의 여지가 있는 throws 함수(메서드)는 do-catch 구문을 활용하여 오류 발생에 대비
    - 가장 정석적인 방법으로 모든 오류 케이스에 대응
*/
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다.")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다.")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다.")
}   // 입력이 잘못되었습니다.

// 하나의 catch 블럭에서 switch 구문을 사용해 오류를 분류할 수 있다.
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ {
    switch error {
        case VendingMachineError.invalidInput:
            print("입력이 잘못되었습니다.")
        case VendingMachineError.insufficientFunds(let moneyNeeded):
            print("\(moneyNeeded)원이 부족합니다.")
        case VendingMachineError.outOfStock:
            print("수량이 부족합니다.")
        default:
            print("알수없는 오류 \(error)")
    }
}   // 300원 받음

// 딱히 케이스별로 오류처리 할 필요가 없으면 catch 구문 내부를 간략화해도 무방
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}   // insufficientFunds(100)

// 케이스별로 오류처리 할 필요가 없으면 do 구문만 써도 무방
do {
    result = try machine.vend(numberOfItems: 4)
}

/*
    << try? >>
    - 별도의 오류처리 결과를 통보받지 않고 오류가 발생했으면 결과값을 nil로 돌려받을 수 있다
    - 정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받는다.
*/
result = try? machine.vend(numberOfItems: 2)
result  // Optional("2개 제공함")

result = try? machine.vend(numberOfItems: 2)
result  // nil

/*
    << try! >>
    - 오류가 발생하지 않을 것이라는 강력한 확신을 가질 때 try!를 사용하면 정상동작 후에 바로 결과값을 돌려받는다.
    - 오류가 발생하면 런타임 오류가 발생하여 애플리케이션 동작이 중지 된다.
*/
result = try! machine.vend(numberOfItems: 1)
result // 1개 제공함

//result = try! machine.vend(numberOfItems: 1)  // 런타임 오류 발생