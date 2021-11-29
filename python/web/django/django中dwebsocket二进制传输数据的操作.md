# 修改源码

路径:

```shell
/home/你的用户名/.local/lib/python版本号/site-packages/dwebsocket/backends/default/websocket.py
```
在其原来的代码中中，源代码是这样的:

```python
def send(self, message):
    '''
    Send a message to the client. message should be convertable to a
    string; unicode objects should be encodable as utf-8.
    '''
    if not self.closed:
        self.protocol.write(message)
```
修改后的:

```python
def send(self, message, binary=False):
    '''
    Send a message to the client. message should be convertable to a
    string; unicode objects should be encodable as utf-8.
    '''
    if not self.closed:
        self.protocol.write(message, binary)
```
# 使用方法

调用的时候记得采用为request.websocket.send(data,True)，比原版的输入参数多个True。
可以传送二进制数据。而js接收的时候用arraybuffer接收