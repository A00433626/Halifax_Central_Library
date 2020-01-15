# -*- coding: utf-8 -*-
"""
Created on Mon Dec  9 22:11:31 2019

@author: vidhy
"""


import csv
h = open(r'New_Article.csv')
                             
csv_f = csv.reader(h)
next(csv_f)
h = open('insert_queries_Articles.sql', 'w')
for row in csv_f:
    h.write(str("insert into ARTICLE(Title,pages,volumeNumber) values (")+str("'")+row[2]+str("'")+str(",")+str("'")+row[3]+str("'")+str(",")+row[1]+str(");")+str('\n'))
h.close()

