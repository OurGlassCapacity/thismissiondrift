import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
boolean newline;
String pastedText;
String typing = "";
void setup() {
   size(600, 200);
   textSize(15);
   pastedText = "";
   newline = false;
}
void draw() { 
   background(0);
   text("HTML Dropdown Generator", 25, 50);
   text("[type] Input: " + typing, 41, 100);
   text("[tab] Paste terms from Clipboard", 41, 78);
   text("Pasted terms: " + pastedText, 12, 187);
}

void keyPressed() { 
  if (keyCode == TAB) {
    String myClipboard = getClipBoard();
    String[] pieces = myClipboard.split(" > ");
    String firstelement = pieces[0];
    String[] values = pieces[1].split(", ");
     System.out.println(typing);
    System.out.println("<select id=\"resizing_select\" class='dropdown'>");
    System.out.println("<option = selected>" + firstelement + "</option>");
      for (int i = 0; i < values.length; i++) {
      System.out.println("<option>"+ values[i] + "</option>");
      }
    System.out.println("<select id=\"resizing_select\" class='dropdown'>");
    System.out.println("<span class=\"helper-element\" aria-hidden=\"true\" style='display:none;'></span>");
   
    String temp = ""; 
    for (int i = 0; i < values.length; i++) {
      temp = (temp + " ["  + values[i] + "]");
    }
    pastedText = ("[" + firstelement + "] " +temp);
    typing = "";
  }
  if (keyCode == SHIFT) {} 
else if (keyCode == BACKSPACE) {typing = typing.substring(0,typing.length()-1);}
else if(keyCode == ENTER) {typing = typing + "\n"; }
else if (key == '1') {System.out.println(typing); typing = ""; System.out.println("---");}
else if (key =='2') System.out.println(typing.length());
else typing = typing + key;

if (typing.length() == 63 || typing.length() == 137 || typing.length() == 211) {
 newline = true;
  } if (newline) {typing = typing + "\n"; newline = false;}
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
