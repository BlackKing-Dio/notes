# 关闭/swapfile
    sudo swapoff /swapfile

# 调整大小
    sudo dd if=/dev/zero of=/swapfile bs=1M count=16k
    ##swapfile == 16GB
    ##注：从 /dev/zero 文件读出内容并存到/swapfile文件中，块大小为1MByte，总共 16K 个块，也就是总共 16GB

# 格式化新的/swapfile
sudo mkswap /swapfile

# 启动/swapfile
sudo swapon /swapfile