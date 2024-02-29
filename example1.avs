SetMemoryMax(10240)
global threads=24
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow1.dll")
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow2.dll")
SetFilterMTMode("DEFAULT_MT_MODE",2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
LWLibavVideoSource("h1.mkv")
ConvertToYV12()
global crop_string  = ""
global resize_string = ""
global super_params = "{pel:1,gpu:1,full:false}"
global analyse_params = "{block:{w:32,h:16,overlap:2},main:{levels:5,search:{type:4,distance:-12,coarse:{type:4,distance:-1,trymany: true,bad:{range:0}}},penalty:{lambda: 3.33, plevel: 1.33, lsad: 3300, pzero: 110, pnbour: 50}},refine:[{ thsad: 400 }, { thsad: 200, search: { type: 4, distance: -4 } }]}"
global smoothfps_params = "{gpuid:0,rate:{num:60000,den:1001,abs:true},algo:23,mask:{cover: 80, area: 30, area_sharp: 0.75 },scene: { mode: 0, limits: { scene: 6000, zero: 100, blocks: 40 } }}"
global demo_mode=0
global stereo_type=0
function interpolate(clip src)
{
	input = crop_string=="" ? src : eval("src."+crop_string)
	input = resize_string=="" ? input : eval("input."+resize_string)

	#MT-MODE-1  #do not remove this line!

	super=SVSuper(input, super_params)
	vectors=SVAnalyse(super, analyse_params, src=input)
	smooth=SVSmoothFps(input, super, vectors, smoothfps_params, mt=threads, src=src)

	#MT-MODE-2  #do not remove this line!

	return demo_mode==0 ? smooth : demo(input,smooth)
}
input=last
	stereo_type==0 ? eval(""" interpolate(input)
""") : 	stereo_type==1 ? eval("""
		lf = interpolate(input.crop(0,0,input.width/2,0))
		rf = interpolate(input.crop(input.width/2,0,0,0))
		StackHorizontal(lf, rf)
""") : 	stereo_type==2 ? Eval("""
		lf = interpolate(input.crop(0,0,0,input.height/2))
		rf = interpolate(input.crop(0,input.height/2,0,0))
		StackVertical(lf, rf)""") : input

Prefetch(threads)SetMemoryMax(10240) 
global threads=24 
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow1.dll") 
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow2.dll") 
SetFilterMTMode("DEFAULT_MT_MODE",2) 
SetFilterMTMode("SVSuper",1) 
SetFilterMTMode("SVAnalyse",1) 
LWLibavVideoSource("h1.mkv") 
ConvertToYV12() 
global crop_string  = "" 
global resize_string = "" 
global super_params = "{pel:1,gpu:1,full:false}" 
global analyse_params = "{block:{w:32,h:16,overlap:2},main:{levels:5,search:{type:4,distance:-12,coarse:{type:4,distance:-1,trymany: true,bad:{range:0}}},penalty:{lambda: 3.33, plevel: 1.33, lsad: 3300, pzero: 110, pnbour: 50}},refine:[{ thsad: 400 }, { thsad: 200, search: { type: 4, distance: -4 } }]}" 
global smoothfps_params = "{gpuid:21,rate:{num:60000,den:1001,abs:true},algo:23,mask:{cover: 80, area: 30, area_sharp: 0.75 },scene: { mode: 0, limits: { scene: 6000, zero: 100, blocks: 40 } }}" 
global demo_mode=0 
global stereo_type=0 
function interpolate(clip src) 
{ 
	input = crop_string=="" ? src : eval("src."+crop_string) 
	input = resize_string=="" ? input : eval("input."+resize_string) 
	#MT-MODE-1  #do not remove this line 
	super=SVSuper(input, super_params) 
	vectors=SVAnalyse(super, analyse_params, src=input) 
	smooth=SVSmoothFps(input, super, vectors, smoothfps_params, mt=threads, src=src) 
	#MT-MODE-2  #do not remove this line 
	return demo_mode==0 ? smooth : demo(input,smooth) 
} 
input=last 
	stereo_type==0 ? eval(""" interpolate(input) 
""") : 	stereo_type==1 ? eval(""" 
		lf = interpolate(input.crop(0,0,input.width/2,0)) 
		rf = interpolate(input.crop(input.width/2,0,0,0)) 
		StackHorizontal(lf, rf) 
""") : 	stereo_type==2 ? Eval(""" 
		lf = interpolate(input.crop(0,0,0,input.height/2)) 
		rf = interpolate(input.crop(0,input.height/2,0,0)) 
		StackVertical(lf, rf)""") : input 
Prefetch(threads) 
SetMemoryMax(10240) 
global threads=24 
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow1.dll") 
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow2.dll") 
SetFilterMTMode("DEFAULT_MT_MODE",2) 
SetFilterMTMode("SVSuper",1) 
SetFilterMTMode("SVAnalyse",1) 
LWLibavVideoSource("h1.mkv") 
ConvertToYV12() 
global crop_string  = "" 
global resize_string = "" 
global super_params = "{pel:1,gpu:1,full:false}" 
global analyse_params = "{block:{w:32,h:16,overlap:2},main:{levels:5,search:{type:4,distance:-12,coarse:{type:4,distance:-1,trymany: true,bad:{range:0}}},penalty:{lambda: 3.33, plevel: 1.33, lsad: 3300, pzero: 110, pnbour: 50}},refine:[{ thsad: 400 }, { thsad: 200, search: { type: 4, distance: -4 } }]}" 
global smoothfps_params = "{gpuid:0,rate:{num:60000,den:1001,abs:true},algo:23,mask:{cover: 80, area: 30, area_sharp: 0.75 },scene: { mode: 0, limits: { scene: 6000, zero: 100, blocks: 40 } }}" 
global demo_mode=0 
global stereo_type=0 
function interpolate(clip src) 
{ 
	input = crop_string=="" ? src : eval("src."+crop_string) 
	input = resize_string=="" ? input : eval("input."+resize_string) 
	#MT-MODE-1  #do not remove this line 
	super=SVSuper(input, super_params) 
	vectors=SVAnalyse(super, analyse_params, src=input) 
	smooth=SVSmoothFps(input, super, vectors, smoothfps_params, mt=threads, src=src) 
	#MT-MODE-2  #do not remove this line 
	return demo_mode==0 ? smooth : demo(input,smooth) 
} 
input=last 
	stereo_type==0 ? eval(""" interpolate(input) 
""") : 	stereo_type==1 ? eval(""" 
		lf = interpolate(input.crop(0,0,input.width/2,0)) 
		rf = interpolate(input.crop(input.width/2,0,0,0)) 
		StackHorizontal(lf, rf) 
""") : 	stereo_type==2 ? Eval(""" 
		lf = interpolate(input.crop(0,0,0,input.height/2)) 
		rf = interpolate(input.crop(0,input.height/2,0,0)) 
		StackVertical(lf, rf)""") : input 
Prefetch(threads)SetMemoryMax(10240)  
global threads=24  
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow1.dll")  
LoadPlugin("c:\Program Files (x86)\AviSynth+\plugins64\svpflow2.dll")  
SetFilterMTMode("DEFAULT_MT_MODE",2)  
SetFilterMTMode("SVSuper",1)  
SetFilterMTMode("SVAnalyse",1)  
LWLibavVideoSource("h1.mkv")  
ConvertToYV12()  
global crop_string  = ""  
global resize_string = ""  
global super_params = "{pel:1,gpu:1,full:false}"  
global analyse_params = "{block:{w:32,h:16,overlap:2},main:{levels:5,search:{type:4,distance:-12,coarse:{type:4,distance:-1,trymany: true,bad:{range:0}}},penalty:{lambda: 3.33, plevel: 1.33, lsad: 3300, pzero: 110, pnbour: 50}},refine:[{ thsad: 400 }, { thsad: 200, search: { type: 4, distance: -4 } }]}"  
global smoothfps_params = "{gpuid:21,rate:{num:60000,den:1001,abs:true},algo:23,mask:{cover: 80, area: 30, area_sharp: 0.75 },scene: { mode: 0, limits: { scene: 6000, zero: 100, blocks: 40 } }}"  
global demo_mode=0  
global stereo_type=0  
function interpolate(clip src)  
{  
	input = crop_string=="" ? src : eval("src."+crop_string)  
	input = resize_string=="" ? input : eval("input."+resize_string)  
	#MT-MODE-1  #do not remove this line  
	super=SVSuper(input, super_params)  
	vectors=SVAnalyse(super, analyse_params, src=input)  
	smooth=SVSmoothFps(input, super, vectors, smoothfps_params, mt=threads, src=src)  
	#MT-MODE-2  #do not remove this line  
	return demo_mode==0 ? smooth : demo(input,smooth)  
}  
input=last  
	stereo_type==0 ? eval(""" interpolate(input)  
""") : 	stereo_type==1 ? eval("""  
		lf = interpolate(input.crop(0,0,input.width/2,0))  
		rf = interpolate(input.crop(input.width/2,0,0,0))  
		StackHorizontal(lf, rf)  
""") : 	stereo_type==2 ? Eval("""  
		lf = interpolate(input.crop(0,0,0,input.height/2))  
		rf = interpolate(input.crop(0,input.height/2,0,0))  
		StackVertical(lf, rf)""") : input  
Prefetch(threads)  
