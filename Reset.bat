cd prac 01

sqlcmd -i "Drop Tables 02.sql"
sqlcmd -i "Drop Tables 01.sql"
sqlcmd -i "Create Table 01.sql"
sqlcmd -i "Create Table 02.sql"
sqlcmd -i "Insert Trigger 01.sql"
sqlcmd -i "Insert Trigger 02.sql"
sqlcmd -i "Update Trigger 01.sql"
sqlcmd -i "Update Trigger 02.sql"
sqlcmd -i ""
sqlcmd -i ""

pause