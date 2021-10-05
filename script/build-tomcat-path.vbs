Set objSrvHTTP = Wscript.CreateObject("Msxml2.ServerXMLHTTP")
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
Dim path
path = WshShell.CurrentDirectory
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
