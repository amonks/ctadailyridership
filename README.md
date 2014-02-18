ctadailyridership
=================

Visualization of the CTA's daily ridership.

Busses are blue, trains are red.

Check out [the images](https://github.com/amonks/ctadailyridership/tree/master/images)

## four components:

1. the original dataset, `CTA_-_Ridership_-_Daily_Boarding_Totals.csv`. Note that October 2011 is included twice.

2. `split-by-year-and-transpose.rb` takes the dataset and generates a transposed headerless .csv for each year, and another with all the data total. These .csvs go into `/csvs/`.

3. `ctadailyridership-circles.pde` is intended to graph one year of data into a circular graph. It's saved into `/pdfs/[year].pdf`

4. `ctadailyridership-bars.pde` is intended to graph any amount of data into a bar graph. It's saved into `/pdfs/alldata.pdf`

5. `convert-to-pngs.workflow` is intended to convert the pdf output of the processing sketches into `.png` image files, saved into `/images/`