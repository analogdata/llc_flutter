// Think of a class like a blueprint for creating objects
// Here, we're creating a blueprint for a Bank Account
class BankAccount {
  // This is a property (like a characteristic) of the BankAccount
  // 'double' means it can have decimal numbers
  // 'balance' is like the amount of money in the account
  // It starts at 0.0 when a new account is created
  double balance = 0;
}

void main() {
  // Creating a new BankAccount object (like making a real bank account)
  // 'myAccount' is like getting a new bank account at a bank
  final myAccount = BankAccount();
  
  // Looking at how much money is in the account (starts at 0)
  print(myAccount.balance);  // Output: 0.0

  // Adding money to the account
  // We're setting the balance to 100
  myAccount.balance = 100;
  print(myAccount.balance);  // Output: 100.0

  // Creating a second, completely separate bank account
  // This is like opening another account at the same bank
  final anotherAccount = BankAccount();
  
  // Setting the balance of the second account to 200
  // Notice this doesn't affect the first account!
  anotherAccount.balance = 200;
  print(anotherAccount.balance);  // Output: 200.0
  
  // The first account still has 100
  print(myAccount.balance);  // Output: 100.0
}

// BankAccount (Class)
// └── balance (property)

// myAccount (Object #1)      anotherAccount (Object #2)
// ├── balance: 100.0         ├── balance: 200.0
// └── [other properties]      └── [other properties]