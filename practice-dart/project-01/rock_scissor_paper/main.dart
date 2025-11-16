import 'dart:io';
import 'dart:math';

void main(){
  while(true){

    stdout.write("Rock, Paper or Scissors ? (r/p/s):  ");
    final input = stdin.readLineSync();

    if(input == "q"){
      print("Goodbye");
      break;
    }
    
    if (input != "r" && input != "p" && input != "s") {
      print("Invalid Input");
      continue;
    }


    final computer = ["r", "p", "s"][Random().nextInt(3)];
    
    print("You Chose $input");
    print("Computer Chose $computer");

    if(input == computer){
      print("Tie");
      continue;
    }

    if((input == "r" && computer == "s") || (input == "p" && computer == "r") || (input == "s" && computer == "p")){
      print("You Win");
      continue;
    }

    print("Computer Wins");
    continue;
  }
}