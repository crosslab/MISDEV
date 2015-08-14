@echo off
echo Compressor JS and CSS?
pause
cd %~dp0

call compressor\compressor.bat common\labs.css

echo.
echo Compressor Success
pause
echo on