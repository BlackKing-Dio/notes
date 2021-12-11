```
pip install django-crontab
```

```
INSTALLED_APPS = (

'django_crontab',#这个不是app的名字，必须要添加到前面，不能接着app后面添加，否则会报错

)
```

```
import datetime

from COVID_19Analyse.models import Country, CountryData
 


from COVID_19Analyse.tools.datetimeSupport import TimeTools

from COVID_19Analyse.tools.DataSpider import DataSpider

 

def hourUpdate():
  xxx
  xxxx

  print("-----------------更新结束-----------------")

  print()
```

```
CRONJOBS = [
('*/3 * * * *', 'courses.playtime_add.hourUpdate','>>/home/iflyrob/django_iflyrob_dev1/log/playtime_add.txt'),]
```

```
python manage.py crontab add 
```

启动django



```
python manage.py crontab show
```

```
python manage.py crontab remove
```