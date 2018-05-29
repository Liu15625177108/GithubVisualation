import os
import  _thread
import requests
from urllib.parse import urlencode
from hashlib import md5
# from multiprocessing.pool import Pool
from multiprocessing.dummy import Pool as ThreadPool
import  pymysql


def myfun(language):
    url='https://api.github.com/search/repositories?'

    params = {
        'q': 'language:'+language,
        'sort':'star'
    }
    url=url+urlencode(params)
    print(url);

    db = pymysql.connect(host='localhost',user='root', password='123456', port=3306,db='gitdata')
    cursor = db.cursor()
    # if language=='C++':
    #      L='language'+'Cplus'
    # else:
    #      if language == 'C#':
    #         L = 'language' + 'Cshua'
    #      else:
    #         L = 'language' + language
    # sql = 'CREATE TABLE IF NOT EXISTS '+L+'(id VARCHAR(255) NOT NULL,   name VARCHAR(255) NOT NULL,star INT NOT NULL,url VARCHAR(255) NOT NULL, language VARCHAR(255) NOT NULL, PRIMARY KEY (id))'
    # cursor.execute(sql)
    response=requests.get(url).json();
    item = response.get('items')
    # sql = 'INSERT INTO '+L+'(id, name,url,star,language) values(%s, %s, %s,%s,%s)'
    sql = 'INSERT INTO Language(id, name,url,star,language) values(%s, %s, %s,%s,%s)'
    for it in item:
     id=it.get('id')
     name=it.get('full_name')
     url=it.get('html_url')
     star=it.get('stargazers_count')
     language=it.get('language')
     try:
      cursor.execute(sql, (id, name, url,star,language))
      db.commit()
     except:
            db.rollback()
    db.close()



if __name__=='__main__':
    db = pymysql.connect(host='localhost', user='root', password='123456', port=3306, db='gitdata')
    cursor = db.cursor()
    sql = 'CREATE TABLE IF NOT EXISTS Language(id VARCHAR(255) NOT NULL,   name VARCHAR(255) NOT NULL,star INT NOT NULL,url VARCHAR(255) NOT NULL, language VARCHAR(255) NOT NULL, PRIMARY KEY (id))'
    cursor.execute(sql)
    db.close()
    pool = ThreadPool()
    Language = ['JavaScript', 'Python', 'Java', 'PHP', 'Ruby', 'C++', 'C', 'C#', 'Shell', 'HTML']
    pool.map(myfun, Language)
    pool.close()
