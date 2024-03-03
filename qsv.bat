for /l %%n in (1,1,13) do (
E:\software\QSVEncC_7.61_x64\QSVEncC64.exe --vpy-mt -i h%%n.vpy --codec hevc --output-depth 10 --quality best --icq 22   -o h%%n_60.hevc
)