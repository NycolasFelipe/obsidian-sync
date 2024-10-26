### Obsidian Sync
I use Obsidian a lot, and always make sure to keep my notes up to date with my personal github repository. But I noticed that the process to sync it manually through cmd is quite repetetive, and decided to create a custom script to perform all steps automatically.
<br><br>
I found it immensely useful, and decided to share with anyone who would like to use. Feel free to use and modify it as you wish, or suggest improvements.

#### How to use this script
- First, make sure that you have a repository containing your obsidian files. This script won't work otherwise.
- Once you have your folder containing the obsidian files, create an empty cmd file next to that folder. Let us name it `obsidian_sync.cmd`, for example.
- Edit the script below with your custom settings - name of the obsidian vault and date format.
- Finally, put the code inside your `obsidian_sync.cmd` file.
- Your script should work just fine!

```cmd
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
```

#### Extra: pretty sync icon
If you want to have a neat touch and better looking for your script, you can do as follow:
- Download [my custom obsidian sync ico file](https://github.com/user-attachments/assets/97ebb68c-9566-40de-af9a-7237fb596d7d).
- Since GitHub doesn't support the upload of ico files, make sure to change the file's extensions to `.ico` after finishing the download.
- Create a shortcut of your `obsidian_sync.cmd` file, and name it as you wish.
- Next, access your shortcut properties and change its icon to the one you downloaded previously.
- Optionally, you can hide your cmd script file, and stick to your shortcut.

##### Final result:
![image](https://github.com/user-attachments/assets/eab38740-d50b-40cb-83d4-f6a54365dab0)
