@echo off

for /f "tokens=3" %%a in (
'dir/s/a-d/-c "%1\*"^|findstr/rxc:" *[0-9][0-9]* [^0-9 ][^0-9 ]* *[0-9][0-9]* [^0-9 ][^0-9 ]*"'
) do set "DirSize=%%a"

echo Folder: %1
echo Size : %DirSize% Bytes
pause>nul