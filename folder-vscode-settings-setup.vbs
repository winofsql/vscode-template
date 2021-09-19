Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(".")
Set sf = f.SubFolders
Dim text
For Each f1 in sf
    text = ""
    if f1.name = "bat" Then
        Call objSrvHTTP.Open("GET", "https://raw.githubusercontent.com/winofsql/vscode-template/main/batchfile/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if
    if f1.name = "csharp" Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/csharp/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if
    if f1.name = "php" Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/php/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if
    if f1.name = "mshta" or f1.name = "hta" Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/mshta/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if
    if f1.name = "powershell" Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/powershell/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if
    if f1.name = "python" Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/python/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if
    if f1.name = "wsh" or f1.name = "wsf" Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/wsh/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if
    if f1.name = "js" or f1.name = "javascript" or f1.name = "jscript" Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/cscript-js/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
    end if

    if text <> "" then
        on error resume next
        fso.CreateFolder(f1.path & "\.vscode")
        on error goto 0
        Set wf = fso.OpenTextFile(f1.path & "\.vscode\settings.json", 2, True)
        wf.Write text
    end if
Next