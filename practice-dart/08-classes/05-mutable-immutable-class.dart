// A class demonstrating mutable and immutable properties
class BankAccount {
  BankAccount({required this.accountHolder, required this.balance});

  // IMMUTABLE property (can't be changed after initialization)
  // - 'final' means once set, it cannot be reassigned
  // - Like writing in pen - can't be erased/changed
  final String accountHolder;

  // MUTABLE property (can be changed after initialization)
  // - Can be modified after the object is created
  // - Like writing in pencil - can be erased/changed
  double balance;

  // Method to modify the mutable property
  void deposit(double amount) {
    balance += amount;  // Allowed: Modifying mutable property
  }

  void withdraw(double amount) {
    balance -= amount;  // Allowed: Modifying mutable property
  }
}

void main() {
  // Create a new bank account
  final account = BankAccount(accountHolder: "Rajath", balance: 100);
  
  // This would cause a compile-time error:
  // account.accountHolder = "New Name";  // Error: accountHolder is final
  
  // These are allowed because balance is mutable
  account.deposit(50);   // Balance changes from 100 to 150
  account.withdraw(20);  // Balance changes from 150 to 130
  
  // Print account information
  print('Account Holder: ${account.accountHolder}');  // Output: Rajath (never changes)
  print('Current Balance: \$${account.balance}');     // Output: $130.0 (changes with operations)
}