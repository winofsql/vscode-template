Set fso = Wscript.CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
path = WshShell.ExpandEnvironmentStrings("%APPDATA%") & "\Code\User"
Set f = fso.GetFolder(path)
Set fc = f.SubFolders
on error resume next
fc.Add("script")
on error goto 0
path = path & "\script"

Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set Stream = Wscript.CreateObject("ADODB.Stream")

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/script/download.vbs", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1 ' バイナリ
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\download.vbs", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/script/sworc-settings-download.vbs", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1 ' バイナリ
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\sworc-settings-download.vbs", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/script/workspace-build-download.vbs", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1 ' バイナリ
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\workspace-build-download.vbs", 2
Stream.Close
