Set objArgs = WScript.Arguments
Dim Param
if objArgs.Count = 0 then
	param = "0"
else
	param = objArgs(0)
end if

Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set fso = CreateObject("Scripting.FileSystemObject")
Set Stream1 = CreateObject("ADODB.Stream")
Set Stream2 = CreateObject("ADODB.Stream")
Set Stream3 = CreateObject("ADODB.Stream")
Set f = fso.GetFolder(".")
Set sf = f.SubFolders

settings = "https://github.com/winofsql/subject-2022/raw/main/zz-workspace/.vscode/settings.json"
if param = "2" then 
	settings = "https://github.com/winofsql/subject2/raw/main/workspace/.vscode/settings.json"
end if
if param = "3" then
	settings = "https://github.com/winofsql/subject3/raw/main/workspace/.vscode/settings.json"
end if

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
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "bat" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "cs" ) > 0 Then
        Call GetSetting( settings, f1.path )
        Call GetSettingCs( "https://github.com/winofsql/vscode-template/raw/main/csharp/.vscode/", f1.path, f1.name )
        WorkspacePath
    ElseIf inStr( f1.name, "js" ) > 0 or inStr( f1.name, "javascript" ) > 0 or inStr( f1.name, "jscript" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "hta" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "php" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "ps" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "py" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "sql" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "vbs" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    ElseIf inStr( f1.name, "wsh" ) > 0 or inStr( f1.name, "wsf" ) > 0 Then
        Call GetSetting( settings, f1.path )
        WorkspacePath
    Else
        //Call GetSetting( settings, f1.path )
        WorkspacePath
    end if
    
Next

Stream1.WriteText( "    ]," & vbCrLf )

ActionPath = "https://github.com/winofsql/vscode-template/raw/main/workspace-settings" & "?dummy=" & Timer
if param = "2" then
	ActionPath = "https://github.com/winofsql/vscode-template/raw/main/workspace-settings-cs" & "?dummy=" & Timer
end if
if param = "3" then
	ActionPath = "https://github.com/winofsql/vscode-template/raw/main/workspace-settings-java" & "?dummy=" & Timer
end if

Call objSrvHTTP.Open("GET", ActionPath, False )
objSrvHTTP.Send
text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )

Stream1.WriteText( text )
Stream1.WriteText( vbCrLf )
Stream1.WriteText( "}" )

Stream1.Position = 0
Stream1.Type = 1

Stream3.Open
Stream3.Type = 1

Stream1.Read(3)

Stream1.CopyTo Stream3

Stream3.SaveToFile "lightbox.code-workspace", 2

Stream3.Close
Stream1.Close

' Stream1.SaveToFile "lightbox.code-workspace", 2

' Stream1.Close

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

Function GetSettingCs( url, target_path, target )

    Call objSrvHTTP.Open("GET", url  & "tasks.json?dummy=" & Timer, False )
    objSrvHTTP.Send
    Stream2.Open
    Stream2.Type = 2
    Stream2.Charset = "utf-8"
    Stream2.WriteText Replace( objSrvHTTP.responseText, "$target", target ) 
    Stream2.SaveToFile target_path & "\.vscode\tasks.json", 2
    Stream2.Close

    Call objSrvHTTP.Open("GET", url  & "launch.json?dummy=" & Timer, False )
    objSrvHTTP.Send
    Stream2.Open
    Stream2.Type = 2
    Stream2.Charset = "utf-8"
    if inStr( target, "form" ) > 0 Then
        Stream2.WriteText Replace( objSrvHTTP.responseText, "$target", target ) 
    Else
        Stream2.WriteText Replace( Replace( objSrvHTTP.responseText, "$target", target ), "-windows", "" )
    End if
    Stream2.SaveToFile target_path & "\.vscode\launch.json", 2
    Stream2.Close


End Function


Function WorkspacePath()

	Stream1.WriteText( "        {" & vbCrLf )
'	Stream1.WriteText( "            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" & vbCrLf )
	Stream1.WriteText( "            ""path"": """ & f1.Name & """" & vbCrLf )
	Stream1.WriteText( "        }," & vbCrLf )

End Function
