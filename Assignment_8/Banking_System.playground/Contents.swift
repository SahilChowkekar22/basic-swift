import UIKit

/* Banking System
 - Bank Accounts
 - performing transactions
 - Account summaries
 
 1) Bank Account
 - Types of account - Regular accounts, saving accounts,
 Properties - Balance and Account numbers
 Methods - allow deposits, withdrawals, interest calculation ,
 
 2) Transactions
 - Types of transactions - deposits, withdrawals, transfer, and  interests
 track transactions types and histroy to store of each amount
 
 3) protocol design
 
 */

//Account protocol
protocol Account{
    var accountNumber: String {get set}
    var balance: Double {get set}
    var transactionHistory: [Transaction] {get set}
    
    mutating func deposit:(amount: Double)
    mutating func withdraw:(amount: Double) throws
    func generateAccountSummary() -> String
}

// Transaction enum
enum Transaction{
    case deposit(amount: Double)
    case withdrawal(amount: Double)
    case transfer(amount: Double, recipientAccountNumber: String)
    case interest(amount: Double)
    
    var description: String{
        switch self{
        case .deposit(amount: let amount):
            return "Deposited: $\(amount)"
        case .withdrawal(amount: let amount):
            return "Withdrawn: $\(amount)"
        case .transfer(amount: let amount, recipientAccountNumber: let recipientAccountNumber):
            return "Transfered: $\(amount) to \(recipientAccountNumber)"
        case .interest(amount: let amount):
            return "Interest earned: $\(amount)"
        }
    }
}

// Generic Data Structure (stack)
struct Stack<T>{
    private var elements: [T] = []
    
    mutating func push(_ element: T){
        elements.append(element)
    }
    
    mutating func pop() -> T?{
        return elements.popLast()
    }
    
    func peek() -> T?{
        return elements.last
    }
    
    var isEmpty: Bool{
        return elements.isEmpty
    }
}

//Regular account
struct RegularAccount: Account{
    let accountNumber: String
    var balance: Double
    var transactionHistory: [Transaction] = []
    
    mutating func deposit(amount: Double){
        balance += amount
        transactionHistory.append(.deposit(amount: amount))
    }
    
    mutating func withdraw(amount: Double){
        guard balance >= amount else {
            throws TransactionError.insufficientFunds
        }
        balance -= amount
        transactionHistory.append(.withdrawal(amount: amount))
    }
    
    func generateAccountSummary() -> String{
        return "Account Number: \(accountNumber) \nBalance: \(balance)\nTransaction History:\n\(transactionHistory.map { $0.description }.joined(separator: "\n"))"
    }
}

//Saving Accounts
struct SavingsAccount: Account{
    let accountNumber: String
    var balance: Double
    var transactionHistory: [Transaction] = []
    
    mutating func deposit(amount: Double) {
        balance += amount
        transactionHistory.append(.deposit(amount: amount))
    }
    
    mutating func withdraw(amount: Double) throws {
        guard balance >= amount else {
            throw TransactionError.insufficientFunds
        }
        balance -= amount
        transactionHistory.append(.withdrawal(amount: amount))
    }
    
    func generateAccountSummary() -> String {
        return "Account Number: \(accountNumber)\nBalance: \(balance)\nTransaction History:\n\(transactionHistory.map { $0.description }.joined(separator: "\n"))"
    }
    
}

enum TransactionError: Error {
    case insufficientFunds
}

// Bank
class Bank{
    private var accounts: [String: any Account] = [:]
    
    func addAccount(_ account: any Account){
        accounts[account.accountNumber] = account
    }
    
    func getAccount(accountNumber: String) -> (any Account)? {
        return accounts[accountNumber]
    }
    
    func performTranscation(accountNumber: String, transaction: Transaction) throws {
        guard var account = accounts[accountNumber] else{
            throw TransactionError.insufficientFunds
        }
        
        switch transaction {
        case .deposit(amount: let amount):
            account.deposit(amount:amount)
        case .withdrawal(amount: let amount):
            try.account.withdrawal(amount: amount)
        case .transfer(let amount, let recipientAccountNumber):
            guard var recipientAccount = account[recipientAccountNumber] else {
                throw TransactionError.insufficientFunds
            }
            try account.withdraw(amount:amount)
            recipientAccount.deposit(amount:amount)
            accounts[recipientAccountNumber] = recipientAccount
        case .interest:
            if var savingsAccount = account as? SavingsAccount{
                savingsAccount.applyInterest()
                accounts[accountNumber] = savingsAccount
            }
        }
        
        accounts[accountNumber] = account
    }
    
    func totalBalance() -> Double {
        return accounts.values.reduce(0) { $0 + $1.balance }
    }

}

var bank = Bank()

let regularAccount = RegularAccount(accountNumber: "12345", balance: 1000)
let savingsAccount = SavingsAccount(accountNumber: "67890", balance: 5000)

bank.addAccount(regularAccount)
bank.addAccount(savingsAccount)

print("Regular Account Balance: \(regularAccount.balance)")
print("Savings Account Balance: \(savingsAccount.balance)")

do {
    try bank.performTransaction(accountNumber: "12345", transaction: .deposit(amount: 500))
    try bank.performTransaction(accountNumber: "67890", transaction: .withdrawal(amount: 1000))
    try bank.performTransaction(accountNumber: "12345", transaction: .transfer(amount: 200, recipientAccountNumber: "67890"))
    try bank.performTransaction(accountNumber: "67890", transaction: .interest(amount: 0))
} catch {
    print("Transaction failed: \(error)")
}

print(bank.getAccount(accountNumber: "12345")?.generateAccountSummary() ?? "Account not found")
print(bank.getAccount(accountNumber: "67890")?.generateAccountSummary() ?? "Account not found")
print("Total Bank Balance: \(bank.totalBalance())")
