// If Null Operator
// ??= is used to assign a value to a nullable variable if it is null

void main () {
  int a = -1;
  int? b;

  if (a > 0){
    b = a;
  }

  // If b is null, assign 0 to it
  b ??= 0;

  int value = b;
  print(value);
}