
goinstall 报错：
go: github.com/emicklei/proto@v1.9.0: Get "https://proxy.golang.org/github.com/emicklei/proto/@v/v1.9.0.mod": dial tcp 108.177.125.141:443: i/o timeout

解决：
```shell
go env -w  GOPROXY="https://goproxy.io"
```

报错：
dial tcp: lookup goproxy.onetool.net: no such host
解决：
关闭lantern等翻墙代理