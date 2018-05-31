import os
import  _thread
import requests
from urllib.parse import urlencode
from hashlib import md5
# from multiprocessing.pool import Pool
from multiprocessing.dummy import Pool as ThreadPool
import  pymysql
from requests.exceptions import ReadTimeout

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


    try:
     response = requests.get(url,auth=('usename','passward')).json()
     item = response.get('items')
    except ReadTimeout:
         print('error')
    sql = 'INSERT INTO Repository(id, name,star,url,language) values(%s, %s, %s,%s,%s)'
    if item:
        for it in item:
            id=it.get('id')
            name=it.get('full_name')
            url=it.get('html_url')
            star=it.get('stargazers_count')
            language=it.get('language')
            print(id,name,star,url,language)
            try:
              cursor.execute(sql, (id, name,star,url,language))
              db.commit()
            except:
             db.rollback()
    db.close()



if __name__=='__main__':
    db = pymysql.connect(host='localhost', user='root', password='123456', port=3306, db='gitdata')
    cursor = db.cursor()
    cursor.execute("DROP TABLE IF EXISTS Repository")
    sql = 'CREATE TABLE IF NOT EXISTS Repository(id VARCHAR(255) NOT NULL,name VARCHAR(255) NOT NULL,star INT NOT NULL,url VARCHAR(255) NOT NULL, language VARCHAR(255) NOT NULL, PRIMARY KEY (id))'
    cursor.execute(sql)
    db.close()
    pool = ThreadPool()
    Language = ['JavaScript', 'Python', 'Java', 'PHP', 'Ruby', 'C++', 'C', 'C#', 'Shell', 'HTML']
    pool.map(myfun, Language)
    pool.close()
