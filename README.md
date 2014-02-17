ctadailyridership
=================

processing visualization of the cta daily ridership

## four components:

1. the original dataset, `CTA_-_Ridership_-_Daily_Boarding_Totals.csv`. Note that October 2011 is included twice.

2. `split-by-year-and-transpose.rb` takes the dataset and generates a transposed headerless .csv for each year, and another with all the data total. These .csvs go into `/csvs/`.

3. `ctadailyridership-circles.pde` is intended to graph one year of data into a circular graph. It's saved into `/pdfs/[year].pdf`

3. `ctadailyridership-bars.pde` is intended to graph any amount of data into a bar graph. It's saved into `/pdfs/alldata.pdf`