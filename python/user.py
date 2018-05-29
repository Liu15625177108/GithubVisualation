import os
import  _thread
import requests
from urllib.parse import urlencode
from hashlib import md5
# from multiprocessing.pool import Pool
from multiprocessing.dummy import Pool as ThreadPool
import  pymysql

def myfun(language):
    url='https://api.github.com/search/users?'

    params = {
        'q': 'language:'+language,
        'sort':'followers'
    }
    url=url+urlencode(params)
    print(url);

    db = pymysql.connect(host='localhost',user='root', password='123456', port=3306,db='gitdata')
    cursor = db.cursor()
    if language=='C++':
         L='User_'+'Cplus'
    else:
         if language == 'C#':
            L = 'User_' + 'Cshua'
         else:
            L = 'User_' + language
    sql = 'CREATE TABLE IF NOT EXISTS '+L+'(name VARCHAR(255) NOT NULL,url VARCHAR(255) NOT NULL, PRIMARY KEY (name))'
    cursor.execute(sql)
    response=requests.get(url).json();
    item = response.get('items')
    sql = 'INSERT INTO '+L+'(name,url) values(%s, %s)'
    for it in item:

     name=it.get('login')
     url=it.get('html_url')

     try:
      cursor.execute(sql, (name,url))
      db.commit()
     except:
            db.rollback()
    db.close()



if __name__=='__main__':
    pool = ThreadPool()
    Language = ['JavaScript', 'Python', 'Java', 'PHP', 'Ruby', 'C++', 'C', 'C#', 'Shell', 'HTML']

    pool.map(myfun, Language)
    pool.close()