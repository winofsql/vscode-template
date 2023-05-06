Set objShellApplication = CreateObject("Shell.Application")
If WScript.Arguments.Count = 0 Then
    objShellApplication.ShellExecute "cscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " dummy", "", "runas", 1
	Wscript.Quit
End If

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' 環境変数JAVA_HOMEに値"c:\java16"を登録する
objShell.Environment("System").Item("JAVA_HOME") = "c:\java16"

' レジストリに値を書き込む
objShell.RegWrite "HKLM\SOFTWARE\JavaSoft\Java Development Kit\JavaHome", "C:\java16", "REG_SZ"

target1 = "c:\app"
target2 = "c:\app\java23"
target3 = "c:\app\workspace"

If not objFSO.FolderExists(target1) Then

	objFSO.CreateFolder(target1)

End If
If not objFSO.FolderExists(target2) Then

	objFSO.CreateFolder(target2)

End If
If not objFSO.FolderExists(target3) Then

	objFSO.CreateFolder(target3)

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

Wscript.Echo SevenZipPath

If not objFSO.FolderExists(target3 & "\lib") Then
	Set sourceFile = objFSO.GetFile("G:\共有ドライブ\SE-WORK-DOWNLOAD\java\lib.zip")
	sourceFile.Copy target3 & "\lib.zip", True

	Wscript.Echo "lib.zip をGドライブからコピーしました"

	objShell.Run Chr(34) & SevenZipPath & Chr(34) & " x -o" & target3 & " " & target3 & "\lib.zip", 0, True

	Wscript.Echo "lib.zip を解凍しました"

	objFSO.DeleteFile target3 & "\lib.zip"

	Wscript.Echo "lib.zip を削除しました"
End If

If not objFSO.FolderExists("c:\java16") Then
	Set sourceFile = objFSO.GetFile("G:\共有ドライブ\SE-WORK-DOWNLOAD\java\java16.zip")
	sourceFile.Copy "c:\java16.zip", True

	objShell.Run Chr(34) & SevenZipPath & Chr(34) & " x -oc:\java16" & " " & "c:\java16.zip", 0, True
End If

MsgBox("java 設定を終了しました。")
