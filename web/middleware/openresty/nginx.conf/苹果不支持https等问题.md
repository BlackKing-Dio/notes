1.https 代理http端口(下级链接无SSL加密)，支持

2.https代理http端口(下级链接有SSL加密)，支持

3.http代理https端口,不支持

4.页面中有外部链接，链接地址为https，仅当地址为域名且端口为443才支持

5.页面中有外部链接，链接地址为http，则该链接下级必须为单纯的http才支持。比如有个链接是http://123.43.2.3，80端口，实际有SSL加密过并伪装的，这种时候苹果也是访问不了的，需要在123.43.2.3外面套一层https代理（https://62.65.22.33）（前提是代理服务器能22.33访问之前的123.43.2.3 http端口）,外部链接再全部指向https://62.65.22.33