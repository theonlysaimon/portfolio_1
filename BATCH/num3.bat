@ECHO OFF
set /A kol = 0
for /R %1 %%f in (.) do set /A kol = kol + 1
ECHO number of sedbirectories: %kol%