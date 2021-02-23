
:begin
set /P message="What Is Your Git Message? "
echo Message : "%message%"

set /P c=Ok to Push [Y/N]?
if /I "%c%" EQU "Y" goto :git
goto :begin

:git
git add .
git commit -m "%message%"
git push origin main

echo Good Bye Nigga !!!
pause