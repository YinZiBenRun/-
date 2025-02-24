# 校园网认证工具


这是一个用于自动进行校园网认证的Java工具。通过定时任务或手动运行，程序可以自动获取本机IP地址并发送认证请求，确保网络连接正常。

功能特性
自动获取本机IP地址：程序会自动获取网线连接的IPv4地址，无需手动输入。

配置文件支持：通过 settings.properties 文件配置认证参数，方便修改。

定时任务支持：可以通过Windows任务计划程序设置每天定时运行。

动态路径支持：批处理文件自动获取当前目录，无需手动修改路径。

环境要求
Java 8 或更高版本：确保已安装Java运行时环境（JRE）。

Windows 系统：支持Windows 7及以上版本。

使用方法
1. 下载项目
将以下文件下载到本地目录：

campus-network-auth-1.0-jar-with-dependencies.jar：可执行的JAR文件。

run_auth.bat：用于运行JAR文件的批处理文件。

settings.properties：配置文件，用于设置认证参数。

2. 配置文件说明
编辑 settings.properties 文件，填写以下参数：



# 校园网认证URL
auth.url=http://10.0.100.3:801/eportal/portal/login

# 认证参数
callback=dr1003
login_method=1
user_account=,0,LTB20220101120@unicom  # 替换为你的账号
user_password=200116                   # 替换为你的密码
wlan_user_mac=000000000000             # 替换为你的MAC地址（可选）
js_version=4.2.1
terminal_type=1
lang=zh-cn
v=3869
3. 运行程序
方法一：手动运行
双击 run_auth.bat 文件，程序会自动运行并输出认证结果。

如果认证成功，控制台会显示 认证响应 的内容。

方法二：定时运行（推荐）
打开Windows任务计划程序（taskschd.msc）。

创建一个新任务：

触发器：每天6:30。

操作：启动程序，选择 run_auth.bat 文件。

保存任务，程序会在每天6:30自动运行。

方法三:使用 schtasks 命令

1.用管理员权限打开cmd

2.输入该命令即可

schtasks /create /tn "校园网自动认证任务" /tr "C:\Users\35175\Desktop\校园网自动认证程序\run_auth.bat" /sc WEEKLY /d SUN,MON,TUE,WED,THU /st 06:30 /ru "用户名" /rp "密码" /rl HIGHEST

注： C:\Users\35175\Desktop\校园网自动认证程序\run_auth.bat 这个是run_auth.bat的绝对路径

3.设置完后可以打开任务计划程序看到有一个校园网自动认证的任务出现在其中


项目结构

CampusAuth/
├── campus-network-auth-1.0-jar-with-dependencies.jar  # 可执行JAR文件
├── run_auth.bat                                      # 批处理文件
├── settings.properties                               # 配置文件
└── README.md                                        # 说明文档
技术细节
1. 自动获取本机IP地址
程序会优先获取网线连接的IPv4地址，跳过虚拟接口（如Docker、VMware等）。

2. 动态路径支持
批处理文件使用 %~dp0 动态获取当前目录，确保JAR文件和配置文件的路径正确。

3. 认证请求
程序通过HTTP GET请求发送认证信息，请求URL格式如下：


http://10.0.100.3:801/eportal/portal/login?
callback=dr1003&
login_method=1&
user_account=,0,LTB20220101120@unicom&
user_password=200116&
wlan_user_ip=10.7.144.159&
wlan_user_mac=000000000000&
jsVersion=4.2.1&
terminal_type=1&
lang=zh-cn&
v=3869


常见问题
1. 无法获取本机IP地址
确保网线已连接。

检查网络接口名称是否正确（如 以太网、eth0 等）。

2. 认证失败
检查 settings.properties 文件中的参数是否正确。

确保校园网认证接口可用。

3. 批处理文件无法运行
确保Java已正确安装，并且 java 命令可以在命令行中运行。

检查JAR文件和批处理文件是否在同一个目录下。

许可证
本项目基于 MIT 许可证 开源。

联系方式
如有问题或建议，请联系：

邮箱：2932419272@qq.com

GitHub: [YourGitHubProfile](https://github.com/YinZiBenRun)

致谢
感谢以下开源项目：

Apache HttpClient：用于发送HTTP请求。

Maven：用于项目构建和依赖管理。


 ----------本项目基于长沙学院校园网构建，如要使用请在使用前根据所属单位自行修改

