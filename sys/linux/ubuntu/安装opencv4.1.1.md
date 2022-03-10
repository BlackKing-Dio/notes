# 环境
ubuntu 20.04
# 安装 HDF5
sudo apt-get install -y hdf5-tools
# 安装 tesseract
sudo apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev
# ccache
sudo apt-get install -y ccache

# 安装cmake-gui

# 安装gstreamer1.0
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

安装编解码库(软解)
sudo apt install gstreamer1.0-libav

一劳永逸的安装所有插件:
sudo apt-get install gstreamer-plugins-*
sudo apt-get install gstreamer-*


# 安装opencv4.1.1
### 失败
opencv-4.1.1：https://codeload.github.com/opencv/opencv/zip/4.1.1
opencv-contrib-4.1.1：https://codeload.github.com/opencv/opencv_contrib/zip/4.1.1

在这里要找到三个地方进行修改;
1、勾选上BUILD_opencv_world
2、在CMAKE_BUILD_TYPE后填上：RELEASE
3、在OPENCV_EXTRA_MODULES_PATH后填上opencv-contrib/modules的路径，比如：/home/wsx/opencv/opencv/opencv_contrib/modules
    勾选这个之后，会下载如下文件
    boostdesc_bgm.i
    boostdesc_bgm_bi.i
    boostdesc_bgm_hd.i
    boostdesc_lbgm.i
    boostdesc_binboost_064.i
    boostdesc_binboost_128.i
    boostdesc_binboost_256.i
    vgg_generated_120.i
    vgg_generated_64.i
    vgg_generated_80.i
    vgg_generated_48.i
    这些文件需要翻墙才能顺利的下载完成
    如果不选填OPENCV_EXTRA_MODULES_PATH，那么python调用opencv就会无法使用gst管道等功能
4、勾选所有python相关的选项
5、勾选gst相关选项

### 安装4.5.5
### 失败
opencv-4.1.1：https://codeload.github.com/opencv/opencv/zip/4.5.5
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DPYTHON_DEFAULT_EXECUTABLE=$(which python3.8) -DPYTHON3_EXECUTABLE=$(which python3.8) -DWITH_GSTREAMER=ON -DPYTHON3_INCLUDE_DIR=/usr/include/$PY_NAME -DPYTHON3_INCLUDE_DIR2=/usr/include/aarch64-linux-gnu/$PY_NAME -DPYTHON3_LIBRARY=/usr/lib/aarch64-linux-gnu/lib$PY_NAME.so -DPYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/$PY_NAME/dist-packages/numpy/core/include/ -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF ..
make -j 8
sudo make install

### 3
sudo apt-get install libwebp-dev

# 卸载opencv
cd /xxx/build/
sudo make uninstall
cd ..
sudo rm -rf build/
sudo rm -rf /usr/local/bin/opencv_*
sudo rm -rf /usr/local/lib/libopencv_*
sudo rm -rf /usr/local/share/opencv4/
sudo rm -rf /usr/local/include/opencv4/

