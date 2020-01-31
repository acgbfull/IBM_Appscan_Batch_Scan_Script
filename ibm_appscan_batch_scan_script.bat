@echo off
setlocal enabledelayedexpansion
title IBM AppScan batch scan script By T00ls.Net
echo --------------------------------------------------------------------------------
echo                     IBM AppScan batch scan script
echo                                                  ---By acgbfull
echo                                                  ---By T00ls.Net
echo --------------------------------------------------------------------------------
rem 需要扫描的目标列表路径
set targets=.\targets.txt
rem AppScanCMD.exe路径
set appscancmd="F:\program\appscan_standard_9.0.3.11\AppScanCMD.exe"
rem 扫描模板路径 
set templet_path=.\template\9.0.3.11_templet.scant
rem 扫描结果保存目录
set save_dir=.\results\


mkdir %save_dir% 2>nul
rem 提醒用户保存好已存在的扫描结果
for /f  %%j in ('dir /b %save_dir%') do (
if exist %save_dir%%%j (
echo 扫描结果保存目录：%save_dir%存在文件，请清空后再运行本脚本
pause
exit
)
)


rem ping需扫描域名，防止appscan报无法连接至网站
rem 然后新建appscan扫描任务并自动导出pdf报告
for /f "tokens=1,2,* delims=/" %%k in (%targets%) do (
set url=%%k//%%l/%%m
ping -n 6 %%l
%appscancmd% /e /su !url! /st %templet_path% /d %save_dir%%%l.scan /rf %save_dir%%%l安全报告.pdf /rt pdf /v
echo --------------------------------------------------------------------------------
)
del RCL_API_Log_Sample*
pause