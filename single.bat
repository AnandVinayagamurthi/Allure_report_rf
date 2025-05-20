@echo off
REM Set the Allure results directory
set ALLURE_RESULTS_DIR=Report

REM Run Robot Framework test with Allure listener
robot --listener allure_robotframework:ALLURE_RESULTS_DIR=%ALLURE_RESULTS_DIR% --outputdir %ALLURE_RESULTS_DIR% Testcase\tc01.robot

REM Check if robot command was successful
if errorlevel 1 (
    echo Robot Framework test failed. Exiting...
    exit /b 1
)

REM Generate the Allure report, cleaning previous data
allure generate %ALLURE_RESULTS_DIR% -o %ALLURE_RESULTS_DIR%\allure-report --clean

REM Check if allure generate command was successful
if errorlevel 1 (
    echo Allure report generation failed. Exiting...
    exit /b 1
)

REM Open the Allure report in the default browser
allure open %ALLURE_RESULTS_DIR%\allure-report

REM Pause to keep the console window open if needed
pause
