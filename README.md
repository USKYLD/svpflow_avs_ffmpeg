# svpflow_avs_ffmpeg

## AIm :
This project aims to use ffmpeg to call avs scripts and use svpflow to frame videos. 

## Directions:
1. First, you need to install AviSynth+ yourself, copy all the contents in the plugins64 folder of this project to the plugins64 folder under its installation directory (default is C:\Program Files (x86)\AviSynth+) .
2. Modify the example.avs script, modify the filename of the video that needs to be framed, and modify the location of the dll file.
3. The parameters of this project require high CPU performance, please modify the frame parameters according to your own configuration.
4. Modify the input file name and output file name in the process.bat script, the default is to use GPU_h264 compression, -cq 1, you can modify the compression parameters as needed.
5.  Put the avs script, bat script and the video to be processed in the same working directory.
6.  Finally , double-click the .bat script to frame.
