Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set WshShell = WScript.CreateObject("WScript.Shell")
Set Stream = Wscript.CreateObject("ADODB.Stream")
Dim text
Dim target_path
target_path = WshShell.ExpandEnvironmentStrings("%APPDATA%") & "\Code\User"

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/keybindings.json", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\keybindings.json", 2
Stream.Close


target_path = WshShell.ExpandEnvironmentStrings("%APPDATA%") & "\Code\User\snippets"

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sworc-global-java.code-snippets", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\sworc-global-java.code-snippets", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sworc-global-php.code-snippets", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\sworc-global-php.code-snippets", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sworc-global-bat.code-snippets", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\sworc-global-bat.code-snippets", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sworc-global-csharp.code-snippets", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\sworc-global-csharp.code-snippets", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sworc-global-csv.code-snippets", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\sworc-global-csv.code-snippets", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sworc-global-sql.code-snippets", False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile target_path & "\sworc-global-sql.code-snippets", 2
Stream.Close

WScript.Echo "keybindings.json and snippets is downloaded"
