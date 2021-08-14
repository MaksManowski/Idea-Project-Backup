@echo off
set from=C:\Users\Inni\IdeaProjects\
set to=H:\Backups\

SETLOCAL EnableDelayedExpansion

::Choose whether or not to backup (5 seccond timer)

choice /C YNabcdefghijklmopqrstuvxz /N /T 5 /D N /M "Backup data? Y/N"
IF ERRORLEVEL 1 set choice=Y
IF ERRORLEVEL 2 set choice=N

IF %choice% EQU Y goto yes
exit

:yes
cd %from%
cls

set /A cur=0
set val = Unknown

::Show options
echo Select the project to backup:
for /d %%D in (*) do (call :getvalinc & echo [!val!] %%D)
call :getvalinc
echo [%val%] All projects

::Get selected option
call :selectchooser
::echo You chose %choice%
call :getcur
::%cur% is now the array value of above
call :getcurpath
call :makebackuppath
echo Copying contents of %chosendir% to %backupdir%
@echo on
robocopy "%chosendir%" "%backupdir%" /COPYALL /E
@echo off
echo Backed up %chosendirname%
pause
exit

::Function (call :getval) sets %val% to %cur% letter position
:getval
SETLOCAL EnableDelayedExpansion
set /A temp=-1
for %%? in (1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z) do (set /A temp+=1 & if %cur%==!temp! set val=%%?)
echo %val%
goto :eof

::Function (call :getvalinc) sets %val% to %cur% then incremenets val
:getvalinc 
set /A temp=-1
for %%? in (1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z) do (set /A temp+=1 & if %cur%==!temp! set val=%%?)
set /A cur+=1
goto :eof

::Gets the value cur has to be to produce %choice%
:getcur
set /A temp=-1
for %%? in (1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z) do (set /A temp+=1 & if %%?==%choice% set /a cur=!temp!)
goto :eof

::Function that allows selection of letter (60 seccond timer)
:selectchooser
choice /C 123456789abcdefghijklmnopqrstuvwxyz /N /T 60 /D %val% /M "Please tap the assosciated key!"
IF ERRORLEVEL 1 set choice=1
IF ERRORLEVEL 2 set choice=2
IF ERRORLEVEL 3 set choice=3
IF ERRORLEVEL 4 set choice=4
IF ERRORLEVEL 5 set choice=5
IF ERRORLEVEL 6 set choice=6
IF ERRORLEVEL 7 set choice=7
IF ERRORLEVEL 8 set choice=8
IF ERRORLEVEL 9 set choice=9
IF ERRORLEVEL 10 set choice=a
IF ERRORLEVEL 11 set choice=b
IF ERRORLEVEL 12 set choice=c
IF ERRORLEVEL 13 set choice=d
IF ERRORLEVEL 14 set choice=e
IF ERRORLEVEL 15 set choice=f
IF ERRORLEVEL 16 set choice=g
IF ERRORLEVEL 17 set choice=h
IF ERRORLEVEL 18 set choice=i
IF ERRORLEVEL 19 set choice=j
IF ERRORLEVEL 20 set choice=k
IF ERRORLEVEL 21 set choice=l
IF ERRORLEVEL 22 set choice=m
IF ERRORLEVEL 23 set choice=n
IF ERRORLEVEL 24 set choice=o
IF ERRORLEVEL 25 set choice=p
IF ERRORLEVEL 26 set choice=q
IF ERRORLEVEL 27 set choice=r
IF ERRORLEVEL 28 set choice=s
IF ERRORLEVEL 29 set choice=t
IF ERRORLEVEL 30 set choice=u
IF ERRORLEVEL 31 set choice=v
IF ERRORLEVEL 32 set choice=w
IF ERRORLEVEL 33 set choice=x
IF ERRORLEVEL 34 set choice=y
IF ERRORLEVEL 35 set choice=z
IF ERRORLEVEL 36 set choice=ELSE
goto :eof

::Gets %cur%th path in directory.
:getcurpath
set /A temp=-1
for /d %%D in (*) do (set /A temp +=1 & if !temp!==%cur% set chosendir=%%~fD)
set /A temp +=1
if %cur% equ %temp% set chosendir=%from%
if %cur% gtr %temp% exit

set /A temp=-1
for /d %%D in (*) do (set /A temp +=1 & if !temp!==%cur% set chosendirname=\%%D)
set /A temp +=1
goto :eof

::Creates backup directory
:makebackuppath
for /f %%# in ('wMIC Path Win32_LocalTime Get /Format:value') do @for /f %%@ in ("%%#") do @set %%@
::echo %day%
::echo %DayOfWeek%
::echo %hour%
::echo %minute%
::echo %month%
::echo %quarter%
::echo %second%
::echo %weekinmonth%
::echo %year%

if %hour% lss 10 set hour=0%hour%
if %minute% lss 10 set minute=0%minute%
if %month% lss 10 set month=0%month%

set backupdir=%to%Backup - %year%_%month%_%day%-%hour%_%minute%\%chosendirname%
goto :eof
