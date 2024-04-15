//code for interfacing with stockfish over UCI
//position should be writen out form startpos
//each move.

//like so: position startpos moves e2e4 e7e5 d2d4 d7d5
//getting the next best moves should be writen as: 
//go movetime 1000
/*
send("position startpos moves d2d4");
send("d");
send("go movetime 1000");
//give it time to finish
delay(1500);
*/
/*
// Example: Reading the output from Stockfish
BufferedReader reader = new BufferedReader(new InputStreamReader(stockfish.getInputStream()));


println(readAllLines(reader));
*/

import java.io.*;



Stockfish engine;

void setup(){
  engine = new Stockfish();
  
  engine.send("d");
  println(engine.readAllLines());
  
  engine.send("go movetime 1000");
  //give it time to finish
  delay(1500);
  
  println(engine.readAllLines());
  
   //<>//
}
