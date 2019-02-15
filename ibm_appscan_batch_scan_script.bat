@echo off
setlocal enabledelayedexpansion

rem 需要ping的目标列表路径
set file_list_ping=./domain.txt
rem 需要扫描的目标列表路径
set file_list=./site.txt
rem AppScanCMD.exe路径
set appscancmd=C:/Program Files (x86)/IBM/AppScan Standard/AppScanCMD.exe
rem 扫描模板路径
set templet_path=./templet.scant
rem 扫描结果保存目录
set save_dir=./
rem 扫描结果文件名
set /a n=415

rem 循环ping domain
for /f  %%p in (%file_list_ping%) do (
ping -n 6 %%p
)

rem 循环抓取扫描url
for /f  %%i in (%file_list%) do (
"%appscancmd%" /e /su %%i /st %templet_path% /d %save_dir%!n!.scan /v
set /a n+=1
)

pause