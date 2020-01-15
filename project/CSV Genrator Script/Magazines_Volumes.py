# -*- coding: utf-8 -*-
"""
Created on Mon Dec  9 18:59:37 2019

@author: vidhy
"""
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import csv

Volume_id = ['Volumn']
Pub_Year = ['Year']
Magazine_ID = ['Magazine_id']

with open(r"articles.csv") as csvfile:
    readCSV = csv.DictReader(csvfile, delimiter=',')
    for row in readCSV:
        if row['Volumn'] in Volume_id:
            continue
        Volume_id.append(row['Volumn'])
        Pub_Year.append(row['Year'])
        name = row['Journal']

        with open(r"Magazines.csv") as csvfile2:
            readCSV2 = csv.DictReader(csvfile2, delimiter=',')
            for rowm in readCSV2:
                if name == rowm['Journal']:
                    Magazine_ID.append(rowm['Magazine_id'])


X = [list(a) for a in zip(Volume_id, Pub_Year, Magazine_ID)]

with open (r"Magazine_Volume.csv", "wb") as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(X)