///
function scr_update_copy_code(){
	
	global.current_copy_code = ""
	//global.current_copy_url = "https://fermentergames.github.io/Sneakle/?loadBoard=ABCD&loadSecret=1-2-3-4"
	show_debug_message("get_window_host()")
	show_debug_message(get_window_host())
	global.current_copy_url = string(get_window_host())
	global.current_copy_url += "?loadBoard="
	
	
	for (var l = 1; l <= global.game_grid_size_sqr; ++l) {
		global.current_copy_code += global.letters[l]
		global.current_copy_url += global.letters[l]
		//show_debug_message(global.letters[l])
	}
	
	global.current_copy_code += "_"
	global.current_copy_url += "&loadSecret="
	
	for (var l = 0; l < secret_word_length; ++l) {
		global.current_copy_code += string(secret_word_array[l])
		global.current_copy_url += string(secret_word_array[l])
		
		if l < secret_word_length-1 {
			global.current_copy_code += "-"
			global.current_copy_url += "-"
		}
	}
	
	show_debug_message("global.current_copy_code:")
	show_debug_message(global.current_copy_code)
	
	show_debug_message("global.current_copy_url:")
	show_debug_message(global.current_copy_url)
	
	
	/////////////////////////////////////////
	//now do the url
	
	

	
	
}