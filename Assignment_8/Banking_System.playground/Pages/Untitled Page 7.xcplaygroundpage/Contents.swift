import Foundation


enum BankError: Error{
    case insufficientFunds(Int)
    case WithdrawalLimitExceeded
    case AccountNumberNotValid(String)
    case InvalidTransaction(Double)
    
            
}

extension BankError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .insufficientFunds(let amount):
            return "Insufficient funds. Available balance: \(amount)"
        case .WithdrawalLimitExceeded:
            return "Withdrawal limit exceeded"
        case .AccountNumberNotValid(let number):
            return "Account number \(number) is not valid"
        case .InvalidTransaction(_):
            return "Withdrawal amount must be greater than zero"
        }
    }
}
// Bank Account protocol
protocol BankAccount: AnyObject {
    var accountNumber: String { get }
    var balance: Double { get set }
    var transactionHistory: [Transaction] { get set }
    
    func deposit(amount: Double) -> String
    func withdraw(amount: Double) -> String
    func generateAccountSummary() -> String
}

// Transaction ENUM
enum Transaction {
    case deposit(amount: Double, timestamp: Date, balanceAfterTransaction: Double)
    case withdrawal(amount: Double, timestamp: Date, balanceAfterTransaction: Double)
    case transferOut(amount: Double, recipientAccountNumber: String, timestamp: Date, balanceAfterTransaction: Double)
    case transferIn(amount: Double, senderAccountNumber: String, timestamp: Date, balanceAfterTransaction: Double)
    case interestApplied(amount: Double, timestamp: Date, balanceAfterTransaction: Double)
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        switch self {
        case .deposit(let amount, let timestamp, let balanceAfterTransaction):
            return "\(dateFormatter.string(from: timestamp)) - Deposit: $\(amount), Balance: $\(balanceAfterTransaction)"
        case .withdrawal(let amount, let timestamp, let balanceAfterTransaction):
            return "\(dateFormatter.string(from: timestamp)) - Withdrawal: $\(amount), Balance: $\(balanceAfterTransaction)"
        case .transferOut(let amount, let recipient, let timestamp, let balanceAfterTransaction):
            return "\(dateFormatter.string(from: timestamp)) - Transfer: $\(amount) to \(recipient), Balance: $\(balanceAfterTransaction)"
        case .transferIn(let amount, let sender, let timestamp, let balanceAfterTransaction):
            return "\(dateFormatter.string(from: timestamp)) - Credit: $\(amount) from \(sender), Balance: $\(balanceAfterTransaction)"
        case .interestApplied(let amount, let timestamp, let balanceAfterTransaction):
            return "\(dateFormatter.string(from: timestamp)) - Interest Applied: $\(amount), Balance: $\(balanceAfterTransaction)"
        }
    }
}

// Regular Account
class RegularAccount: BankAccount {
    let accountNumber: String
    var balance: Double
    var transactionHistory: [Transaction] = []
    
    init(accountNumber: String, initialBalance: Double = 0.0) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
        print("Account \(accountNumber) created successfully with an initial balance of $\(initialBalance).")
    }
    
    func deposit(amount: Double) -> String {
        if amount <= 0 {
            return "Error: Deposit amount must be greater than zero."
        }
        balance += amount
        let transaction = Transaction.deposit(amount: amount, timestamp: Date(), balanceAfterTransaction: balance)
        transactionHistory.append(transaction)
        return "Deposit of $\(amount) successful. New balance: $\(balance)."
    }
    
    func withdraw(amount: Double) -> String {
        if amount <= 0 {
            return "Error: Withdrawal amount must be greater than zero."
        }
        if amount > balance {
            return "Error: Insufficient balance in account \(accountNumber)."
        }
        balance -= amount
        let transaction = Transaction.withdrawal(amount: amount, timestamp: Date(), balanceAfterTransaction: balance)
        transactionHistory.append(transaction)
        return "Withdrawal of $\(amount) successful. New balance: $\(balance)."
    }
    
    func generateAccountSummary() -> String {
        let history = transactionHistory.map { $0.description }.joined(separator: "\n")
        return """
        \nAccount Number: \(accountNumber)
        Balance: $\(balance)

        Transaction History:
        \(history)
        """
    }
}

// Saving Account
class SavingsAccount: RegularAccount {
    let interestRate: Double = 0.05 // 5% interest rate
    
    func applyInterest() -> String {
        let interest = balance * interestRate
        balance += interest
        let transaction = Transaction.interestApplied(amount: interest, timestamp: Date(), balanceAfterTransaction: balance)
        transactionHistory.append(transaction)
        return "Interest applied: $\(interest). New balance: $\(balance)."
    }
    
    override func generateAccountSummary() -> String {
        let history = transactionHistory.map { $0.description }.joined(separator: "\n")
        return """
        Savings Account Number: \(accountNumber)
        Balance: $\(balance)
        Interest Rate: \(interestRate * 100)%

        Transaction History:
        \(history)
        """
    }
}

