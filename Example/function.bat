@echo off

echo -/-/- Batch Functions  Library -/-/-

call :function1 myarg1 myarg2
exit /b %errorlevel%


:function1
echo argument1- %1
echo argument2- %2

goto :eof

