// A class representing a bank account with a named account holder
class BankAccount {
  // SHORTHAND CONSTRUCTOR (Recommended)
  // - Uses parameter initialization directly in the constructor
  // - 'required' makes both parameters mandatory
  // - 'this.accountHolder' and 'this.balance' automatically assign values to class properties
  BankAccount({required this.accountHolder, required this.balance});

  // ALTERNATIVE LONGHAND CONSTRUCTOR (Commented out)
  // BankAccount({required String accountHolder, double balance = 0}) : accountHolder = accountHolder, balance = balance;
  // This is what the shorthand above is doing behind the scenes:
  // - Takes named parameters with '{}'
  // - ': accountHolder = accountHolder' is the initializer list
  // - 'balance = 0' sets a default value if not provided
  // BankAccount({required String accountHolder, double balance = 0})
  //     : accountHolder = accountHolder,
  //       balance = balance;

  // Class properties
  String accountHolder;  // Stores the name of the account holder
  double balance;        // Stores the current balance

  // Method to deposit money
  void deposit(double amount) {
    balance += amount;  // Add amount to current balance
  }

  // Method to withdraw money
  // Note: No check for negative balance in this version
  void withdraw(double amount) {
    balance -= amount;  // Subtract amount from current balance
  }
}

void main() {
  // Create a new bank account with named parameters
  final account = BankAccount(
    accountHolder: "Rajath",  // Named parameter for account holder
    balance: 100              // Named parameter for initial balance
  );
  
  // Perform transactions
  account.deposit(50);   // Add 50 to balance (100 + 50 = 150)
  account.withdraw(20);  // Subtract 20 from balance (150 - 20 = 130)
  
  // Print account information
  print('Account Holder: ${account.accountHolder}');  // Output: Rajath
  print('Current Balance: \$${account.balance}');     // Output: $130.0
}