///
/// @description Update canvas dimensions

if (live_call()) return live_result;


var w = browser_width;
var h = browser_height;

// find screen pixel dimensions:
if global.is_browser = 1 {
	global.pr = browser_get_device_pixel_ratio();
} else {
	global.pr = 1
}

show_debug_message("global.pr: "+string(global.pr))

var rw = w * global.pr;
var rh = h * global.pr;

view_wport[0] = rw;
view_hport[0] = rh;
global.sw = rw
global.sh = rh
//global.sw_s = global.sw*global.pr
//global.sh_s = global.sh*global.pr

if global.sw >= global.sh {
	global.is_landscape = 1
	//show_debug_message("AHHH")
} else {
	global.is_landscape = 0	
	//show_debug_message("OKAY")
}

// update room/view size:

var _tile_sz_and_pad = global.tile_size+global.pad_size

global.cam_zoom = (((_tile_sz_and_pad*global.game_grid_size)+90)/w)*1.5
if global.sw >= global.sh*0.6 {
	global.cam_zoom = (((_tile_sz_and_pad*global.game_grid_size)+50)/h)*2.8
}

show_debug_message(global.cam_zoom)

//scr_update_room_dimensions(w*global.cam_zoom,h*global.cam_zoom)
camera_set_view_size(view_camera[0], w*global.cam_zoom, h*global.cam_zoom);
//center cam
camera_set_view_pos(view_camera[0],-(w*global.cam_zoom/2),(-h*global.cam_zoom/2))


//display_set_gui_maximize(global.pr,global.pr)
//display_set_gui_size(rw,rh)

//sbox_top = (global.sh*0.5)+(global.sw*-0.5)
//sbox_btm = (global.sh*0.5)+(global.sw*0.5)
//sbox_ymarg = (global.sh-global.sw)*0.5

//if global.is_landscape = 1 {
//	sbox_top = (global.sh*0.0)//+(global.sw*-0.5)
//	sbox_btm = (global.sh*1.0)//+(global.sw*0.5)
//}

// resize application_surface, if needed
if (application_surface_is_enabled()) {
	surface_resize(application_surface, rw, rh);
	show_debug_message("application_surface_is_enabled = 1")
} else {
	show_debug_message("application_surface_is_enabled = 0")	
}

show_debug_message("resizing surface: "+string(rw)+", "+string(rh))

// set window size to screen pixel size:
//

if global.is_browser = 1 {
window_set_size(rw, rh);
// set canvas size to page pixel size:
browser_stretch_canvas(w, h);
}
