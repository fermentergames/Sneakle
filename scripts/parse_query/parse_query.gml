///
function get_query() {
if (live_call()) return live_result;
	var p_num;
	p_num = parameter_count();
	if (p_num > 0) {
	   var i;
	   for (i = 0; i < p_num; i += 1) {
	      p_string[i] = parameter_string(i + 1);
			parse_query(p_string[i])
	   }
		
		show_debug_message("query string array created")
		show_debug_message(p_string)
		
		if global.loadBoard != "" && global.loadSecret != "" {
			scr_board_init()
		}
		

	} else {
		show_debug_message("no query string")
		return false;	
	}

}


function parse_query(_query_string) {
if (live_call(argument0)) return live_result;

	var equalPos = string_pos("=", _query_string);
	var returnStr;

	if (equalPos != 0) {
		returnStr[0] = string_delete(_query_string, equalPos, string_length(_query_string) - equalPos + 1);
		returnStr[1] = string_delete(_query_string, 0, equalPos + 1);
		returnStr[2] = string_copy(_query_string, equalPos+1, string_length(_query_string) - equalPos + 1);
	  
		show_debug_message("returnStr[0]")
		show_debug_message(returnStr[0])
		show_debug_message("returnStr[1]")
		show_debug_message(returnStr[1])
		show_debug_message("returnStr[2]")
		show_debug_message(returnStr[2])
	  
		if returnStr[0] = "loadBoard" {
			global.loadBoard = returnStr[2]
		}
		if returnStr[0] = "loadSecret" {
			global.loadSecret = returnStr[2]
		}
		
		
	  
		return returnStr;
		
	} else {
		//Not a valid query string
		show_debug_message("query string had no equals sign")
		return false;
	}
	
	
	
}