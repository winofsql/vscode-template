REM \xampp\mysql\bin\my.bat
setlocal

set path=%path%;%~p0

echo mysqldump --host=localhost --user=root --password= lightbox > lightbox-backup.bat

cmd

endlocal
