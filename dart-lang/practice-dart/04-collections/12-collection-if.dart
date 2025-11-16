void main () {
  var colors = ["red", "green"];
  

  const addBlack = true;
  const addWhite = false;

  if(addBlack){
    colors.add("black");
  }

  if(addWhite){ 
    colors.add("white");
  }

  print(colors);

  var newColors = ["red", "green", if(addBlack) "black", if(addWhite) "white",];
  print(newColors);
}