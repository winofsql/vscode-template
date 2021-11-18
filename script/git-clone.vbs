Set WshShell = WScript.CreateObject("WScript.Shell")

Dim text, str
str = "&H43,&H6c,&H6f,&H6e,&H65,&H20,&H7528,&H306e,&H30d1,&H30b9,&H3092,&H5165,&H529b,&H3057,&H3066,&H304f,&H3060,&H3055,&H3044"
strArray = Split(str,",")
str = ""
For I = 0 to Ubound(strArray)
	str = str & ChrW(strArray(I))
Next
text = InputBox(str)
if text = "" then
    Wscript.Quit
end if

Wscript.Echo text

Call WshShell.Run( "cmd /c git clone " & text, 0, True )

