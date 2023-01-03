import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;

String pastedText;

void setup() {
   size(500, 200);
   textSize(15);
   pastedText = "";
  
}
void draw() { 
   background(0);
   text("HTML Dropdown Generator", 25, 50);
   text("Pasted terms: " + pastedText, 25, 75);
   text("[v] Paste terms from Clipboard", 25, 100);
   
}

void keyPressed() { 
  if (key == 'v') {
    String myClipboard = getClipBoard();
    String[] pieces = myClipboard.split(" > ");
    String firstelement = pieces[0];
    String[] values = pieces[1].split(", ");
   
    System.out.println("<select id=\"resizing_select\" class='dropdown'>");
    System.out.println("<option = selected>" + firstelement + "</option>");
      for (int i = 0; i < values.length; i++) {
      System.out.println("<option>"+ values[i] + "</option>");
      }
    System.out.println("<select id=\"resizing_select\" class='dropdown'>");
    System.out.println("<span class=\"helper-element\" aria-hidden=\"true\" style='display:none;'></span>");
    System.out.println("");
    String temp = ""; 
    for (int i = 0; i < values.length; i++) {
      temp = (temp + " ["  + values[i] + "]");
    }
    pastedText = ("[" + firstelement + "] " +temp);

  }
  
}

public String getClipBoard(){
    try {
        return (String)Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
    } catch (HeadlessException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();            
    } catch (UnsupportedFlavorException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();            
    } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
    return "";
}
