## 报错go.mod file not found in current directory or any parent directory; see 'go help modules'
go env -w GO111MODULE=auto

## 安装模块
<!-- go install go.mongodb.org/mongo-driver/mongo@latest -->
go get -d go.mongodb.org/mongo-driver/mongo@latest

## 运行单个脚本
go run xxx.go

## 
go build
go init