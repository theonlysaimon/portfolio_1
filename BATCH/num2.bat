@ECHO OFF
:BegLoop
SET /P Number=enter number
IF %number% ==- GOTO ExitLoop
IF NOT DEFINED MIN SET MIN=%number%
IF NOT DEFINED MAX SET MAX=%number% 
IF %number% LEQ %MIN% SET  MIN=%number%
IF %number% GEQ %MAX% SET  MAX=%number%
GOTO BegLoop
:ExitLoop
ECHO Min = %MIN%
ECHO Max = %MAX%