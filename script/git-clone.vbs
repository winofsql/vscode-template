Set WshShell = WScript.CreateObject("WScript.Shell")

Dim text
text = InputBox("Clone 用のパスを入力してください")
if text = "" then
    Wscript.Quit
end if

Wscript.Echo text

Call WshShell.Run( "cmd /c cd ..\ & git clone " & text, 0, True )

