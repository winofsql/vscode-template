Set WshShell = WScript.CreateObject("WScript.Shell")
Set Fso = CreateObject( "Scripting.FileSystemObject" )
Set obj = Fso.GetFolder( WshShell.CurrentDirectory )
Set obj = obj.ParentFolder
  
Dim target_path
target_path = obj.Path
WshShell.CurrentDirectory = target_path

WshShell.Run("C:\\Users\\%USERNAME%\\AppData\\Roaming\\Code\\User\\script\\folder-vscode-settings-setup.vbs")
