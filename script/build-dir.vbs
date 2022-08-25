Set objArgs = WScript.Arguments
Dim target : target = objArgs(0)

Set WshShell = WScript.CreateObject("WScript.Shell")
Set Fso = CreateObject( "Scripting.FileSystemObject" )
Set obj = Fso.GetFolder( WshShell.CurrentDirectory )
Set obj = obj.ParentFolder
  
Dim target_path
target_path = obj.Path
WshShell.CurrentDirectory = target_path


Dim CurDate
CurDate = Date

Dim Month_str : Month_str = Right("0" & DatePart("m", CurDate), 2 )
Dim Day_str : Day_str = Right("0" & DatePart("d", CurDate), 2 )

Dim Cnt : Cnt = 1
Dim date_string : date_string = target & "-" & Month_str & Day_str & "-" & Cnt

While Fso.FolderExists( date_string )

	Cnt = Cnt + 1
	date_string = target & "-" & Month_str & Day_str & "-" & Cnt

Wend

Fso.CreateFolder( date_string )
