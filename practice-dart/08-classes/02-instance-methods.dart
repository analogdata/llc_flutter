// A blueprint for creating bank accounts
class BankAccount {
  // Property to store the current balance
  double balance = 0;

  // Method to add money to the account
  // 'void' means this doesn't return any value
  void deposit(double amount) {
    balance += amount;  // Add the amount to the current balance
  }

  // Method to take money out of the account
  // Returns 'true' if successful, 'false' if not enough money
  bool withdraw(double amount) {
    // Check if there's enough money to withdraw
    if (balance >= amount) {
      balance -= amount;  // Subtract the amount from balance
      return true;       // Return true for successful withdrawal
    }
    return false;  // Not enough money, return false
  } 
}

void main() {
  // Create a new bank account
  final account = BankAccount();
  
  // Add $100 to the account
  account.deposit(100);
  print("Balance: \$${account.balance}"); // Shows: Balance: $100.0

  // Try to withdraw $50 (this should work)
  final success = account.withdraw(50);
  print("Withdrawal ${success ? 'successful' : 'failed'}: $success, Balance remains: \$${account.balance}");
  // Shows: Withdrawal successful: true, Balance remains: $50.0

// Try to withdraw $200 (this should fail - not enough money)
final failure = account.withdraw(200);
print("Withdrawal ${failure ? 'successful' : 'failed'}: $failure, Balance remains: \$${account.balance}");
// Shows: Withdrawal failed: false, Balance remains: $50.0
}