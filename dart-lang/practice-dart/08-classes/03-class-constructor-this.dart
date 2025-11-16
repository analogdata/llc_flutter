// A class representing a bank account with basic operations
class BankAccount {
  // Constructor that takes an initial balance
  // 'this.balance' refers to the class property
  // The parameter 'balance' shadows the class property, so we use 'this' to differentiate
  BankAccount(double balance) {
    this.balance = balance;
  }
  
  // Class property to store the account balance
  // Initialized to 0, but will be set by the constructor
  double balance = 0;

  // Method to deposit money into the account
  // Takes an amount and adds it to the current balance
  void deposit(double amount) {
    balance += amount;  // Shorthand for: balance = balance + amount
  }

  // Method to withdraw money from the account
  // Takes an amount and subtracts it from the current balance
  // Note: This version doesn't check for sufficient funds (unlike previous example)
  void withdraw(double amount) {
    balance -= amount;  // Shorthand for: balance = balance - amount
  }
}

void main() {
  // Create a new bank account with an initial balance of 100
  final account = BankAccount(100);
  
  // Deposit 50 into the account (100 + 50 = 150)
  account.deposit(50);
  
  // Withdraw 20 from the account (150 - 20 = 130)
  account.withdraw(20);
  
  // Print the final balance
  print('Final balance: \$${account.balance}');  // Output: Final balance: $130.0
}