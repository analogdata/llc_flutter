import 'package:test_project/test_project.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('add', () {
    expect(add(3, 3), 6);
  });
}
