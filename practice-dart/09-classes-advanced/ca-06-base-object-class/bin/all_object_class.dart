// In Dart, every class implicitly extends Object
// Even if not explicitly written, this is equivalent to: class Foo extends Object
class Foo {
  void type() {
    // super here refers to Object
    // runtimeType is a getter from the Object class
    print("It is a type of ${super.runtimeType}");
  }
}

void main() {
  final bar = Foo();
  bar.type(); // This will print: Object
}