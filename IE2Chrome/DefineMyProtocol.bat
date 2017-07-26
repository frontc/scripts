@echo off
rem 从注册表中查找chrome的安装路径
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ChromeHTML\Application" /v ApplicationIcon^|findstr /i "ApplicationIcon"') do (
  set "pth=%%b"
)
rem 处理路径去掉末尾的,0
set realPth=%pth:~,-2%
rem 替换路径中的单斜杠为双斜杠，为转义做准备
set chromePath=%realPth:\=\\%
rem 开始输出注册表文件
echo Windows Registry Editor Version 5.00 > local.reg
rem 在HCR下创建自定义协议ff
echo [HKEY_CLASSES_ROOT\ff] >> local.reg
echo "URL Protocol"="" >> local.reg
echo @="openChromeProtocol" >> local.reg
echo [HKEY_CLASSES_ROOT\ff\DefaultIcon] >> local.reg
echo @="%chromePath%" >> local.reg
echo [HKEY_CLASSES_ROOT\ff\shell] >> local.reg
echo [HKEY_CLASSES_ROOT\ff\shell\open] >> local.reg
echo [HKEY_CLASSES_ROOT\ff\shell\open\command] >> local.reg
rem 核心逻辑，处理输入参数，剥离出真正的参数调用chrome打开
echo @="cmd /v:on /k set m=\"%%1\" &&call set n=%%%%m:~6,-2%%%% &&start \"\" \"%chromePath%\" !n! &exit" >> local.reg
rem 导入注册表
local.reg
del local.reg
exit
