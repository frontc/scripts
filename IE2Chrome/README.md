### 业务场景
企业内部应用的web系统，需要打开第三方URL。部分第三方URL必须得使用特定的浏览器才能打开，比如CHROME。这样就要求web系统能调起对应的浏览器去访问该URL
### 实现逻辑
定义一个个性化的URL协议（ff://）注册到注册表中,并将该URL协议指向chrome.exe。浏览器在访问到该个性化URL协议后，根据注册表的注册信息打开指定的应用程序处理。
### 核心难点
open.shell.command里可以通过 %1 获取参数 ，如 ff://www.lefer.cn 获取到的参数即为 "ff://www.lefer.cn"
这个时候需要通过扩展command的指令，剥离出真正的参数www.lefer.cn。
