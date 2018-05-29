
import os
import  _thread
import requests
from urllib.parse import urlencode
from hashlib import md5
# from multiprocessing.pool import Pool
from multiprocessing.dummy import Pool as ThreadPool
import  pymysql



def myfun(area):
    url='https://api.github.com/search/users?'

    params = {
        'q': 'location:'+area,

    }
    url=url+urlencode(params)
    print(url);

    db = pymysql.connect(host='localhost',user='root', password='123456', port=3306,db='gitdata')
    cursor = db.cursor()
    # sql = 'CREATE TABLE IF NOT EXISTS '+L+'(id VARCHAR(255) NOT NULL,   name VARCHAR(255) NOT NULL,star INT NOT NULL,url VARCHAR(255) NOT NULL, language VARCHAR(255) NOT NULL, PRIMARY KEY (id))'
    # cursor.execute(sql)
    response=requests.get(url).json();
    count=response.get('total_count')
    sql = 'INSERT INTO Location(location,usernum) values(%s, %s)'
    try:
        cursor.execute(sql, (area,count))
        db.commit()
    except:
        db.rollback()
    db.close()




if __name__=='__main__':
    db = pymysql.connect(host='localhost', user='root', password='123456', port=3306, db='gitdata')
    cursor = db.cursor()
    sql = 'CREATE TABLE IF NOT EXISTS  Location(location VARCHAR(255) NOT NULL, usernum int NOT NULL , PRIMARY KEY (location))'
    cursor.execute(sql)
    pool = ThreadPool()
    area = ['Beijing','Shanghai','Chongqing','Hebei','Henan','Hubei','Hunan','Jiangsu','Jiangxi',
            'Liaoning','Jilin'
            ]
    pool.map(myfun, area)
    pool.close()