#define file_ini_js_init
/// @description  ()
global.file_ini_eschash = undefined;
if (false) {
	gmcallback_file_ini_open("");
	gmcallback_file_ini_flush("", "");
}

#define gmcallback_file_ini_open
/// @description  (path, secure)
/// @param path
/// @param  secure
var path = argument0, s;
if (argument1) {
	var q = ds_map_secure_load(path);
	if (q != -1) {
		s = q[?""];
		ds_map_destroy(q);
		return s;
	} else return undefined;
} else if (file_exists(path)) {
	var f = file_text_open_read(path);
	if (f < 0) return undefined;
	s = "";
	while (!file_text_eof(f)) {
		s += file_text_read_string(f) + chr(13) + chr(10);
		file_text_readln(f);
	}
	file_text_close(f);
	return s;
} else return undefined;

#define gmcallback_file_ini_flush
/// @description  (path, text, secure)
/// @param path
/// @param  text
/// @param  secure
var path = argument0, text = argument1, file;
if (argument2) {
	var tmp = ds_map_create();
	tmp[?""] = text;
	ds_map_secure_save(tmp, path);
	ds_map_destroy(tmp);
} else {
	//{ http://bugs.yoyogames.com/view.php?id=25577
	if (is_undefined(global.file_ini_eschash)) {
		//
		file = file_text_open_write(path);
		file_text_write_string(file, "<#>");
		file_text_close(file);
		//
		file = file_text_open_read(path);
		global.file_ini_eschash = (file_text_read_string(file) == "<");
		file_text_close(file);
	}
	if (global.file_ini_eschash) text = string_replace_all(text, "#", "\\#");
	//}
	file = file_text_open_write(path);
	file_text_write_string(file, text);
	file_text_close(file);
}

