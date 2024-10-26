:: Put in here your obsidian vault directory name
cd "your_obsidian_vault"

:: Retrieve date and time
:: Default formatted as dd-mm-yy and 23:59
:: Replace first line with "(set mydate=%%b-%%a-%%c)" to use USA format (mm-dd-yy)
For /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)

:: Prepare commit message
:: Example: "sync 26-10-2024 - 19:02"
set commit_msg="sync %mydate% - %mytime%"

:: Add all changes and commit with custom message
git add *
git commit -m %commit_msg%

:: Push all changes to repository
git push

:: [Optional line] Prevent cmd window from closing to view result log
cmd /k
