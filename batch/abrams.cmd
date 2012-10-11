@echo off
if NOT "%1"=="" (
	set build=%1
) else (
	set /p BUILD=which build?
)
rem c:\jdev\abrams\%BUILD%\jdeveloper\jdev\bin\jdev.exe -J-Denable.webview=true -su
c:\fmw\abrams\%BUILD%\jdeveloper\jdev\bin\jdev.exe -su -J-Doracle.ide.reportEDTViolations=console

