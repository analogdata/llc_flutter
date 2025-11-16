// main.dart

// Import the BankAccount class from the same directory
import 'bank_account.dart';

void main() {
  print('=== Bank Account Demo ===');
  
  // Create a new bank account with an initial balance of 100
  // Note: The constructor is public, but _balance is private
  final account = BankAccount(100);
  print('Account created with initial balance: \$${account.balance}');

  // Deposit money into the account
  print('\nMaking a deposit...');
  try {
    account.deposit(50);
    print('Successfully deposited \$50');
    print('New balance: \$${account.balance}');
  } catch (e) {
    print('Deposit failed: $e');
  }

  // Withdraw money from the account
  print('\nMaking a withdrawal...');
  try {
    account.withdraw(20);
    print('Successfully withdrew \$20');
    print('Remaining balance: \$${account.balance}');
  } catch (e) {
    print('Withdrawal failed: $e');
  }

  // Demonstrate error handling
  print('\n=== Testing Error Handling ===');
  
  // Try to deposit a negative amount
  print('\nTrying to deposit a negative amount...');
  try {
    account.deposit(-10);  // Will throw ArgumentError
  } catch (e) {
    print('Error: $e');
  }

  // Try to withdraw more than the balance
  print('\nTrying to overdraw...');
  try {
    account.withdraw(1000);  // Will throw Exception for insufficient funds
  } catch (e) {
    print('Error: $e');
  }

  // Try to withdraw a negative amount
  print('\nTrying to withdraw a negative amount...');
  try {
    account.withdraw(-5);  // Will throw ArgumentError
  } catch (e) {
    print('Error: $e');
  }

  // Final balance
  print('\n=== Final Account Status ===');
  print('Final balance: \$${account.balance}');

  // Note: The following line would cause a compilation error
  // because _balance is private to the bank_account.dart library
  // account._balance = 1000; // Uncommenting this would cause an error
}