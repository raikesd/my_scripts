@echo off
if NOT "%1"=="" (
	set build=%1
) else (
	set /p BUILD=which build?
)

c:\fmw\ps6\%BUILD%\jdeveloper\jdev\bin\jdev.exe -su -J-Doracle.ide.reportEDTViolations=console

