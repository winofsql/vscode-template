Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set Stream = Wscript.CreateObject("ADODB.Stream")
Set WshShell = WScript.CreateObject("WScript.Shell")
Set Fso = CreateObject( "Scripting.FileSystemObject" )
Set obj = Fso.GetFolder( WshShell.CurrentDirectory )
Set obj = obj.ParentFolder
  
Dim target_path
target_path = obj.Path
Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/folder-vscode-settings-setup.vbs", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1 ' ƒoƒCƒiƒŠ
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\folder-vscode-settings-setup.vbs", 2
Stream.Close
