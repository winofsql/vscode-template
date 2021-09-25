Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set Stream = Wscript.CreateObject("ADODB.Stream")

strUrl = Wscript.Arguments(0)
path = Split(strUrl,"/")
filename = path(Ubound(path))

Call objSrvHTTP.Open("GET", Wscript.Arguments(0), False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile filename, 2
Stream.Close
