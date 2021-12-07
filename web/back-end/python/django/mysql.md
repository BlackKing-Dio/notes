1.setting.py

INSTALLED_APPS = [

    'django.contrib.admin',

    'django.contrib.auth',

    'django.contrib.contenttypes',

    'django.contrib.sessions',

    'django.contrib.messages',

    'django.contrib.staticfiles',

    'app',  #添加应用模块

]



DATABASES = {

    'default': {

        'ENGINE': 'django.db.backends.mysql',

        'NAME': 'cams',

        'USER':'root',

        'PASSWORD':'cams36#^',

        'HOST':'192.168.33.236',

        'PORT':'3306',

        'OPTIONS': {

            'init_command': 'SET sql_mode="STRICT_TRANS_TABLES"',

            'charset': 'utf8mb4'

        }

    }

}



2.model.py

#如果已有数据库

python manage.py inspectdb > models.py

将要用的表中改成 managed = True



#如果没有，直接编辑app/model.py



运行以下命令

python3 manage.py makemigrations #生成迁移

python3 manage.py migrate #执行迁移





3.解决django不支持pymysql的问题

vi web/__init__.py



import pymysql

pymysql.install_as_MySQLdb()



cd lib/python3.7/site-packages/django/db/backends/mysql

vi base.py : 注释一下两行

if version < (1, 3, 3):

     raise ImproperlyConfigured("mysqlclient 1.3.3 or newer is required; you have %s" % Database.__version__)



vi operations.py:



if query is not None:

    query = query.decode(errors='replace')

return query

#改为

if query is not None:

    query = query.encode(errors='replace')

return query



4.导入到xxpy

from api.models import Node,Ip4Log,Ip6Log,Locationlog,NodeCategory,Person