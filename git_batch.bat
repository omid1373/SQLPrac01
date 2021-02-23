
set /P message="What Is Your Git Message? "
echo Message : "%message%"

set /P c=Ok to Push [Y/N]?
if /I "%c%" EQU "Y" goto :git
if /I "%c%" EQU "N" goto :bye
goto :choice

pause
:git
git add .
git commit -m "%message%"
git push origin main

:bye
echo Good Bye Nigga !!!
pause