@echo off
setlocal enabledelayedexpansion
for /l %%n in (1,1,23) do (
  for /f "delims=" %%a in (example1.avs) do (
    set "line=%%a"
    set "line=!line:h1=h%%n!"
    echo !line! >> example%%n.avs
  )
)




