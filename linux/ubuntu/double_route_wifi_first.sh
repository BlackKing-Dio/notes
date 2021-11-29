#!/bin/bash
#design by waking 2020
echo "初始的默认网关"
ip route  show
echo "正在修改..."
sudo route del default gw 10.40.26.1

sudo route add default gw 10.40.40.1

echo "修改完毕"

echo "当前默认网关"
ip route  show