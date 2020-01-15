h = open('author.csv')
csv_f = csv.reader(h)
next(csv_f)
h = open('insert_queries2.sql', 'w')
for row in csv_f:
  h.write(str("insert into AUTHOR(lname,fname,email) values (")+str("'")+row[1]+str("','")+row[0]+str("','")+row[2]+str("');")+str('\n'))
h.close()