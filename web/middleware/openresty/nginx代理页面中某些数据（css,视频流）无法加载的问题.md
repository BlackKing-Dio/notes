最近碰到了nginx代理一个页面后
proxy_pass  http://8.1.1.1:6080/binding.html;
js加载成功，css却无法加载的问题。

解决办法：
1.http{}中添加

```conf
include /usr/local/openresty/nginx/conf/mime.types;
default_type application/octet-stream;
```

2.或者修改mime.types中css的type为application/octet-stream；

原因：互联网中web服务器与浏览器通讯时，所有数据都是需要指定文件类型(type)的，否则浏览器不知道用什么插件来处理这些数据，比如音频数据就要指定mid,.midi audio/midi,audio/x-midi等类型。
而我的服务器中的css文件在被nginx代理后，nginx找了原来html中对该css文件的type定义：
```html
<link rel="stylesheet" href="css/style.css">
```
没有type！！！
所以就报错了！nginx不知道用什么编码方式传输这类文件（它是不知道啥css的）
所以定义default_type application/octet-stream 后，nginx不管是什么文件类型，同意按字节流的类型进行转发，这样才最后传输到客户端浏览器上。

那么问题来了，既然nginx那边是以字节流转发给了浏览器，浏览器不知道这是css文件，只是一堆字节流，为什么还能被加载出来？
因为现在主流浏览器也能默认识别出css文件的，很多开发者已经习惯不给css写这东西了，但是对于很多特殊的数据类型，最好还是定义一下。
特别的，像nginx这类的代理，毕竟是轻量级的，没有浏览器那么强大的识别能力，所以，为了考虑兼容性，还是应该严谨一点
