Set WshShell = WScript.CreateObject("WScript.Shell")
Dim path
path = WshShell.CurrentDirectory
Dim work
work = Replace(path, "C:\app\web21\", "")
work = Replace(work, "c:\app\web21\", "")
work = Replace(work, "\", "/")

Call WshShell.Run( "chrome http://localhost/" & work, 0, True )