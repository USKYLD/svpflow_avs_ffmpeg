for /l %%n in (14,1,14) do (
  ffmpeg -i .\h%%n.mkv -vn -acodec copy a%%n.flac
  mkvmerge -o Hibike_S1_%%n_60.mkv  a%%n.flac  h%%n_60.hevc
)