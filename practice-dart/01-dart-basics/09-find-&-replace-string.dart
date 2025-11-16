void main() {
  String originalString = "I love Generative AI";
  print(originalString);

  print(originalString.contains("AI"));

  String replaceString = originalString.replaceAll("AI", "Artificial Intelligence");
  print(replaceString);

  }