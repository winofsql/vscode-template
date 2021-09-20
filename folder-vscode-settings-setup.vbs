Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(".")
Set sf = f.SubFolders
Dim text

Set lightbox = fso.OpenTextFile("lightbox.code-workspace", 2, True)
lightbox.WriteLine("{")
lightbox.WriteLine("     ""folders"": [")


For Each f1 in sf
    text = ""
    if inStr( f1.name, "java" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/java/.vscode/launch.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        on error resume next
        fso.CreateFolder(f1.path & "\.vscode")
        on error goto 0
        Set wf = fso.OpenTextFile(f1.path & "\.vscode\launch.json", 2, True)
        wf.Write text
        text = ""

        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "bat" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://raw.githubusercontent.com/winofsql/vscode-template/main/batchfile/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "cs" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/csharp/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "js" ) > 0 or inStr( f1.name, "javascript" ) > 0 or inStr( f1.name, "jscript" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/js-cscript/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "hta" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/mshta/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "php" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/php/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "powershell" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/powershell/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "python" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/python/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "sql" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/sql/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "vbs" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/vbscript/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if
    if inStr( f1.name, "wsh" ) > 0 or inStr( f1.name, "wsf" ) > 0 Then
        Call objSrvHTTP.Open("GET", "https://github.com/winofsql/vscode-template/raw/main/wsh/.vscode/settings.json", False )
        objSrvHTTP.Send
        text = Replace(objSrvHTTP.responseText, vbLf, vbCrLf )
        lightbox.WriteLine("        {")
        lightbox.WriteLine("            ""path"": """ & Replace( f1.path, "\", "\\" ) & """" )
        lightbox.WriteLine("        },")
    end if

    if text <> "" then
        on error resume next
        fso.CreateFolder(f1.path & "\.vscode")
        on error goto 0
        Set wf = fso.OpenTextFile(f1.path & "\.vscode\settings.json", 2, True)
        Call wf.Write( text )
    end if
    
Next

lightbox.WriteLine("    ]")
lightbox.WriteLine("}")
