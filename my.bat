@echo off
setlocal

set path=%path%;%~p0

echo mysqldump --host=localhost --user=root --password= lightbox ^> lightbox-backup.sql > lightbox-backup.bat

cmd /k echo; & echo ////////////////////////////////////////////////////////////// & echo このコマンドプロンプトは MySQL へのパスが通っています & echo //////////////////////////////////////////////////////////////

endlocal
