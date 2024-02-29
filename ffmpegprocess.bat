for /l %%n in (16,1,23) do (
  ffmpeg -i .\example%%n.avs -c:v libx265 -crf 19 -c:a copy   v%%n.mkv 
  ffmpeg -i .\h%%n.mkv -vn -acodec copy a%%n.flac
  ffmpeg -i v%%n.mkv -i a%%n.flac -c:v copy -c:a copy Hyouka%%n_60.mkv
  if exist Hyouka%%n_60.mkv del v%%n.mkv a%%n.flac
)