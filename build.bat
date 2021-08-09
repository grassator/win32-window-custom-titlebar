@echo off

if not defined DevEnvDir (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
)

set BUILD_DIR=out

rmdir /S /Q %BUILD_DIR%
mkdir %BUILD_DIR%

pushd %BUILD_DIR%

set FLAGS=/nologo /Od /Zo /Zi /FC /std:c11 /Wall /wd4100 /wd4255 /wd5105 /wd5045 /WX /D UNICODE /D _UNICODE

cl %FLAGS% /Tc ..\main.c
if %errorlevel% neq 0 (goto Fail)

:Success
popd
exit /b 0

:Fail
popd
exit /b 1