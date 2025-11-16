// A class that represents a special kind of number with two parts
class Complex {
  // Main way to create a complex number with any values
  const Complex(this.re, this.im);

  // Special constructor for zero (0 + 0i)
  const Complex.zero() : re = 0, im = 0;

  // Special constructor for one (1 + 1i)
  const Complex.one() : re = 1, im = 1;

  // Special constructor for identity (1 + 0i)
  const Complex.identity() : re = 1, im = 0;

  // Constructor for real numbers (like 5 + 0i)
  const Complex.real(double re) : re = re, im = 0;

  // Constructor for imaginary numbers (like 0 + 5i)
  const Complex.imaginary(double im) : re = 0, im = im;

  // The two parts of our special number
  final double re;  // The "real" part (like the regular numbers you know)
  final double im;  // The "imaginary" part (like a magic number with 'i')

  // A way to show our special number
  void printDetails() {
    print('Real: $re, Imaginary: $im');
  }
}

void main() {
  // Let's make some special numbers using our constructors!
  
  // Makes 0 + 0i (like having zero cookies and zero candies)
  final zero = Complex.zero();
  zero.printDetails();  // Shows: Real: 0, Imaginary: 0

  // Makes 1 + 1i (like having one cookie and one candy)
  final one = Complex.one();
  one.printDetails();  // Shows: Real: 1, Imaginary: 1

  // Makes 1 + 0i (like having one cookie and no candies)
  final identity = Complex.identity();
  identity.printDetails();  // Shows: Real: 1, Imaginary: 0

  // Makes 5.0 + 0i (like having 5 cookies and no candies)
  final real = Complex.real(5.0);
  real.printDetails();  // Shows: Real: 5.0, Imaginary: 0

  // Makes 0 + 5.0i (like having no cookies but 5 magic candies)
  final imaginary = Complex.imaginary(5.0);
  imaginary.printDetails();  // Shows: Real: 0, Imaginary: 5.0
}