/// @param element
function html_submit_login(argument0) {
	
	var element = argument0;
	var values = html_form_values(element);

	loadCode = values[? "loadCode"];
	form_is_loading = true
	alarm[0] = 90;
	
	show_debug_message("SUBMITTED!")
	show_debug_message(loadCode)
	
	//if global.loadBoard != "" && global.loadSecret != "" {
	//	scr_board_init()
	//}
	
	global.show_input_prompt = 0
	form_is_loading = false;
	

	
	var underscorePos = string_pos("_", loadCode);
	var returnStr;

	if (underscorePos != 0) {
		
		returnStr[0] = string_delete(loadCode, underscorePos, string_length(loadCode) - underscorePos + 1);
		returnStr[1] = string_copy(loadCode, underscorePos+1, string_length(loadCode) - underscorePos + 1);

		changeQuery("loadBoard",string(returnStr[0]),"loadSecret",returnStr[1])

	} else {
		show_message("code invalid")
		changeQuery("loadBoard","","loadSecret","")
	}


	ds_map_destroy(values)

}
