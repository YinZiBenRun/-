@echo off
REM 获取当前批处理文件所在目录
set SCRIPT_DIR=%~dp0

REM 查找JAR文件
for %%f in ("%SCRIPT_DIR%*.jar") do (
    set JAR_PATH=%%f
    goto :run_jar
)

echo 未找到JAR文件
pause
exit /b 1

:run_jar
REM 运行JAR文件
echo 正在运行: %JAR_PATH%
java -jar "%JAR_PATH%"

REM 暂停，以便查看输出结果
pause