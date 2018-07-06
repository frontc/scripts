@echo off
echo 请以管理员身份运行该批处理！
echo 开始设置IE-Internet安全级别
echo 下载已签名的 ActiveX 控件
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1001 /t REG_DWORD /d 00000000 /f
echo 下载未签名的 ActiveX 控件
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1004 /t REG_DWORD /d 00000000 /f
echo 运行 ActiveX 控件和插件
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1200 /t REG_DWORD /d 00000000 /f
echo 对没有标记为安全的 ActiveX 控件进行初始化和脚本运行
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1201 /t REG_DWORD /d 00000000 /f
echo 对标记为可安全执行脚本的 ActiveX 控件执行脚本
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1405 /t REG_DWORD /d 00000000 /f
echo 跨域浏览子框架
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1607 /t REG_DWORD /d 00000000 /f
echo ActiveX 控件自动提示
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 2201 /t REG_DWORD /d 00000000 /f
echo 允许活动的内容执行
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v iexplore.exe /t REG_DWORD /d 00000000 /f
echo 更改默认安全级别
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v CurrentLevel /t REG_DWORD /d 00000000 /f
echo 开始设置组策略禁用安全检查，如果是XP系统会报错，请忽略
cd /d %~dp0
LGPO.exe /m gp.pol
echo 设置完毕，请重启IE浏览器！
PAUSE
