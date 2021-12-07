django 3.1.1

1.安装：pip3 install dwebsocket

2.去django项目的setting.py下配置如下信息：

```python
WEBSOCKET_ACCEPT_ALL= True

INSTALLED_APPS = [

	........

    'dwebsocket',

	.........

]

MIDDLEWARE_CLASSES= ['dwebsocket.middleware.WebSocketMiddleware']
```

3.view.py下的接口这样写

```python
from dwebsocket.decorators import accept_websocket

@accept_websocket
def ws_test(request):
    if request.is_websocket():
        message = request.websocket.wait()
        count = 0
        while True:
            if message:
                .....
                request.websocket.send(...)
                ....
```



4.配置urls.py

```python
from django.urls import path
from django.conf.urls import *
from .views import *

urlpatterns = [
    path('ws_test/',ws_test),
]
```

