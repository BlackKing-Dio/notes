#!/bin/bash
#design by waking 2020


./shell/no_pw.sh
echo "普通用户免密结束......"
sleep 2
sudo ./shell/no_sudo_pw.sh
echo "su用户免密结束......"

