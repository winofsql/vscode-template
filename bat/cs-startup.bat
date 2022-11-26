cd ..\ 
mkdir cs-form_01
mkdir cs-form_02
mkdir cs-form_03
cd cs-form_01
cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs https://github.com/winofsql/cs-startup/raw/main/form_01 README.md
cd ..\cs-form_02
cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs https://github.com/winofsql/cs-startup/raw/main/form_02 README.md
cd ..\cs-form_03
cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs https://github.com/winofsql/cs-startup/raw/main/form_03 README.md

cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\workspace-build-download.vbs 2
