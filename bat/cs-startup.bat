cd ..\ 
mkdir form_01
mkdir form_02
mkdir form_03
cd form_01
cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs https://github.com/winofsql/cs-startup/raw/main/form_01 README.md
cd ..\form_02
cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs https://github.com/winofsql/cs-startup/raw/main/form_02 README.md
cd ..\form_03
cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs https://github.com/winofsql/cs-startup/raw/main/form_03 README.md

cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\workspace-build-download.vbs 2
