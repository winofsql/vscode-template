Set WshShell = WScript.CreateObject("WScript.Shell")

Dim text
text = InputBox("Clone —p‚ÌƒpƒX‚ð“ü—Í‚µ‚Ä‚­‚¾‚³‚¢")
if text = "" then
    Wscript.Quit
end if

Wscript.Echo text

Call WshShell.Run( "cmd /c cd ..\ & git clone " & text, 0, True )

