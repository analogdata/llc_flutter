void main() {

  // Hex Format
  int x = 0xFF;

  // Decimal Format
  print(x);

  // Binary Format
  print(x.toRadixString(2));

  int number = 0x04; // 0000 0100

  print(number.toRadixString(2));

  // Shifting Operators

  print(number << 1); // Left Shift 0000 1000 == 0x08 == 8
  print(number >> 1); // Right Shift 0000 0010 == 0x02 == 2

  // Bitwise AND
  print(number & 1); // 0000 0100 & 0000 0001 == 0000 0000 == 0

  // Bitwise OR
  print(number | 1); // 0000 0100 | 0000 0001 == 0000 0101 == 5

  // Bitwise XOR
  print(number ^ 1); // 0000 0100 ^ 0000 0001 == 0000 0101 == 5 

}