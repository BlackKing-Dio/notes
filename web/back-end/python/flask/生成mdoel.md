1.根据数据库生成model

flask-sqlacodegen 'mysql+pymysql://root:cams36#^@192.168.33.236:3306/test'  --tables passwd --outfile "test.py"  --flask



如果出现类似如下报错：

sqlalchemy.exc.NoSuchTableError: `person`

请检查person是否为父表，如果有依赖关系需要保证此表存在



AttributeError: 'SQLAlchemy' object has no attribute 'ENUM' 

%s/db.ENUM/ENUM/g



递增问题：If this is an auto-generated value, check that the database table allows generation of new ..........:

autoincrement=True



另外添加：

from sqlalchemy.exc import SQLAlchemyError

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy import create_engine

from sqlalchemy.orm import sessionmaker

from app import db

#from .. import config

import sys

sys.path.append('app/')

import config

Base = declarative_base()

metadata = Base.metadata



2.根据model生成数据库，vi model.py

from flask import Flask

import pymysql

from flask_sqlalchemy import SQLAlchemy



app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:root@localhost:3306/artcms_pro"

app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True



db = SQLAlchemy(app)



class User(db.Model):

    __tablename__ = "user"

    id = db.Column(db.Integer, primary_key=True)  # 编号

    name = db.Column(db.String(20), nullable=False)

    pwd = db.Column(db.String(100), nullable=False)

    addtime = db.Column(db.DateTime, nullable=False)

 

    def __repr__(self):

        return "<User %r>" % self.name



class Art(db.Model):

    __tablename__ = "art"

    id = db.Column(db.Integer, primary_key=True)

    title = db.Column(db.String(100), nullable=False)

    cate = db.Column(db.Integer, nullable=False)

    user_id = db.Column(db.Integer, nullable=False)

    logo = db.Column(db.String(100), nullable=False)

    content = db.Column(db.Text, nullable=False)

    addtime = db.Column(db.DateTime, nullable=False)

 

    def __repr__(self):

        return "<User %r>" % self.title

 

if __name__ == "__main__":

    db.create_all()

运行 model.py





flask-sqlacodegen 'mysql+pymysql://root:cams36#^@192.168.9.207:3306/cams/charset=utf8'  --tables node_category,password,person,flask_node,portal,switch --outfile "cams_model.py"  --flask



##flask-sqlacodegen 'mysql+pymysql://root:cams36#^@192.168.9.207:3306/cams'  --tables ip4log,ip6log,node,node_category,password,person,locationlog,violation,flask_node,portal --outfile "cams_model.py"  --flask 





测试pp后这个命令

/bin/perl -I/usr/local/pf/lib '-Mpf::services::manager::httpd_admin' -e 'pf::services::manager::httpd_admin->new()->generateConfig()'



cd /usr/local/pf/sbin

pp -g -B -M Mojolicious -M DBI -M Log::Log4perl -M Readonly -M  Date::Parse -M Net::Interface -M Net::* -M threads -M File::** -M Linux::Distribution -M DateTime  -M POSIX::2008 -M LWP::Simple -M NetAddr::IP -M MIME::Lite::TT -M Crypt::** -M Time::Piece -M Config::** -M Tie::Array -M JSON::MaybeXS -o pfperl-api.xxx pfperl-api



/usr/local/pf/sbin/pfperl-api.xxx prefork -m production -l http://127.0.0.1:8080 --pid-file /usr/local/pf/var/run/pfperl-api.pid