with open('outputdata.txt', 'w', encoding = 'utf-8') as g:
	import json
	tweets = []
	firstname = []
	lastname = []
	helpfulness = []
	easiness = []
	pedagogy = []
	overall = []
	nodata = [2155, 2156, 2157, 2158, 2159, 2160, 2161, 2162, 2163, 2164, 2165, 2166]
	modifiedrupp = []

	for line in open('prlist.json', 'r'):
	    tweets.append(json.loads(line))

	i = 0
	while i < len(tweets):
		if i in nodata:
			i += 1
			continue
		else:
			firstname.append(tweets[i]['firstName'])
			lastname.append(tweets[i]['lastName'])
			helpfulness.append(list(tweets[i]['rating']['helpfulness'].values())[0])
			easiness.append(list(tweets[i]['rating']['easiness'].values())[0])
			pedagogy.append(list(tweets[i]['rating']['pedagogy'].values())[0])
			overall.append(list(tweets[i]['rating']['overall'].values())[0])
			i += 1

	j = 0
	g.write("instructor_list = [")
	while j < len(firstname):
		tempdata = "'" + lastname[j] + ", " + firstname[j] + "' , " + str(helpfulness[j]) + ", " + str(easiness[j]) + ", " + str(pedagogy[j]) + ", " + str(overall[j])
		g.write("[")
		g.write(tempdata)
		if j == (len(firstname) - 1):
			g.write("]]")
		else:
			g.write("], ")
		j += 1
	g.close()
