import requests
from bs4 import BeautifulSoup
with open('sampledata.txt', 'w', encoding='utf-8') as f:
	f.write("courses_list = [")
	urllist = ["https://crs.upd.edu.ph/schedule/120192/A", "https://crs.upd.edu.ph/schedule/120192/B", "https://crs.upd.edu.ph/schedule/120192/C", 
	"https://crs.upd.edu.ph/schedule/120192/D", "https://crs.upd.edu.ph/schedule/120192/E", "https://crs.upd.edu.ph/schedule/120192/F", 
	"https://crs.upd.edu.ph/schedule/120192/G", "https://crs.upd.edu.ph/schedule/120192/H", "https://crs.upd.edu.ph/schedule/120192/I", 
	"https://crs.upd.edu.ph/schedule/120192/J", "https://crs.upd.edu.ph/schedule/120192/K", "https://crs.upd.edu.ph/schedule/120192/L", 
	"https://crs.upd.edu.ph/schedule/120192/M", "https://crs.upd.edu.ph/schedule/120192/N", 
	"https://crs.upd.edu.ph/schedule/120192/P", "https://crs.upd.edu.ph/schedule/120192/R", 
	"https://crs.upd.edu.ph/schedule/120192/S", "https://crs.upd.edu.ph/schedule/120192/T", 
	"https://crs.upd.edu.ph/schedule/120192/V", "https://crs.upd.edu.ph/schedule/120192/W"]
	a = 0
	while a < len(urllist):
		#URL to be scraped
		url_to_scrape = urllist[a]
		#statements for notepad scraping
		# f.write("FOR ")
		# f.write(url_to_scrape)
		# f.write("")
		# f.write("\n")

		#Load html's plain data into a variable
		plain_html_text = requests.get(url_to_scrape)
		#parse the data
		soup = BeautifulSoup(plain_html_text.text, "html.parser")

		basic_data_table = soup.find("table", id = "tbl_schedule")

		#Determines the number of rows and columns per table
		rows = basic_data_table.findAll('tr')[1:]
		row_length = [len(r.findAll(['th','td'])) for r in rows]
		nrows = len(rows)
		ncols = max(row_length)

		#makes into array of arrays
		for i in range(nrows):
			rows[i]=rows[i].findAll(['th', 'td'])

		#makes into simple table
		for i in range(nrows):
		    row = rows[i]
		    for j in range(len(row)):
		        col = row[j]
		        del col['style']
		        if (col.get('rowspan')):
		            rSpanLen = int(col.get('rowspan'))
		            del col['rowspan']
		            for k in range(1, rSpanLen):
		                rows[i+k].insert(j,col)

		newtable = '<table class="new">'

		# creates table again
		for i in range(nrows):
		    row = rows[i]
		    newtable += '<tr>'
		    for j in range(len(row)):
		        col = row[j]
		        rowStr=str(col)
		        newtable += rowStr
		    newtable += '</tr>'

		newtable += '</table>'

		#parsing part2
		soupTable = BeautifulSoup(newtable, "html.parser")

		#Determines number of rows and columns
		newrows = soupTable.findAll('tr')
		newrowlength = [len(r.findAll(['th','td'])) for r in newrows]
		norows = len(newrows)
		nocols = max(row_length)

		#makes into array of arrays
		for i in range(norows):
			newrows[i]=newrows[i].findAll(['th', 'td'])

		for i in range(norows):
			currentrow = newrows[i]
			# f.write("INSERT INTO courses values (")
			f.write ("[")
			for j in range(len(currentrow)):
				if j < 4:
					if j == 0:
						class_code = currentrow[j].text.strip()
						f.write("'")
						f.write(class_code)
						f.write("'")
						f.write(", ")
					if j == 1:
						class_name = currentrow[j].text.strip()
						f.write("'")
						f.write(class_name)
						f.write("'")
						f.write(", ")
					if j == 2:
						credits = currentrow[j].text.strip()
						f.write("'")
						f.write(credits)
						f.write("'")
						f.write(", ")
					if j == 3:
						line = currentrow[j].text.splitlines()
						addr = []
						for i in range(len(line)):
							newline = line[i].strip()
							addr.append(newline)
						newarray = addr[1].split()
						nelem = len(newarray)
						if nelem == 1:
							schedule = "TBA"
							room_place = "TBA"
							f.write("'")
							f.write(schedule)
							f.write("'")
							f.write(",")
							f.write("'")
							f.write(room_place)
							f.write("'")
							f.write(",")
						else:
							if(len(newarray)==0):
								schedule = "TBA"
								room_place = "TBA"
								f.write("'")
								f.write(schedule)
								f.write("'")
								f.write(",")
								f.write("'")
								f.write(room_place)
								f.write("'")
								f.write(",")
							else:
								schedule = newarray[0] + " " + newarray[1]
								room_place = ' '.join(newarray[2:])
								f.write("'")
								f.write(schedule)
								f.write("'")
								f.write(",")
								f.write("'")
								f.write(room_place)
								f.write("'")
								f.write(",")
						instructor = addr[2]
						f.write("'")
						f.write(instructor)
						f.write("'")
						# f.write(")")
						f.write("], ")
				else:
					continue				
			# f.write("\n")
		a += 1
	f.write("]")
	f.close()