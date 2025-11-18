class Employee {
  Employee({
    required this.firstName,
    required this.lastName,
    required this.age,
    // required this._salary
    this.isManager = false,
    this.director = false,
  });

  Employee.director({
    required this.firstName,
    required this.lastName,
    required this.age,
    // required this._salary,
    this.isManager = true,
    this.director = true,
  });

  String firstName;
  String lastName;
  int age;
  double _salary = 0;
  bool isManager;
  bool director;

  double get salary => _salary;

  set salary(double value) {
    _salary = value;
  }

  void increaseSalary(double by) {
    _salary += by;
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
  );

  rajath.salary = 10000;

  Employee tony = Employee(firstName: "Tony", lastName: "Stark", age: 40);

  rajath.increaseSalary(1000);
  tony.increaseSalary(2000);

  rajath.displayInfo();
  rajath.fullName();

  tony.displayInfo();
  tony.fullName();
}
