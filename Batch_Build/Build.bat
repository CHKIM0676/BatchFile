@echo off
setlocal enabledelayedexpansion

set FT_DNA=D:\BitBucket\ft_dna
set PlatForm=FX6
set BuildStep=build


REM Build Software : 
REM [0]: SX3Library, [1]: NVMe_Example, [2]:HWMonitor 

REM Build Condition
REM [0]:  Build Software Name
REM [1]:  Build Directory Path
REM [2]:  Send Directry ( Test Example, Library, M550/Bin)
REM [3]:  Send Image (libfx6.a NVME_Example.exe, hwmonitors, ftdiags..)
REM [3]:  Maefile Name (clean, rebuild, build)

set buildcond[0][0]=SX3Library
set buildcond[0][1]=%FT_DNA%\ft\protocol\SX3Library
set buildcond[0][2]=C:\Tanisys\DNA2\TestDeveloper\Library\
set buildcond[0][3]=libfx6
set buildcond[0][4]=Makefile

set buildcond[1][0]=NVME_Example
set buildcond[1][1]=%FT_DNA%\ft\apps\NVMe_Example
set buildcond[1][2]=C:\Tanisys\DNA2\TestDeveloper\NVME_Example_CH
set buildcond[1][3]=nvme_example.exes
set buildcond[1][4]=makefile.SX3Library

set buildcond[2][0]=HWMonitor
set buildcond[2][1]=%FT_DNA%\ft\dna\hwmonitor
set buildcond[2][2]=C:\Program Files (x86)\DNA2\R1.10\Tester\M550\Bin
set buildcond[2][3]=hwmonitors
set buildcond[2][4]=Makefile

set buildcond[3][0]=ftdiags
set buildcond[3][1]=%FT_DNA%\ft\diags\fx6
set buildcond[3][2]=C:\Program Files (x86)\DNA2\R1.10\Tester\M550\Bin
set buildcond[3][3]=ftdiags
set buildcond[3][4]=Makefile

set buildcond[4][0]=ListenerFX6
set buildcond[4][1]=%FT_DNA%\ft\dna3\listener3
set buildcond[4][2]=C:\Program Files (x86)\DNA2\R1.10\Tester\M550\Bin
set buildcond[4][3]=listenerfx6DNA3
set buildcond[4][4]=Makefile


set buildcond[5][0]=NPSServer
set buildcond[5][1]=%FT_DNA%\ft\dna3\listener3
set buildcond[5][2]=C:\Program Files (x86)\DNA2\R1.10\Tester\M550\Bin
set buildcond[5][3]=npsserver
set buildcond[5][4]=Makefile



for %%a in (0,1,2) do (
   echo !buildcond[%%a][0]!, !buildcond[%%a][1]!,HW=!buildcond[%%a][2]!,!buildcond[%%a][3]!,-f !buildcond[%%a][4]!
   call :autobuild !buildcond[%%a][0]!, !buildcond[%%a][1]!,!buildcond[%%a][2]!,!buildcond[%%a][3]!,!buildcond[%%a][4]!
)

exit /b %errorlevel%

REM Auto Build Function 
REM -------------------------------------------
REM %1:  Build Software Name : example : SX3Library
REM %2:  Build Directory Path   : example : D:\BitBucket\ft_dna\ft\protocol\SX3library
REM %3:  Build PlatForm (FX6, FX5P4, FX5, FX5OTS) : example: HW=FX6 -f makefile.sx3Library
REM %4:  Build Contiditon (clean, rebuild, build) example: clean
REM %5:  Makefile Name

:autobuild
echo ====== %1  HW=%3 -f %5========
echo cd %2
echo make HW=%3 -f %5 %4
goto :eof

