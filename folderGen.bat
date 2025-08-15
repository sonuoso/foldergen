@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET dirStr=
SET dirList=
FOR %%d IN (*.tif) DO (
    SET dir=%%d
    FOR /f "tokens=1 delims=a" %%i IN ("!dir!") DO (
    SET dirList=!dirList! %%i
)
)
FOR %%n IN (%dirList%) DO (
    SET /a dupInc=0
    FOR %%y IN (!dirStr!) DO (
        IF "%%n"=="%%y" SET dupInc=!dupInc!+1
    )
    IF !dupInc!==0 SET dirStr=!dirStr! %%n
)
IF NOT EXIST "Processed Images"\ MD "Processed Images"
CD Processed Images
MD %dirStr%
ENDLOCAL