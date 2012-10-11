@echo off
:: -------------------------------------------------------
::	c:\bin\bat\insmain.cmd
::	by: Donald Raikes <don.raikes@oracle.com>
::	Date:	07/26/2012
:: -------------------------------------------------------------

SETLOCAL ENABLEEXTENSIONS

:Main
if NOT "%1"=="" (
	set build=%1
) else (
	set /p BUILD=which build?
)

set blddir="d:\abrams\%BUILD%"
set JAVA="c:\jdk\7u6\bin\java.exe"
set RSP=jdevsuiteresponse.rsp
set RSPFILE="%BlDDIR%\%RSP%"
set SRCRSP="c:\bin\bat\%RSP%"
set BINDIR="c:\fmw\abrams\%BUILD%\jdeveloper\jdev\bin"
set LIBDIR="c:\fmw\abrams\%BUILD%\jdeveloper\jdev\lib"
set PATCHDIR="c:\bin\jdev"


call :Install
call :Patch
GOTO :EOF

:Install
	sed s/BLDNBR/%BUILD%/g < %SRCRSP% > %RSPFILE%
	pushd %BLDDIR%
	%JAVA% -jar jdev_suite_generic.jar -silent -responseFile %RSPFILE% -waitForCompletion -J-Djava.net.preferIPv4Stack=true -JRELoc=c:\jdk\7u6
	GOTO :EOF

:Patch
	cp %PATCHDIR%\lib\*.jar %LIBDIR%
	cp %PATCHDIR%\bin\jdev.conf %BINDIR%
	GOTO :EOF

ENDLOCAL

