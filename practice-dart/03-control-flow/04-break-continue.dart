void main() {
  // Break
  // Break is used to exit the loop, when certain conditions met
  for (int i = 0; i <= 5; i++) {
    if (i == 3) {
      break;
    }
    print(i);
  }
  print("Done");

  // Break
  for (var i in ['🐮', '🐱', '🐭', '🐹', '🐰', '🦊', '🐻']) {
    if (i == '🦊') {
      break;
    }
    print(i);
  }
  print("Done");


  // Continue
  // Continue is used to skip the current iteration, when certain conditions met
  for (int i = 0; i <= 5; i++) {
    if (i == 3) {
      continue;
    }
    print(i);
  }
  print("Done");

  // Continue
  for (var i in ['🐮', '🐱', '🐭', '🐹', '🐰', '🦊', '🐻']) {
    if (i == '🦊') {
      continue;
    }
    print(i);
  }
  print("Done");
}