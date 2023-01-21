@ECHO OFF
for %%i in (%1\*.*) do (if EXIST %2\%%~NXi ECHO %%~NXi)