class Stockfish {
  Process stockfish;

  Stockfish() {
    try {
      ProcessBuilder processBuilder = new ProcessBuilder(sketchPath("stockfish/stockfish-windows-x86-64-sse41-popcnt.exe"));
      stockfish = processBuilder.start();
    }
    catch(IOException e) {
      e.printStackTrace();
    }
  }

  void send(String cmd) {
    try {
      //send command
      // Get the OutputStream of the process
      OutputStream outputStream = stockfish.getOutputStream();

      // Write commands to the process
      String command = cmd+"\n"; // Example command: UCI protocol command
      outputStream.write(command.getBytes());
      outputStream.flush(); // Flush the stream to ensure data is sent immediately
      //outputStream.close();
    }
    catch(IOException e) {
      e.printStackTrace();
    }
  }

  public String readAllLines() {
    BufferedReader reader = new BufferedReader(new InputStreamReader(stockfish.getInputStream()));
    StringBuilder content = new StringBuilder();
    try {
      //we use the isready command
      //to check if the reader should
      //finish
      send("isready");

      String line;
      while (!(line = reader.readLine()).equals("readyok")) {
        content.append(line);
        content.append(System.lineSeparator());
      }
    }
    catch(IOException e) {
      e.printStackTrace();
    }
    return content.toString();
  }
  
  String getNextMove(){
    String engineMove = "";
    
    return engineMove;
  }
}
