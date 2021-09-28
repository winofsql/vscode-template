Set fso = Wscript.CreateObject("Scripting.FileSystemObject")
Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set Stream = Wscript.CreateObject("ADODB.Stream")

Dim curPath
curPath = ""

For i=1 To Wscript.Arguments.Count-1

    if Left( Wscript.Arguments(i), 1 ) = "\" Then
        Set f = fso.GetFolder( "." )
        Set fc = f.SubFolders
        on error resume next
        fc.Add( Replace( Wscript.Arguments(i), "\", "" ) )
        on error goto 0
        curPath = Replace( Wscript.Arguments(i), "\", "" )
    else
        if curPath = "" then
            Call objSrvHTTP.Open("GET", Wscript.Arguments(0) & "/" & Wscript.Arguments(i) & "?dummy=" & Timer, False )
            objSrvHTTP.Send
            Stream.Open
            Stream.Type = 1 '
            Stream.Write objSrvHTTP.responseBody
            Stream.SaveToFile Wscript.Arguments(i), 2
            Stream.Close
        else
            Call objSrvHTTP.Open("GET", Wscript.Arguments(0) & "/" & curPath & "/" & Wscript.Arguments(i) & "?dummy=" & Timer, False )
            objSrvHTTP.Send
            Stream.Open
            Stream.Type = 1 '
            Stream.Write objSrvHTTP.responseBody
            Stream.SaveToFile curPath & "\" & Wscript.Arguments(i), 2
            Stream.Close
        end if
    end if

Next

