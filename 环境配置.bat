@echo off
title ��������
rem �����Թ���ԱȨ�޽�������
cd /d "%~dp0"
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin
rem ���½�dll�ļ����Ƶ�ϵͳĿ¼
echo --------------------------------------------------------------
echo ���ɱ����������������޸����߲���
echo --------------------------------------------------------------
echo ���ڽ��л�������...
copy %~dp0conf\msvcp100d.dll  %systemroot%\SysWOW64 >nul
copy %~dp0conf\msvcr100d.dll  %systemroot%\SysWOW64 >nul
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto 0
rem ���Ƴɹ�
:0
mshta vbscript:msgbox("���óɹ�,���ڽ���3���رա�",64,"��ʾ")(window.close) 
goto exit
rem ����ʧ��
:1
mshta vbscript:msgbox("����ʧ��,���ڽ���3���رա�",16,"��ʾ")(window.close) 
goto exit
rem �ӳٹر�
:exit
ping -n 3 127.0.0.1>nul
exit

