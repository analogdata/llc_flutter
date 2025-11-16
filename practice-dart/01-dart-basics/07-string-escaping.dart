void main () {
  // Here \ is used to escape the single quote
  print('Today I\'m feeling Great!');

  print('\\');
  print('\$');

  // Raw String: It ignores the escape characters

  // Some times we need to use raw string to print the path in Windows Machine
  print(r'c:\Windows\system32');

  // Some times we need to use raw string to print the path in Linux & Mac Machine
  print(r'/home/rajathkumar/Documents');


  // Some Tricky Example While Mentioning the Amount in '$'

  int a = 10;
  print('$a');
  print('\$a');
  print('\$$a');
} 