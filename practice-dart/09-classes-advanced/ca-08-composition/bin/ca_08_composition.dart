// What is Composition?
// Composition is a fundamental concept in object-oriented programming where a class contains objects of other classes as members, rather than inheriting from them. It's often described as a "has-a" relationship.

// Key Points about Composition:

// - "Has-a" Relationship: Instead of saying "A is a B" (inheritance), we say "A has a B"
// - Flexibility: Easier to change behavior by changing the contained objects
// - Loose Coupling: Classes are less dependent on each other
// - Reusability: Components can be reused in different contexts

// This is like a blueprint for all UI elements (like buttons, text, etc.)
// It's abstract because we don't make Widget objects directly
abstract class Widget {
  // No code here, just a base for other classes to build upon
}

// This is a Text widget that shows words on screen
// It's a type of Widget (inherits from Widget)
class Text extends Widget {
  Text(this.text);  // Constructor that takes the text to display
  final String text;  // The actual words to show (can't be changed after creation)
}

// This is a Button widget that can be clicked
// It's also a type of Widget
class Button extends Widget {
  // Constructor with named parameters:
  // - child: what shows inside the button (required)
  // - onPressed: what happens when button is clicked (optional)
  Button({required this.xyz, this.onPressed});
  
  final Widget xyz;   // Composition: Button HAS-A Widget (child)
  final void Function()? onPressed;  // The action when button is pressed (can be null)
}

void main() {
  // Create a button with text inside it
  final button = Button(
    child: Text("Click Me"),  // The text that appears on the button
    onPressed: () => print("Button Pressed"),  // What happens when clicked
  );

  // Simulate a button click (the ! means we're sure onPressed is not null here)
  button.onPressed!();
}

// Real-world Analogy:
// Think of composition like building with LEGO blocks:

// - Each block (widget) is independent
// - You can combine them in any way you want
// - A house (button) can have different types of blocks inside it (text, images, etc.)
// - You can change what's inside without changing the house itself

// In Flutter:
// This pattern is exactly how Flutter's widget system works:

// - Everything is a widget
// - Complex UIs are built by composing simpler widgets
// - This makes the code more maintainable and flexible