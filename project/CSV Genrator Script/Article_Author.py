# -*- coding: utf-8 -*-
"""
Created on Mon Dec  9 19:51:33 2019

@author: vidhy
"""


import pandas as pd
import ast

author_id = ['author_id ']
article_id = ['article_id ']

author = pd.read_csv(r"authors.csv",encoding='utf-8')
author_id = author['_id'].tolist()

#author_name=author.loc['fname','lname'];

author_name = list(author['fname'].astype(str)+ ' ' + author['lname'])
article = pd.read_csv('articles.csv',encoding='utf-8')
article_id = article['Article_id'].tolist()
article_author = article['Authors'].tolist()
article_author = [ast.literal_eval(i) for i in article_author]
result = []
count = 0
for i in range(len(article_author)):
    for j in range(len(article_author[i])):
        result.append([count, author_id[author_name.index(article_author[i][j])], article_id[i]])
        count = count + 1
pd.DataFrame(result).to_csv("article_author.csv", index=False, header=['art_auth_id', 'author_id', 'article_id'])