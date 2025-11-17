class Employee {
  String firstName;
  String lastName;
  int age;
  double salary;
  bool isManager;
  bool director;

  Employee({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.salary,
    this.isManager = false,
    this.director = false,
  });

  Employee.director({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.salary,
    this.isManager = true,
    this.director = true,
  });

  void increaseSalary(double by) {
    salary += by;
  }

  void fullName() {
    print("$firstName $lastName");
  }

  void displayInfo() {
    print("Name: $firstName $lastName, Age: $age, Salary: $salary");
    if (isManager) {
      print("$firstName is a Manager");
    }
  }
}

void main() {
  Employee rajath = Employee.director(
    firstName: "Rajath",
    lastName: "Kumar",
    age: 21,
    salary: 10000,
  );

  Employee tony = Employee(
    firstName: "Tony",
    lastName: "Stark",
    age: 40,
    salary: 20000,
  );

  rajath.increaseSalary(1000);
  tony.increaseSalary(2000);

  rajath.displayInfo();
  rajath.fullName();

  tony.displayInfo();
  tony.fullName();
}
