if (live_call()) return live_result;

draw_set_font(fnt_main)
//if os_type == os_windows || os_type == os_macosx {
//	device_mouse_dbclick_enable(false);
//} else {
//	device_mouse_dbclick_enable(true);
//}


device_mouse_dbclick_enable(false);

global.grid_x_origin = 0
global.grid_y_origin = 0

global.sw = browser_width
global.sh = browser_height
global.cam_zoom = 1
global.cam_zoom_fd = 1

global.am_creating_fd = 1

global.game_grid_size = 4
global.game_grid_size_sqr = sqr(global.game_grid_size)
global.tile_size = 64
global.pad_size = 0

global.loadBoard = ""
global.loadSecret = ""
global.show_input_prompt = 0
global.show_export_prompt = 0

global.current_copy_code = "ABCD_1-2-3-4"
global.current_copy_url = "https://fermentergames.github.io/Sneakle/?loadBoard=ABCD&loadSecret=1-2-3-4"


//am_screenshotting = 0
//am_screenshotting_fd = 0

//donate_button = -1
//fullscreen_button = -1
//alarm[0] = 30

global.is_browser = 0
if os_browser != browser_not_a_browser {
	global.is_browser = 1	
}

global.game_grid_size = 4

curr_width = browser_width
curr_height = browser_height
//if global.is_browser = 1 {
event_user(0);

if global.is_browser = 1 {
	
	

} else {
	if !instance_exists(obj_gmlive) {
		instance_create_layer(x,y,layer,obj_gmlive)
	}
}

timey = 0

global.game_phase = 0
just_phase_changed = 0

ready_for_phase2 = 0
ready_for_phase2_fd = 0

ready_for_phase3 = 0

selecting = 0

selected_word_length = 0
selected_word_str = ""
selected_word_array = 0
selected_word_array_id = 0
selected_word_latest_tile = -1
selected_word_latest_tile_id = -1

secret_word_length = 0
secret_word_str = ""
secret_word_array = 0

guesses_count = 0

device_mouse_dbclick_enable(true)

randomize()

p_string = 0 //reset
get_query()

//if global.loadBoard = "" && global.loadSecret = "" {
	
//	show_debug_message("no query loaded, try to load from parent")
	
//	global.loadBoard = useParentLoadBoardQueryString()
//	global.loadSecret = useParentLoadSecretQueryString()
	
//	show_debug_message("global.loadBoard = "+string(global.loadBoard))
//	show_debug_message("global.loadSecret = "+string(global.loadSecret))
	
//	//changeQuery("loadBoard",string(returnStr[0]),"loadSecret",returnStr[1])
	
//	if global.loadBoard != "" && global.loadSecret != "" && global.loadBoard != "undefined" && global.loadSecret != "undefined" && global.loadBoard != undefined && global.loadSecret != undefined {
//		scr_board_init()
//	}
//}

form_is_loading = false;

//global.loadBoard = "THAINORAYMFUJCET"
//global.loadSecret = "2-6-10-15"

//html_init()
//html_style()

// To use this extension, you need to call #html_init() and optionally #html_style() during initialisation, 
// and #html_sync() in an draw GUI end event




