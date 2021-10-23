Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set fso = CreateObject("Scripting.FileSystemObject")
Set Stream1 = CreateObject("ADODB.Stream")
Set Stream2 = CreateObject("ADODB.Stream")
Set f = fso.GetFolder(".")
Set sf = f.SubFolders
Dim text

Stream1.Open
Stream1.Type = 2
Stream1.Charset = "utf-8"

Stream1.WriteText( "{" & vbCrLf )
Stream1.WriteText( "    ""folders"": [" & vbCrLf)


For Each f1 in sf
    text = ""
    if inStr( f1.name, "java" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/java/.vscode/launch.json", f1.path )
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/java/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "bat" ) > 0 Then
        Call GetSetting( "https://raw.githubusercontent.com/winofsql/vscode-template/main/batchfile/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "cs" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/csharp/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "js" ) > 0 or inStr( f1.name, "javascript" ) > 0 or inStr( f1.name, "jscript" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/js-cscript/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "hta" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/mshta/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "php" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/php/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "ps" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/powershell/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "py" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/python/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "sql" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/sql/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "vbs" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/vbscript/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "wsh" ) > 0 or inStr( f1.name, "wsf" ) > 0 Then
        Call GetSetting( "https://github.com/winofsql/vscode-template/raw/main/wsh/.vscode/settings.json", f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "zz-" ) > 0 Then
        WorkspacePath
    end if
    
Next

Stream1.WriteText( "    ]," & vbCrLf )

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/worksapce-settings" & "?dummy=" & Timer, False )
objSrvHTTP.Send
text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )

Stream1.WriteText( text )
Stream1.WriteText( vbCrLf )
Stream1.WriteText( "}" )

Stream1.SaveToFile "lightbox.code-workspace", 2

Stream1.Close

Function GetSetting( url, target_path )

    on error resume next
    fso.CreateFolder(target_path & "\.vscode")
    on error goto 0

    path = Split(url,"/")
    filename = path(Ubound(path))

    Call objSrvHTTP.Open("GET", url  & "?dummy=" & Timer, False )
    objSrvHTTP.Send
    Stream2.Open
    Stream2.Type = 1
    Stream2.Write objSrvHTTP.responseBody
    Stream2.SaveToFile target_path & "\.vscode\" & filename, 2
    Stream2.Close

End Function

Function WorkspacePath()

	Stream1.WriteText( "        {" & vbCrLf )
	Stream1.WriteText( "            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" & vbCrLf )
	Stream1.WriteText( "        }," & vbCrLf )

End Function