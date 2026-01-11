@echo off
setlocal

REM Build the SUSTech thesis document
echo Building SUSTech Thesis...

REM Generate class files if needed
if not exist "sustechthesis.cls" (
  echo Generating class files...
  xetex sustechthesis.ins
)

REM Check command line argument to determine what to build
if "%~1"=="" goto build_thesis
if /I "%~1"=="thesis" goto build_thesis
if /I "%~1"=="report" goto build_report
if /I "%~1"=="all" goto build_all
if /I "%~1"=="doc" goto build_doc
goto usage

:build_thesis
echo Building thesis document...
latexmk sustechthesis-example
goto success

:build_report
echo Building report document...
latexmk sustechthesis-example-report
goto success

:build_all
echo Building all documents...
latexmk sustechthesis-example
if exist "sustechthesis-example-report.tex" (
  latexmk sustechthesis-example-report
)
goto success

:build_doc
echo Building documentation...
latexmk sustechthesis.dtx
goto success

:usage
echo Invalid argument. Usage:
echo   build.bat          - Build thesis (default)
echo   build.bat thesis   - Build thesis
echo   build.bat report   - Build report
echo   build.bat all      - Build all documents
echo   build.bat doc      - Build documentation
goto end

:success
echo Build completed successfully!

:end
pause