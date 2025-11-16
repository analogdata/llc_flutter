void main() {

  // If-Else
  int age = 18;

  if (age >= 18) {
    print("You are eligible to get Married 🥰");
  } else {
    print("You are not eligible to get Married 🥲");
  }

  // If-ElseIf-Else
  int marks = 80;

  if (marks >= 90) {
    print("Grade A");
  } else if (marks >= 80) {
    print("Grade B");
  } else if (marks >= 70) {
    print("Grade C");
  } else {
    print("Grade D");
  }

  // Ternary Operator
  int a = 10;
  int b = 20;

  int max = a > b ? a : b;
  print(max);

  int passengerAge = 16;

  if (passengerAge <= 16){
    print("Junior Ticket");
    print("Price: \$8");
  } else if (passengerAge >= 60) {
    print("Senior Ticket");
    print("Price: \$10");
  } else {
    print("Adult Ticket");
    print("Price: \$15");
  }

  int netSalary = 50000;
  int expenses = 45000;

  if (netSalary > expenses) {
    print("You have saved \$${netSalary - expenses} this month");
  } else if (netSalary < expenses) {
    print("You have \$${expenses - netSalary} to pay this month");
  } else {
    print("Your balance hasn't changed");
  }

}