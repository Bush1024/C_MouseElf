@echo off
title 环境配置
rem 以下以管理员权限进行运行
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
rem 以下将dll文件复制到系统目录
echo --------------------------------------------------------------
echo 如果杀毒软件报错请允许修复工具操作
echo --------------------------------------------------------------
echo 正在进行环境配置...
copy %~dp0conf\msvcp100d.dll  %systemroot%\SysWOW64 >nul
copy %~dp0conf\msvcr100d.dll  %systemroot%\SysWOW64 >nul
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto 0
rem 复制成功
:0
mshta vbscript:msgbox("配置成功,窗口将在3秒后关闭。",64,"提示")(window.close) 
goto exit
rem 复制失败
:1
mshta vbscript:msgbox("配置失败,窗口将在3秒后关闭。",16,"提示")(window.close) 
goto exit
rem 延迟关闭
:exit
ping -n 3 127.0.0.1>nul
exit

