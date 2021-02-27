title Reset DataBase By Omid the great :D
@echo off
cd prac 01

:choice
set /P c=Create Test Table[Y/N]?
if /I "%c%" EQU "Y" goto :test
if /I "%c%" EQU "N" goto :all
goto :choice

:test

sqlcmd -i "Test Table 01.sql"

:all

sqlcmd -i "Drop Tables 02.sql"
sqlcmd -i "Drop Tables 01.sql"
sqlcmd -i "Create Table 01.sql"
sqlcmd -i "Create Table 02.sql"

:trigger

sqlcmd -i "Insert Trigger 01.sql"
sqlcmd -i "Insert Trigger 02.sql"
sqlcmd -i "Update Trigger 01.sql"
sqlcmd -i "Update Trigger 02.sql"

pause