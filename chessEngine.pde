//code for interfacing with stockfish over UCI
//position should be writen out form startpos
//each move.

Stockfish engine;

void setup(){
  engine = new Stockfish();
  
  engine.setNextMove("e2e4");
  engine.setNextMove("e7e6");
  
  String move = engine.getNextMove();
  
  println(move);
  
  //new game
  engine.newGame(); 
  move = engine.getNextMove();
  println(move); //<>//
}