// Bank Account Class
class Bank {
    private var accounts: [String: BankAccount] = [:]
    
    func addAccount(_ account: BankAccount) {
        accounts[account.accountNumber] = account
    }
    
    func getAccount(byNumber accountNumber: String) -> BankAccount? {
        return accounts[accountNumber]
    }
    
    func performTransaction(_ transaction: Transaction, forAccount accountNumber: String) throws -> String {
        guard let account = accounts[accountNumber] else {
//            return "Error: Account with number \(accountNumber) not found."
            throw BankError.AccountNumberNotValid(accountNumber)
        }
        
        switch transaction {
        case .deposit(let amount, _, _):
            return account.deposit(amount: amount)
            
        case .withdrawal(let amount, _, _):
            return account.withdraw(amount: amount)
            
        case .transferOut(let amount, let recipientAccountNumber, _, _):
            guard let recipientAccount = accounts[recipientAccountNumber] else {
//                return "Error: Recipient account with number \(recipientAccountNumber) not found."
                throw BankError.AccountNumberNotValid(recipientAccountNumber)
            }
            
            // Attempt to withdraw from the sender's account
            let withdrawalMessage = account.withdraw(amount: amount)
            if withdrawalMessage.contains("Error") {
                return withdrawalMessage // Return the error message if withdrawal fails
            }
            
            // If withdrawal is successful, deposit into the recipient's account
            let depositMessage = recipientAccount.deposit(amount: amount)
            
            // Record the transfer in both accounts' transaction history
            let timestamp = Date()
            account.transactionHistory.append(.transferOut(amount: amount, recipientAccountNumber: recipientAccountNumber, timestamp: timestamp, balanceAfterTransaction: account.balance))
            recipientAccount.transactionHistory.append(.transferIn(amount: amount, senderAccountNumber: accountNumber, timestamp: timestamp, balanceAfterTransaction: recipientAccount.balance))
            
            return "Transfer of $\(amount) from account \(accountNumber) to account \(recipientAccountNumber) successful."
            
        case .interestApplied(_, _, _):
            if let savingsAccount = account as? SavingsAccount {
                return savingsAccount.applyInterest()
            } else {
                return "Error: Interest can only be applied to savings accounts."
            }
            
        default:
            return "Error: Invalid transaction type."
        }
    }
    
    func totalBalance() -> Double {
        return accounts.values.reduce(0) { $0 + $1.balance }
    }
}

//creating instance of bank 
let bank = Bank()

let regularAccount = RegularAccount(accountNumber: "12345", initialBalance: 1000)
let savingsAccount = SavingsAccount(accountNumber: "67890", initialBalance: 500)

bank.addAccount(regularAccount)
bank.addAccount(savingsAccount)

// Collect transaction messages
var transactionMessages: [String] = []

// Test Case 1: Deposit
do{
    transactionMessages.append(try bank.performTransaction(.deposit(amount: 200, timestamp: Date(), balanceAfterTransaction: 0), forAccount: "12345"))




// Test Case 2: Withdrawal
transactionMessages.append(try bank.performTransaction(.withdrawal(amount: 100, timestamp: Date(), balanceAfterTransaction: 0), forAccount: "12345"))

// Test Case 3: Transfer
transactionMessages.append(try bank.performTransaction(.transferOut(amount: 300, recipientAccountNumber: "67890", timestamp: Date(), balanceAfterTransaction: 0), forAccount: "12345"))

// Test Case 4: Apply Interest
transactionMessages.append(try bank.performTransaction(.interestApplied(amount: 0, timestamp: Date(), balanceAfterTransaction: 0), forAccount: "67890"))

// Test Case 5: Attempt to withdraw more than the balance
transactionMessages.append(try bank.performTransaction(.withdrawal(amount: 1000, timestamp: Date(), balanceAfterTransaction: 0), forAccount: "12345"))

// Test Case 6: Attempt to withdraw zero or negative amount
transactionMessages.append(try bank.performTransaction(.withdrawal(amount: -50, timestamp: Date(), balanceAfterTransaction: 0), forAccount: "12345"))

// Test Case 7: Attempt to transfer to a non-existent account
transactionMessages.append(try bank.performTransaction(.transferOut(amount: 100, recipientAccountNumber: "99999", timestamp: Date(), balanceAfterTransaction: 0), forAccount: "12345"))

// Test Case 8: Attempt to transfer with insufficient funds
transactionMessages.append(try bank.performTransaction(.transferOut(amount: 1000, recipientAccountNumber: "67890", timestamp: Date(), balanceAfterTransaction: 0), forAccount: "12345"))

// Print account summaries and total balance
print(regularAccount.generateAccountSummary())
print()
print(savingsAccount.generateAccountSummary())
print("Total Balance in Bank: $\(bank.totalBalance())")

// Print transaction messages at the end
print("\nTransaction Messages:")
for message in transactionMessages {
    print(message)
}
}catch{
    print(error.localizedDescription)
}

