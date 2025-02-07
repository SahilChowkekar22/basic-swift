import UIKit

/* The Dependency Inversion Principle (DIP) is one of the SOLID principles of object-oriented programming. It states that:
 
  - High-level modules should not depend on low-level modules. Both should depend on abstractions.
  - Abstractions should not depend on details. Details should depend on abstractions.
  - This means that instead of high-level modules directly depending on concrete implementations (low-level details), they should rely on interfaces or abstract classes. This allows for better flexibility, testability, and scalability.
 
 There are three types of Dependency Injection:

 - Constructor Injection – Dependencies are injected via the initializer.
 - Property Injection – Dependencies are assigned to properties after object creation.
 - Method Injection – Dependencies are passed as method parameters when needed

*/

protocol PaymentService {
    func processPayment(amount: Double)
}

class CreditCardPaymentService: PaymentService {
    func processPayment(amount: Double) {
        print("Processing payment of \(amount) using Credit Card.")
    }
}

class PaypalPaymentService: PaymentService {
    func processPayment(amount: Double) {
        print("Processing payment of \(amount) using Paypal.")
    }
}
class NotificationService{
    func sendNotification(message: String){
        print("Notification: \(message)")
    }
}
class PaymentProcess{
    let paymentService: PaymentService
    
    init(paymentService: PaymentService) {
        self.paymentService = paymentService
    }
    
    func makePayment(amount:Double, notificationService: NotificationService){
        paymentService.processPayment(amount: amount)
        notificationService.sendNotification(message: "Payment of $\(amount) successfully processed.")
    }
}

let creditCardPaymentService = CreditCardPaymentService()
let paypalPaymentService = PaypalPaymentService()
let notificationService = NotificationService()

let paymentProcessWithCreditCard = PaymentProcess(paymentService: creditCardPaymentService)
paymentProcessWithCreditCard.makePayment(amount: 100, notificationService: notificationService)
print()
let paymentProcessWithPaypal = PaymentProcess(paymentService: paypalPaymentService)
paymentProcessWithPaypal.makePayment(amount: 50, notificationService: notificationService)
