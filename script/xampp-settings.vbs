Set objShellApplication = CreateObject("Shell.Application")
If WScript.Arguments.Count = 0 Then
    objShellApplication.ShellExecute "cscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " dummy", "", "runas", 1
	Wscript.Quit
End If

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

target1 = "c:\app"
target2 = "c:\app\web23"
target3 = "c:\app\web23\index"

If not objFSO.FolderExists(target1) Then

	objFSO.CreateFolder(target1)

End If
If not objFSO.FolderExists(target2) Then

	objFSO.CreateFolder(target2)

End If

If not objFSO.DriveExists("G:") Then
	MsgBox("G ドライブがありません。Google ドライブを実行してください")
	Wscript.Quit
End If

If not objFSO.FolderExists("G:\共有ドライブ\SE-WORK-DOWNLOAD") Then
	MsgBox("SE-WORK-DOWNLOAD フォルダが共有フォルダにありません。対象となるアカウントでログインして下さい")
	Wscript.Quit
End If

SevenZipPath = objShell.RegRead("HKLM\SOFTWARE\7-Zip\Path") & "7z.exe"

If not objFSO.FolderExists(target3) Then


	objShell.CurrentDirectory = "c:\app\web23"
	
	work = "C:\Users\%USERNAME%\AppData\Roaming\Code\User\script\download.vbs"
	work = objShell.ExpandEnvironmentStrings( work )
	
	Set sourceFile = objFSO.GetFile("G:\共有ドライブ\SE-WORK-DOWNLOAD\settings\index.zip")
	sourceFile.Copy "c:\app\web23\index.zip", True


	objShell.Run Chr(34) & SevenZipPath & Chr(34) & " x -o" & target3 & " " & target2 & "\index.zip", 0, True
	
	objFSO.DeleteFile target2 & "\index.zip"

End If

If not objFSO.FolderExists("c:\xampp") Then
	Set sourceFile = objFSO.GetFile("G:\共有ドライブ\SE-WORK-DOWNLOAD\database\xampp\xampp.zip")
	sourceFile.Copy "c:\xampp.zip", True

	suffixMonth = Right("0" & Month(Date), 2)
	suffixDay = Right("0" & Day(Date), 2)
	suffix = suffixMonth & suffixDay

	objShell.Run Chr(34) & SevenZipPath & Chr(34) & " x -oc:\xampp-" & suffix & " " & "c:\xampp.zip", 0, True
End If

MsgBox("xampp 設定を終了しました。")
