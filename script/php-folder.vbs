Dim objShell, objFSO
Dim work, workpath , url, repoName, repoPath, newRepoName, suffix, suffixMonth, suffixDay, i

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

suffixMonth = Right("0" & Month(Date), 2)
suffixDay = Right("0" & Day(Date), 2)
suffix = suffixMonth & suffixDay

repoName =  "php-" & suffix & "-"


If objFSO.FolderExists("..\" & repoName & "01") Then
    
    newRepoName = repoName & "01"
    Do While objFSO.FolderExists("..\" & newRepoName)
        i = i + 1

        newRepoName = repoName &  Right( "0" & i, 2 )
    Loop
	' �t�H���_���쐬����
	objFSO.CreateFolder("..\" & newRepoName)
	
	repoPath = objShell.CurrentDirectory

	work = Split(repoPath, "\")

	workpath = ""
	For i = 0 to UBound(work) - 1
		workpath = workpath & work(i) & "\"
	Next
	
	objShell.CurrentDirectory = workpath & newRepoName

Else
    objFSO.CreateFolder("..\" & repoName & "01")

	repoPath = objShell.CurrentDirectory

	work = Split(repoPath, "\")
	workpath = ""
	For i = 0 to UBound(work) - 1
		workpath = workpath & work(i) & "\"
	Next

	objShell.CurrentDirectory = workpath & repoName & "01"

End If

objShell.Run "cmd /c cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\build-xampp-alias.vbs && cscript C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs https://github.com/winofsql/xampp-settings/raw/main .htaccess", 0, True


