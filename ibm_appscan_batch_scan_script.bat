@echo off
setlocal enabledelayedexpansion
title IBM AppScan batch scan script By T00ls.Net
echo --------------------------------------------------------------------------------
echo                     IBM AppScan batch scan script
echo                                                  ---By acgbfull
echo                                                  ---By T00ls.Net
echo --------------------------------------------------------------------------------
rem ��Ҫɨ���Ŀ���б�·��
set targets=.\targets.txt
rem AppScanCMD.exe·��
set appscancmd="F:\program\appscan_standard_9.0.3.11\AppScanCMD.exe"
rem ɨ��ģ��·�� 
set templet_path=.\template\9.0.3.11_templet.scant
rem ɨ��������Ŀ¼
set save_dir=.\results\


mkdir %save_dir% 2>nul
rem �����û�������Ѵ��ڵ�ɨ����
for /f  %%j in ('dir /b %save_dir%') do (
if exist %save_dir%%%j (
echo ɨ��������Ŀ¼��%save_dir%�����ļ�������պ������б��ű�
pause
exit
)
)


rem ping��ɨ����������ֹappscan���޷���������վ
rem Ȼ���½�appscanɨ�������Զ�����pdf����
for /f "tokens=1,2,* delims=/" %%k in (%targets%) do (
set url=%%k//%%l/%%m
ping -n 6 %%l
%appscancmd% /e /su !url! /st %templet_path% /d %save_dir%%%l.scan /rf %save_dir%%%l��ȫ����.pdf /rt pdf /v
echo --------------------------------------------------------------------------------
)
del RCL_API_Log_Sample*
pause