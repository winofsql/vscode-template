Set WshShell = WScript.CreateObject("WScript.Shell")

Dim text
text = InputBox("\u0043\u006c\u006f\u006e\u0065\u0020\u7528\u306e\u30d1\u30b9\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044")
if text = "" then
    Wscript.Quit
end if

Wscript.Echo text

Call WshShell.Run( "cmd /c cd ..\ & git clone " & text, 0, True )

