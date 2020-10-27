@echo off

SET var=A "foo bar" 123

for %%a in (%var%) do (
    echo %%a
)

echo Get the variable directly: %var%

setlocal enabledelayedexpansion  &:: 이라인이 들어가야 !con1[%%a]!이 동작한다.
set con1[0]=A
set con1[1]=foo bar
set con1[2]=123

for %%a in (0,1,2) do (
   echo !con1[%%a]!
)


REM 아래는 배치차일르 make를 하기 위한 셈플 이다. 
set FT_DNA=D:\BitBucket\ft_dna
set PlatForm=FX6
set BuildStep=build


REM Build Software : 
REM [0]: SX3Library, [1]: NVMe_Example, [2]:HWMonitor 

REM Build Condition
REM [0]:  Build Software Name
REM [1]:  Build Directory Path
REM [2]:  Build PlatForm (FX6, FX5P4, FX5, FX5OTS)
REM [3]:  Build Contiditon (clean, rebuild, build)

set buildcond[0][0]=SX3Library
set buildcond[0][1]=%FT_DNA%\ft\protocol\SX3Library
set buildcond[0][2]=HW=%PlatForm%
set buildcond[0][3]=%BuildStep%

set buildcond[1][0]=NVME_Example
set buildcond[1][1]=%FT_DNA%\ft\apps\NVMe_Example
set buildcond[1][2]=HW=%PlatForm% -f makefile.SX3Library
set buildcond[1][3]=%BuildStep%

set buildcond[2][0]=HWMonitor
set buildcond[2][1]=%FT_DNA%\ft\dna\hwmonitor
set buildcond[2][2]=HW=%PlatForm%
set buildcond[2][3]=%BuildStep%

for %%a in (0,1,2) do (
   echo !buildcond[%%a][0]!, !buildcond[%%a][1]!,!buildcond[%%a][2]!,!buildcond[%%a][3]!
)