
# 2020年新工科联盟-Xilinx暑期学校（Summer School）项目。


## 项目名称：   MD5加密与QSPI串口通信
   
## 项目概要
  + 设计的目的：
               利用FPGA提升MD5加密的运算速度
  + 相关知识：
               MD5加密算法、qspi串口通信、esp32编程开发
  + 应用方向：  可将FPGA与传统CPU、MCU建立通信利用FPGA并行计算加速的特性，提升传统处理器的算力。
## 技术方向
  + 本项目的核心是MD5校验算法，MD5码以512位分组来处理输入的信息，且每一分组又被划分为16个32位子分组，经过了一系列的处理后，算法的输出由四个32位分组组成，将这四个32位分组级联后将生成一个128位散列值。
其次扩展结合了QSPI通信，ESP32搭建QSPI传输环境后，可以作为QSPI通信主机与FPGA进行数据交互。QSPI通信模块将ESP32传输的QSPI信号解析为指令、地址、数据，将对应的数据存在FPGA侧RAM的对应地址中。 

## 已实现功能
已实现的功能：利用QSPI在FPGA建立从机通信模块，实现esp32与FPGA的数据通信，通过计算机串口控制esp32,控制FPGA的数据输入输出。实现直接从串口发送所要加密数据，并且直接读取所得MD5加密hash值返回到计算机串口监视器。
## 项目成员
   
  + 王天淏
  + 丁桢炎
           

## ⼯具版本
   + vivado2018.3  
   + ardunio1.8
   + ucraft 1.2
## 板卡型号与外设列表
   + 板卡型号: SEA
   + 芯片型号：spartan7 xcs15
## 仓库⽬录介绍
   + ExecutableFiles
   
          存放bitstream文件
                        
   + MD5_EECE  
   
           MD5加密vivado工程
                        
   + Sourcecode 
   
           verilog源文件
 
## 作品照片
![your-picture](images/1.png?raw=true) 国内DNS污染无法展示，images下载查看
