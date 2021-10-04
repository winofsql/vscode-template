Set WshShell = WScript.CreateObject("WScript.Shell")
Dim path
path = WshShell.CurrentDirectory
Dim work
Dim target
work = Split(path, "\")
target = work(Ubound(work))

Call WshShell.Run( "chrome http://localhost/" & target, 0, True )