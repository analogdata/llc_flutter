class Animal {
  Animal({required this.age});

  final int age;

  void sleep() => print("Sleep");
  void eat() => print("Eat");
}

class Lion extends Animal {
  Lion({required super.age});
  void hunt() => print("Hunt");

  @override
  void sleep() {
    super.sleep();
    print("Sleeping like a lion");
  }
}

class Dog extends Animal {
  Dog({required super.age});
  void bark() => print("Bark");
}

class Tiger extends Animal {
  Tiger({required super.age});
  void roar() => print("Roar");
}

class Tortoise extends Animal {
  Tortoise({required super.age});
  void swim() => print("Swimming...");
}

void main() {
  final puppy = Dog(age: 2);
  puppy.sleep();
  puppy.bark();
  print(puppy.age);

  final tiger = Tiger(age: 5);
  tiger.sleep();
  tiger.roar();
  print(tiger.age);

  final tortoise = Tortoise(age: 105);
  tortoise.sleep();
  tortoise.swim();
  print(tortoise.age);

  final simba = Lion(age: 3);
  simba.sleep();
  simba.sleep();
  print(simba.age);
}
