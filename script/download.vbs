Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set Stream = Wscript.CreateObject("ADODB.Stream")

For i=1 To Wscript.Arguments.Count-1

    Call objSrvHTTP.Open("GET", Wscript.Arguments(0) & "/" & Wscript.Arguments(i) & "?dummy=" & Timer, False )
    objSrvHTTP.Send
    Stream.Open
    Stream.Type = 1 '
    Stream.Write objSrvHTTP.responseBody
    Stream.SaveToFile Wscript.Arguments(i), 2
    Stream.Close

Next

