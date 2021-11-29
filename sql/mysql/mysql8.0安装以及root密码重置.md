```shell
sudo apt-get install mysql-server
```

```sql
use mysql;
ALTER user 'root'@'localhost' IDENTIFIED BY 'xxx';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'xxx';
FLUSH PRIVILEGES;
```