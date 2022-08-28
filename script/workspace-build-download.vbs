Set objArgs = WScript.Arguments
Dim param
if objArgs.Count = 0 then
	param = "1"
else
	param = objArgs(0)
end if

Set WshShell = WScript.CreateObject("WScript.Shell")
Set Fso = CreateObject( "Scripting.FileSystemObject" )
Set obj = Fso.GetFolder( WshShell.CurrentDirectory )
Set obj = obj.ParentFolder
  
Dim target_path
target_path = obj.Path
WshShell.CurrentDirectory = target_path

ActionPath = "C:\\Users\\%USERNAME%\\AppData\\Roaming\\Code\\User\\script\\folder-vscode-settings-setup.vbs"
if param = "2" then
	ActionPath = "C:\\Users\\%USERNAME%\\AppData\\Roaming\\Code\\User\\script\\folder-vscode-settings-setup.vbs 2"
end if
if param = "3" then
	ActionPath = "C:\\Users\\%USERNAME%\\AppData\\Roaming\\Code\\User\\script\\folder-vscode-settings-setup.vbs 3"
end if
WshShell.Run(ActionPath)
