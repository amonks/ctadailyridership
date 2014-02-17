import processing.pdf.*;
PGraphicsPDF pdf = (PGraphicsPDF) g;
Table table; // This is a store of our data.
PFont font;

// We will simply load the data and make a static image.
// Consider rendering the image to a PDF 
// (see http://processing.org/reference/libraries/pdf/)
void setup() {
  // Size is width, height. Deactivate for PDF export
 // size(1200, 1200);
  int yearmin = 2001;
  int yearmax = 2013;
  int y = 2013;
  // for (int y = yearmin; y <= yearmax; y++) {

	//print to PDF
    size(1200, 1200, PDF, "pdfs/" + str(y) + ".pdf");

    // set the background color to white.
    background(255,255,255);
    font = createFont("Arial",10,true);


    // Load our inverted table data.  The header, tsv flags tell 
    // loadTable() how to interpret the data.
    table = loadTable("csvs/" + str(y) + ".csv", "csv");

    //cycle through row 0 for dates
    int r = 0;
    TableRow row = table.getRow(r);

    textFont(font);
    for (int i = 0; i < row.getColumnCount(); ++i) {
      String text = row.getString(i);
      fill(0,0,0);
      pushMatrix();
      translate(width / 2, height / 2);
      rotate(2 * PI * float(i) / float(row.getColumnCount() ) );
      if (match(text,"/01/") != null) { 
	    text(text,0,width/3);
      }
      popMatrix();

    }
    
    //Cycle through all rows for graphing
    for (r = 1; r <= 2; ++r) {
      // Get row number 2 (you can get other rows)
      row = table.getRow(r);
      println("row: " + r);
      // Cycle through all of the columns in the row above.
      for (int i = 0; i < row.getColumnCount(); ++i) {
	//println("column: " + i);
	// Get the floating point value at row, and column i
	float value = row.getFloat(i);
	
	

 //println(r * 150, r*200, 0);
	stroke(255, 255/(r+1), r*33);
	
	// Push a matrix to allow easy rotation.
	// See http://processing.org/tutorials/transform2d/
	pushMatrix();
      
	// Move yoru draw position to the center.
	translate(width / 2, height / 2);
	  
	// Rotate around that draw position in equal increments.
	rotate(2 * PI * float(i) / float(row.getColumnCount() ) );
	
	// Draw a horizontal line scaled by the value.  
	// No need to worry about the trig.  It will be rotated
	// by the transformation matrix.
	line(0, 0, (width / 2 + 40)* value/1500000, 0);
	// Pop the matrix.
	popMatrix();
      }
      println("done");
    }
    
    // Exit the program for PDF print
  println("Finished.");
  exit();
  //pdf.nextPage();  // Tell it to go to the next page
  // }

  


}
