//code for interfacing with stockfish over UCI
//position should be writen out form startpos
//each move.

//like so: position startpos moves e2e4 e7e5 d2d4 d7d5
//getting the next best moves should be writen as: 
//go movetime 1000

import java.io.*;

Process stockfish;


void setup(){
  try {
            ProcessBuilder processBuilder = new ProcessBuilder(sketchPath("stockfish/stockfish-windows-x86-64-sse41-popcnt.exe"));
            stockfish = processBuilder.start();
            
            // You can use stockfish.getInputStream() to read its output stream
            // You can use stockfish.getOutputStream() to write to its input stream
            // You can use stockfish.getErrorStream() to read its error stream
            
            send("position startpos moves d2d4");
            send("d");
            send("go movetime 1000");
            //give it time to finish
            delay(1500);
            
             //<>//
            // Example: Reading the output from Stockfish
            BufferedReader reader = new BufferedReader(new InputStreamReader(stockfish.getInputStream()));
            
            
            println(readAllLines(reader));
            
        } catch (IOException e) {
            e.printStackTrace();
        }
}

void send(String cmd) throws IOException{
            //send command
            // Get the OutputStream of the process
            OutputStream outputStream = stockfish.getOutputStream();
            
            // Write commands to the process
            String command = cmd+"\n"; // Example command: UCI protocol command
            outputStream.write(command.getBytes());
            outputStream.flush(); // Flush the stream to ensure data is sent immediately
            //outputStream.close();
}

public String readAllLines(BufferedReader reader) throws IOException {
    //we use the isready command
    //to check if the reader should 
    //finish
    send("isready");
    StringBuilder content = new StringBuilder();
    String line;
    while (!(line = reader.readLine()).equals("readyok")) {
        content.append(line);
        content.append(System.lineSeparator());
    }
    return content.toString();
}
