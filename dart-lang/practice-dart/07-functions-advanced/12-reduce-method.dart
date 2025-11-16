void main() {
  // Imagine you have a line of numbered boxes: [1, 2, 3, 4, 5]
  const list = [1, 2, 3, 4, 5];
  
  // The reduce method is like a game where you combine all numbers together
  // It's like saying: "Start with the first number, then keep adding the next one"
  final sum = list.reduce((value, element) => value + element);
  // Step by step:
  // 1. Start with 1 (first number)
  // 2. 1 + 2 = 3
  // 3. 3 + 3 = 6
  // 4. 6 + 4 = 10
  // 5. 10 + 5 = 15
  
  print(sum); // This will print: 15
}

// [1, 2, 3, 4, 5]
//  │   │
//  │   └── element (starts from 2nd item)
//  └────── value (starts as 1st item)