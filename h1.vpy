import vapoursynth as vs
import sys
import mvsfunc as mvf

core = vs.core
core.num_threads = 24
core.max_cache_size=10000

vfile = r'D:\_temp\temp\video\h1.mkv'
src = core.lsmas.LWLibavSource(vfile)
src = core.std.SetFrameProp(src,prop="_FieldBased",intval=0)

clip_8 = mvf.ToYUV(src,css="420",depth=8)

super_params="{pel:1,gpu:1,full:false}"
analyse_params="{block:{w:32,h:16,overlap:2},main:{levels:5,search:{type:4,distance:-12,coarse:{type:4,distance:-1,trymany: true,bad:{range:0}}},penalty:{lambda: 3.33, plevel: 1.33, lsad: 3300, pzero: 110, pnbour: 50}},refine:[{ thsad: 400 }, { thsad: 200, search: { type: 4, distance: -4 } }]}"
smoothfps_params="{gpuid:21,rate:{num:60000,den:1001,abs:true},algo:23,mask:{cover: 80, area: 30, area_sharp: 0.75 },scene: { mode: 0, limits: { scene: 6000, zero: 100, blocks: 40 } }}" 

super=core.svp1.Super(clip_8,super_params)
vectors=core.svp1.Analyse(super["clip"],super["data"],clip_8,analyse_params)
smooth=core.svp2.SmoothFps(clip_8,super["clip"],super["data"],vectors["clip"],vectors["data"],smoothfps_params)
smooth=core.std.AssumeFPS(smooth,fpsnum=smooth.fps_num,fpsden=smooth.fps_den)

smooth.set_output()
