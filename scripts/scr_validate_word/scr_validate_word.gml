///
function scr_validate_word() {
	if (live_call()) return live_result;
	
	var _valid_guess = 1
	selected_word_not_in_dictionary = 0 //reset
	selected_word_is_valid = 1 //reset
	
	if selected_word_length <= 3 {
		_valid_guess = 0
		selected_word_is_valid = 0
	}
			
	
	if _valid_guess = 1 {

		var _letters_str = ""
		for (var l = 0; l < selected_word_length; ++l) {
			_letters_str += global.letters[selected_word_array[l]]
		}
		selected_word_str = _letters_str
				
		show_debug_message("selected word is: "+string(selected_word_str))
		show_debug_message("length: "+string(selected_word_length))
				

		//show_debug_message(global.dictionary)
				
		var word = string_lower(selected_word_str)
		if (global.dictionary.check(word)) {
			show_debug_message("\"" + word + "\" is a valid English word.");
		} else {
			show_debug_message("\"" + word + "\" is not a valid English word.");
			_valid_guess = 0
			selected_word_not_in_dictionary = 1
			selected_word_is_valid = 0
		}
				
	}
	
	return _valid_guess;
}