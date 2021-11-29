#!/bin/bash
#design by waking 2020

# echo -e 1 | sh params_test.sh

# read -p "ni chou sha: " TARGET  #使用read命令实现交互式
# echo $TARGET
user_name=${USER}
ip="10.42.0.25"

password="Nano_Root_2020"



if [ -f "/${user_name}/.ssh/id_rsa.pub" ];
then
	# sudo swapoff root@$192.168.137.122:/ssd/
	echo "find id_rsa.pub! "
else
	echo "error:  /${user_name}/.ssh/id_rsa.pub　　 is not exist please make it: sudo ssh-keygen -t rsa -C "your_email@example.com" "
	break
fi
 
#expect自动交互开始  
expect -c "   
spawn ssh-copy-id -i /${user_name}/.ssh/id_rsa.pub root@$ip  
        expect {   
                \"*yes/no*\" {send \"yes\r\"; exp_continue}   
                \"*password*\" {send \"$password\r\"; exp_continue}   
                \"*password*\" {send \"$password\r\";}   
        }   
"   
echo "写入ssh文件......"
ssh root@$ip 'hostname'

echo "root ok ......"

password="Nano_Xiao"


if [ -f "/${user_name}/.ssh/id_rsa.pub" ];
then
	# sudo swapoff inano@$192.168.137.122:/ssd/
	echo "find id_rsa.pub! "
else
	echo "error:  /${user_name}/.ssh/id_rsa.pub　　 is not exist please make it:  sudo ssh-keygen -t rsa -C "your_email@example.com" "
	break
fi
 
#expect自动交互开始  
expect -c "   
spawn ssh-copy-id -i /${user_name}/.ssh/id_rsa.pub inano@$ip  
        expect {   
                \"*yes/no*\" {send \"yes\r\"; exp_continue}   
                \"*password*\" {send \"$password\r\"; exp_continue}   
                \"*password*\" {send \"$password\r\";}   
        }   
"   
echo "写入ssh文件......"
ssh inano@$ip 'hostname'
echo "inano ok ......"

echo "sudo 免密结束"
