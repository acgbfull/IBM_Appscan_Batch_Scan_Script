# IBM AppScan批量扫描脚本

## Description

**IBM AppScan**是一款Web应用程序安全漏洞扫描工具，其图形化界面不能批量扫描，需要通过调用其自带的AppScanCMD.exe实现，故编写该批量扫描脚本。


## Operating Environment

> Microsoft Windows
> 
> IBM Security AppScan


## Configuration Guide
配置参数位于ibm_appscan_batch_scan_script.bat的上部，存在注释，请根据实际设置参数值。
templet.scant（已配置为快速扫描）为AppScan的扫描配置，需要变更请于AppScan的图形化界面进行扫描配置后导出使用。


## Installation Guide

>git clone https://github.com/acgbfull/IBM_Appscan_Batch_Scan_Script.git


## Usage
> 根据实际于ibm_appscan_batch_scan_script.bat中设置好参数的值
> 
> 直接运行ibm_appscan_batch_scan_script.bat


## Change Log

> 2019/02/15  version:1.0.0
