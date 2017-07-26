@echo off
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ChromeHTML\Application" /v ApplicationIcon^|findstr /i "ApplicationIcon"') do (
  set "pth=%%b"
)
set realPth=%pth:~,-2%
set chromePath=%realPth:\=\\%
echo Windows Registry Editor Version 5.00 > local.reg
echo [HKEY_CLASSES_ROOT\ff] >> local.reg
echo "URL Protocol"="" >> local.reg
echo @="openChromeProtocol" >> local.reg
echo [HKEY_CLASSES_ROOT\ff\DefaultIcon] >> local.reg
echo @="%chromePath%" >> local.reg
echo [HKEY_CLASSES_ROOT\ff\shell] >> local.reg
echo [HKEY_CLASSES_ROOT\ff\shell\open] >> local.reg
echo [HKEY_CLASSES_ROOT\ff\shell\open\command] >> local.reg
echo @="cmd /v:on /k set m=\"%%1\" &&call set n=%%%%m:~6,-2%%%% &&start \"\" \"%chromePath%\" !n! &exit" >> local.reg
local.reg
del local.reg
exit
