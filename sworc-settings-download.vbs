Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
Dim text
Dim target_path
target_path = WshShell.ExpandEnvironmentStrings("%APPDATA%") & "\Code\User"

text = ""
Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/keybindings.json", False )
objSrvHTTP.Send
text = objSrvHTTP.responseText
'text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
Set wf = fso.OpenTextFile(target_path & "\keybindings.json", 2, True)
wf.Write text
wf.Close

target_path = WshShell.ExpandEnvironmentStrings("%APPDATA%") & "\Code\User\snippets"
text = ""
Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sworc-global-java.code-snippets", False )
objSrvHTTP.Send
text = objSrvHTTP.responseText
Set wf = fso.OpenTextFile(target_path & "\sworc-global-java.code-snippets", 2, True)
wf.Write text
wf.Close
