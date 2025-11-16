void main () {
  const addBlack = true;

  var colors = ["red", "green", if(addBlack) "black", "white"];
  print(colors);

  const extraColors = ["blue", "yellow"];

  colors.addAll(extraColors);
  print(colors);


  var newColors = [
    for(var color in colors) 
    color,
    for(var color in extraColors) 
    color,
  ];
  print(newColors);
}