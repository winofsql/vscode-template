if exist c:\app\workspace (
   c: 
   cd \app\workspace
   git clone https://github.com/winofsql/subject3.git
   ren subject3 subject3-%date:~5,2%%date:~8,2%
   cd subject3-%date:~5,2%%date:~8,2%
   rmdir .git /S /Q 
   Code lightbox.code-workspace
   exit
) else (
   c:
   mkdir \app\workspace
   cd \app\workspace
   git clone https://github.com/winofsql/subject3.git
   ren subject3 subject3-%date:~5,2%%date:~8,2%
   cd subject3-%date:~5,2%%date:~8,2%
   rmdir .git /S /Q
   Code lightbox.code-workspace
   exit
)
