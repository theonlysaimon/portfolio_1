@echo off
setlocal
 
if not exist %1 (
 echo The source file is not found or parameters are missing.
 endlocal& exit/b 1
) else cd/d "%~dp1"
 
for %%i in (%*) do (
 if %%i neq %1 (
  if "%%~i" neq "0" (
   set/a k+=1
   set x=%%~i
   cmd/v/c echo.!x!| >nul findstr/rv "^[1-9][0-9]*$"&& (
   set flag=false& echo The parameter (%%i^) is incorrect.
   )
  )
 )
)
if defined flag (endlocal& exit/b 2)
if not defined k (echo Not enough parameters.& endlocal& exit/b 3)
 
for /f %%i in ('^<%1 find/c /v ""') do (
 for /l %%j in (1 1 %k%) do (
  set/a l=m+1
  for /f %%k in ('set/a %%j+1') do call set/a m+=%%~%%k
  <%1>%%j.txt call call:sub %%i %%l%% %%m%%
 )
)
 
endlocal
exit/b 0
 
:sub
 setlocal
 for /l %%j in (1 1 %1) do (
  set/a n+=1& set y=& set/p y=
  cmd/v/c "if !n! geq %2 if !n! leq %3 if !y! neq ^^!y^^! (echo.!y!) else (echo.)"
 )
 endlocal
 goto:eof