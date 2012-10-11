@echo off
:: -------------------------------------------------------
::	c:\bin\bat\insps6.cmd
::	by: Donald Raikes <don.raikes@oracle.com>
::	Date:	09/13/2012
:: -------------------------------------------------------------

SETLOCAL ENABLEEXTENSIONS

:Main
if NOT "%1"=="" (
	set build=%1
) else (
	set /p BUILD=which build?
)

set blddir="d:\ps6\%BUILD%"
set JAVA="c:\jdk\6u35\bin\java.exe"
set SILENTXML=silent.xml
set dstxml=%BLDDIR%\%SILENTXML%
set srcxml=c:\bin\bat\%SILENTXML%


call :Install
rem call :Patch
GOTO :EOF

:Install
	sed s/BLDNBR/%BUILD%/g < %SRCxml% > %dstxml%
	pushd %BLDDIR%
	jdevstudio11117install.exe -mode=silent -silent_xml=%DSTXML% -log=install.log
	GOTO :EOF

:Patch
	cp %PATCHDIR%\lib\*.jar %LIBDIR%
	cp %PATCHDIR%\bin\jdev.conf %BINDIR%
	GOTO :EOF

ENDLOCAL

