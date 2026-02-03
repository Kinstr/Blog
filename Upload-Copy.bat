@echo off
:: 关键：切换到 UTF-8 代码页以支持 Emoji 和中文字符
chcp 65001 > nul

SETLOCAL Enabledelayedexpansion

:: 设置远程分支和本地分支变量
SET BRANCH=Hexo-Next
SET REMOTE=origin

echo.
echo [1/4] 🔍 Checking status...

:: 检查是否有变动
git status -s | findstr /R "." > nul
if %errorlevel% neq 0 (
    echo ✅ No changes detected. Skipping...
    timeout /t 3 > nul
    exit /b
)

echo [2/4] ➕ Adding changes...
git add .

:: 获取当前时间（过滤掉日期中的斜杠，防止部分环境报错）
SET CURRENT_TIME=%date% %time%
SET MSG=Update Blog (!CURRENT_TIME!)

echo [3/4] 💾 Committing with message: "%MSG%"
git commit -m "%MSG%"

echo [4/4] 🚀 Syncing with GitHub...
echo 📥 Pulling remote changes...
git pull %REMOTE% %BRANCH% --rebase

echo 📤 Pushing to GitHub...
git push %REMOTE% main:%BRANCH%

if %errorlevel% equ 0 (
    echo.
    echo 🎉 Successfully deployed to %BRANCH%!
) else (
    echo.
    echo ❌ Error: Push failed. Check your network or conflicts.
)

pause