# split and transpose csv

require 'csv'

inputfile = 'CTA_-_Ridership_-_Daily_Boarding_Totals.csv'
inputcsv = CSV.read(inputfile, :headers => true)

(2001..2013).each do |year|
	CSV.open('csvs/' + year.to_s + '.csv', 'wb') do |outputcsv|
		outputdatearray = []
		outputbusarray = []
		outputrailarray = []
		inputcsv.each do |row|
			if row[0].class == String
				if row[0].match(year.to_s)
					outputdatearray.push(row[0])
					outputbusarray.push(row[2])
					outputrailarray.push(row[3])
				end
			else
				outputdatearray.push("0")
				outputbusarray.push("0")
				outputrailarray.push("0")
			end
		end
		outputcsv << outputdatearray
		outputcsv << outputbusarray
		outputcsv << outputrailarray
	end
end

CSV.open('csvs/alldata.csv', 'wb') do |outputcsv|
		outputdatearray = []
		outputbusarray = []
		outputrailarray = []
		inputcsv.each do |row|
			if row[0].class == String
				outputdatearray.push(row[0])
				outputbusarray.push(row[2])
				outputrailarray.push(row[3])
			else
				outputdatearray.push("0")
				outputbusarray.push("0")
				outputrailarray.push("0")
			end
		end
		outputcsv << outputdatearray
		outputcsv << outputbusarray
		outputcsv << outputrailarray
	end