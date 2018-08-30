@echo off
Title="Press, Paq8px161    ^|    Compressing %~n1  ^(Please be patient!^)" & CLS & color 1A && SETLOCAL
::Check to see if input is a compressed file to decompress, otherwise continue...
If [%1]==[*.paq8px161] goto :Decompress & echo Decompression Mode || echo Compression Mode
::Check to see if dictionarys exist, otherwise extract from the .exe...
If Exist english.dic echo Dictionary Found! || type paq8px161.exe:english.dic > english.dic
If Exist english.exp echo Expressions Found! || type paq8px161.exe:english.exp > english.exp
::Check to see if the extraction worked, if it did then continue, otherwise use other method.
IF not exist english.dic goto :noDic

::Now the magic takes place
:Compress
paq8px161.exe -v -9beta %~1
exit /b
goto :EOF

::Alternate method for dictionary-less compression.
:noDic
pax8px161.exe -v -9ba %~1
exit /b
goto :EOF

::Will list files in archive then decompress it...
:Decompress
paq8px161.exe -l %~1
paq8px161.exe -v -d %~1
exit /b
goto :EOF

::Press-toe change-o files are dealt with.
:EOF
ENDLOCAL & pause & echo The process has completed, FINALLY!
exit
