Dim DocumentRoot : DocumentRoot = "C:\app\web22"
Set WshShell = WScript.CreateObject("WScript.Shell")
Dim path
path = WshShell.CurrentDirectory
Dim work
work = Replace(path, DocumentRoot & "\", "")
work = Replace(work, "\", "/")

Call WshShell.Run( "chrome http://localhost/" & work, 0, True )