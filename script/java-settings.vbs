Set objShellApplication = CreateObject("Shell.Application")
If WScript.Arguments.Count = 0 Then
    objShellApplication.ShellExecute "cscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " dummy", "", "runas", 1
	Wscript.Quit
End If

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' ���ϐ�JAVA_HOME�ɒl"c:\java16"��o�^����
objShell.Environment("System").Item("JAVA_HOME") = "c:\java16"

' ���W�X�g���ɒl����������
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
	MsgBox("G �h���C�u������܂���BGoogle �h���C�u�����s���Ă�������")
	Wscript.Quit
End If

If not objFSO.FolderExists("G:\���L�h���C�u\SE-WORK-DOWNLOAD") Then
	MsgBox("SE-WORK-DOWNLOAD �t�H���_�����L�t�H���_�ɂ���܂���B�ΏۂƂȂ�A�J�E���g�Ń��O�C�����ĉ�����")
	Wscript.Quit
End If

SevenZipPath = objShell.RegRead("HKLM\SOFTWARE\7-Zip\Path") & "7z.exe"

Wscript.Echo SevenZipPath

If not objFSO.FolderExists(target3 & "\lib") Then

	Wscript.Echo "lib.zip ���_�E�����[�h���Ă��܂�......"
	Set sourceFile = objFSO.GetFile("G:\���L�h���C�u\SE-WORK-DOWNLOAD\java\lib.zip")
	sourceFile.Copy target3 & "\lib.zip", True
	Wscript.Echo "lib.zip ���_�E�����[�h���܂���"

	Wscript.Echo "lib.zip ���𓀂��Ă��܂�......"
	objShell.Run Chr(34) & SevenZipPath & Chr(34) & " x -o" & target3 & " " & target3 & "\lib.zip", 0, True
	Wscript.Echo "lib.zip ���𓀂��܂���"

	Wscript.Echo "lib.zip ���폜���Ă��܂�......"
	objFSO.DeleteFile target3 & "\lib.zip"
	Wscript.Echo "lib.zip ���폜���܂���"

End If

If not objFSO.FolderExists("c:\java16") Then

	Wscript.Echo "java16.zip ���_�E�����[�h���Ă��܂�......"
	Set sourceFile = objFSO.GetFile("G:\���L�h���C�u\SE-WORK-DOWNLOAD\java\java16.zip")
	sourceFile.Copy "c:\java16.zip", True
	Wscript.Echo "java16.zip ���_�E�����[�h���܂���"

	Wscript.Echo "java16.zip ���𓀂��Ă��܂�......"
	objShell.Run Chr(34) & SevenZipPath & Chr(34) & " x -oc:\java16" & " " & "c:\java16.zip", 0, True
	Wscript.Echo "java16.zip ���𓀂��܂���"

End If

MsgBox("java �ݒ���I�����܂����B")
