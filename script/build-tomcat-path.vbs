Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set Stream = Wscript.CreateObject("ADODB.Stream")
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
Dim path
path = WshShell.CurrentDirectory
Set f = fso.GetFolder(path)
Set fc = f.SubFolders
on error resume next
fc.Add("WEB-INF")
fc.Add("mvc-basic")
fc.Add("mvc-db-select")
on error goto 0 
Set f = fso.GetFolder(path & "\WEB-INF")
Set fc = f.SubFolders
on error resume next
fc.Add("classes")
fc.Add("lib")
on error goto 0 
Set f = fso.GetFolder(path & "\WEB-INF\classes")
Set fc = f.SubFolders
on error resume next
fc.Add("lightbox")
on error goto 0 

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/sample.jsp" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\sample.jsp", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/Sample1.java" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\WEB-INF\classes\lightbox\Sample1.java", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/comp.bat" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\WEB-INF\classes\lightbox\comp.bat", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/mvc-basic/control.jsp" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\mvc-basic\control.jsp", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/mvc-basic/model.jsp" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\mvc-basic\model.jsp", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/mvc-basic/view.html" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\mvc-basic\view.html", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/mvc-db-select/control.jsp" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\mvc-db-select\control.jsp", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/mvc-db-select/model.jsp" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\mvc-db-select\model.jsp", 2
Stream.Close

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/tomcat/mvc-db-select/view.html" & "?dummy=" & Timer, False )
objSrvHTTP.Send
Stream.Open
Stream.Type = 1
Stream.Write objSrvHTTP.responseBody
Stream.SaveToFile path & "\mvc-db-select\view.html", 2
Stream.Close


Dim fname
Dim work
dim text
work = Split(path, "\")
fname = work(Ubound(work))

Set f = fso.GetFolder("\xampp\tomcat\conf\Catalina")
Set fc = f.SubFolders
on error resume next
fc.Add("localhost")
on error goto 0 

Set lightbox = fso.OpenTextFile("\xampp\tomcat\conf\Catalina\localhost\lightbox.xml", 2, True)

Call objSrvHTTP.Open("GET", "https://github.com/winofsql/apache-index/raw/main/lightbox.xml"  & "?dummy=" & Timer, False )
objSrvHTTP.Send
text = objSrvHTTP.responseText
text = Replace(text, "CURPATH", path )

lightbox.Write(text)
lightbox.close
