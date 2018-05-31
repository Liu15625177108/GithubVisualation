import os
import  _thread
import requests
from urllib.parse import urlencode
from hashlib import md5
# from multiprocessing.pool import Pool
from multiprocessing.dummy import Pool as ThreadPool
import  pymysql


def getFollowers(url):

    res=requests.get(url,auth=('usename','passward')).json()
    id=res.get('id')
    followers=res.get('followers')
    name=res.get('name')
    db = pymysql.connect(host='localhost', user='root', password='123456', port=3306, db='gitdata')
    cursor = db.cursor()
    sql='update user set followers={} where id={}'.format(followers,id)
    print(url,sql)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    db.close()
    # print(followers,name)

def myfun(language):
    url='https://api.github.com/search/users?'


    params = {
        'q': 'language:'+language,
        'sort':'followers'
    }
    url=url+urlencode(params)
    # print(url)
    # res=requests.get(url,auth=('usename','passward')).json()
    # items=res.get('items')
    # url1=[]
    # for item in items:
    #     id=item.get('id')
    #     login=item.get('login')
    #     url=item.get('html_url')
    #     url1.append(item.get('url'))
    #     # response=requests.get(url1).json()
    #     # name=response.get('name')
    #     # followers=response.get('followers')
    #     print(id,login,url)
    # print('++++++++++++++++++++++++++')
    # pool1 = ThreadPool()
    # pool1.map(getFollowers,url1)
    # pool1.close()

    db = pymysql.connect(host='localhost', user='root', password='123456', port=3306, db='gitdata')
    cursor = db.cursor()
    response=requests.get(url,auth=('usename','passward')).json()
    item = response.get('items')
    url1=[]
    sql = 'INSERT INTO User(id,name,url,language) values(%s,%s,%s,%s)'
    for it in item:
     id=it.get('id')
     name=it.get('login')
     url=it.get('html_url')
     url1.append(it.get('url'))
     # url1=it.get('url')
     # res=requests.get(url1,auth=('usename','passward')).json()
     # followers=res.get('followers')
     # name=res.get('name')
     try:
      print(id,name,url,language)
      cursor.execute(sql, (id,name,url,language))
      db.commit()
     except:
            db.rollback()
    db.close()
    pool1=ThreadPool()
    pool1.map(getFollowers,url1)
    pool1.close()
    print (language,'finish!')



if __name__=='__main__':
    db = pymysql.connect(host='localhost', user='root', password='123456', port=3306, db='gitdata')
    cursor = db.cursor()
    cursor.execute("DROP TABLE IF EXISTS user")
    sql = 'CREATE TABLE IF NOT EXISTS User(id INT NOT NUll,name VARCHAR(255) NOT NULL,url VARCHAR(255) NOT NULL,followers INT ,language VARCHAR(50) NOT NULL,PRIMARY KEY (id))'
    cursor.execute(sql)
    db.close()
    pool = ThreadPool()
    Language = ['JavaScript', 'Python', 'Java', 'PHP', 'Ruby', 'C++', 'C', 'C#', 'Shell', 'HTML']
    pool.map(myfun, Language)
    pool.close()
