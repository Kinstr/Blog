@echo off
SETLOCAL Enabledelayedexpansion

:: 设置远程分支和本地分支变量
SET BRANCH=Hexo-Next
SET REMOTE=origin

echo [1/4] 🔍 Checking status...
:: 检查是否有变动
git status -s | findstr /R "." > nul
if %errorlevel% neq 0 (
    echo ✅ No changes detected. Skipping...
    pause
    exit /b
)

echo [2/4] ➕ Adding changes...
git add .

:: 获取当前时间作为默认 Commit 信息
SET MSG=Update Blog (%date% %time%)
echo [3/4] 💾 Committing with message: "%MSG%"
git commit -m "%MSG%"

echo [4/4] 🚀 Syncing with GitHub...
:: 先拉取，防止冲突
echo 📥 Pulling remote changes...
git pull %REMOTE% %BRANCH% --rebase

:: 执行推送
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