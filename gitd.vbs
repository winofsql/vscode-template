Dim objShell, objFSO
Dim url, repoName, repoPath, newRepoName, suffix, suffixMonth, suffixDay, i

repoName = WScript.Arguments(0)

Set objShell = CreateObject("WScript.Shell")
objShell.CurrentDirectory = "c:\app\workspace"
Set objFSO = CreateObject("Scripting.FileSystemObject")

url = "https://github.com/winofsql/" & repoName & ".git"

objShell.Run "cmd /c git clone " & url  & " && rmdir " & repoName & "\.git /S /Q", 0, True

If objFSO.FolderExists(repoName) Then

    suffix = Right(Year(Date),2)
    suffixMonth = Right("0" & Month(Date), 2)
    suffixDay = Right("0" & Day(Date), 2)
    suffix = suffix & suffixMonth & suffixDay
    
    newRepoName = repoName & "-" & suffix
    
    Do While objFSO.FolderExists(newRepoName)
        i = i + 1

        newRepoName = repoName & "-" & suffix & "-" & i
    Loop

	objFSO.MoveFolder repoName, newRepoName

End If

objShell.CurrentDirectory = "c:\app\workspace\" & newRepoName
objShell.Run "cmd /c Code lightbox.code-workspace && exit", 0, True

