# -*- coding: utf-8 -*-
"""
Created on Mon Dec  9 21:41:10 2019

@author: vidhy
"""

import csv
h = open(r'Magazines.csv')
                             
csv_f = csv.reader(h)
next(csv_f)
h = open('insert_queries_Magazines.sql', 'w')
for row in csv_f:
    h.write(str("insert into Magazines(name) values (")+str("'")+row[1]+str("');")+str('\n'))
h.close()
