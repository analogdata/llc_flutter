// bank_account.dart

/// A class representing a bank account with private balance
/// Demonstrates encapsulation using private members
class BankAccount {
  // Private constructor - can only be called within this library
  // The underscore makes it private
  BankAccount(this._balance);
  
  // Private instance variable (starts with underscore)
  // Can only be accessed within this library
  double _balance;

  // Public getter to access the private _balance
  // Provides read-only access to the balance
  double get balance => _balance;

  /// Deposits money into the account
  /// [amount] must be a positive number
  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Deposit amount must be positive');
    }
    _balance += amount;
  }

  /// Withdraws money from the account
  /// [amount] must be a positive number and not exceed the balance
  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Withdrawal amount must be positive');
    }
    if (amount > _balance) {
      throw Exception('Insufficient funds');
    }
    _balance -= amount;
  }
}