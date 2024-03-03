@echo off
setlocal enabledelayedexpansion
for /l %%n in (2,1,23) do (
  for /f "delims=" %%a in (h1.vpy) do (
    set "line=%%a"
    set "line=!line:h1=h%%n!"
    echo !line! >> h%%n.vpy
  )
)




