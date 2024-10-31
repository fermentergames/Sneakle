#define file_ini_init
// Generated at 2021-02-12 18:42:54 (414ms) for v2.3+

// file.ini:
globalvar file_ini_quote_keys; file_ini_quote_keys = false;
globalvar file_ini_quote_values; file_ini_quote_values = false;
globalvar file_ini_trail_comments; file_ini_trail_comments = true;
// file_ini_std.mathnf:
globalvar file_ini_std_mathnf_not_a_number; file_ini_std_mathnf_not_a_number = file_ini_std_mathnf_init(0, 0);


//{ file.ini

#define file_ini_destroy
// file_ini_destroy(this:ini)
var this = argument[0];
var l_scl = this[3/* section_list */];
var l_i = 0;
for (var l__g1 = ds_list_size(l_scl); l_i < l__g1; l_i++) {
	var l__this = l_scl[|l_i];
	ds_list_destroy(l__this[1/* items */]);
	ds_map_destroy(l__this[2/* pairs */]);
}
ds_list_destroy(l_scl);
ds_map_destroy(this[4/* section_map */]);

#define file_ini_close
// file_ini_close(this:ini)
var this = argument[0];
if (this[0/* changed */]) {
	this[@0/* changed */] = false;
	switch (this[1/* format */]) {
		case 2:
			var l_tmp = ds_map_create();
			l_tmp[?""] = file_ini_print(this);
			ds_map_secure_save(l_tmp, this[2/* path */]);
			ds_map_destroy(l_tmp);
			break;
		case 1:
			var l_path1 = this[2/* path */];
			var l_text = file_ini_print(this);
			var l_saveFile = file_text_open_write(l_path1);
			if (l_saveFile != -1) {
				file_text_write_string(l_saveFile, l_text);
				file_text_close(l_saveFile);
			}
			break;
	}
}
file_ini_destroy(this);

#define file_ini_flush
// file_ini_flush(this:ini)
var this = argument[0];
if (this[0/* changed */]) {
	this[@0/* changed */] = false;
	switch (this[1/* format */]) {
		case 1:
			var l_path1 = this[2/* path */];
			var l_text = file_ini_print(this);
			var l_saveFile = file_text_open_write(l_path1);
			if (l_saveFile != -1) {
				file_text_write_string(l_saveFile, l_text);
				file_text_close(l_saveFile);
			}
			break;
		case 2:
			var l_tmp = ds_map_create();
			l_tmp[?""] = file_ini_print(this);
			ds_map_secure_save(l_tmp, this[2/* path */]);
			ds_map_destroy(l_tmp);
			break;
	}
}

#define file_ini_bind
// file_ini_bind(this:ini, ?path:string, secure:bool = false)
var this = argument[0], l_path1, l_secure;
if (argument_count > 1) l_path1 = argument[1]; else l_path1 = undefined;
if (argument_count > 2) l_secure = argument[2]; else l_secure = false;
this[@2/* path */] = l_path1;
if (l_path1 != undefined) {
	if (l_secure) this[@1/* format */] = 2; else this[@1/* format */] = 1;
} else this[@1/* format */] = 0;
this[@0/* changed */] = true;

#define file_ini_section_add_raw
// file_ini_section_add_raw(this:ini, name:string)->section
var this = argument[0], l_name = argument[1];
var l_sct = file_ini_section_create(l_name);
if (l_name == "") ds_list_insert(this[3/* section_list */], 0, l_sct); else ds_list_add(this[3/* section_list */], l_sct);
this[4/* section_map */][?l_sct[0/* name */]] = l_sct;
l_sct[@3/* prefix */] = this[5/* next_sep */];
l_sct[@4/* next_sep */] = this[5/* next_sep */];
l_sct[@5/* next_equ */] = this[6/* next_equ */];
return l_sct;

#define file_ini_section_delete
// file_ini_section_delete(this:ini, name:string)
var this = argument[0], l_name = argument[1];
var l_sct = this[4/* section_map */][?l_name];
if (l_sct == undefined) return 0;
var l__this = this[3/* section_list */];
ds_list_delete(l__this, ds_list_find_index(l__this, l_sct));
ds_map_delete(this[4/* section_map */], l_name);
ds_list_destroy(l_sct[1/* items */]);
ds_map_destroy(l_sct[2/* pairs */]);
this[@0/* changed */] = true;

#define file_ini_section_exists
// file_ini_section_exists(this:ini, name:string)->bool
var this = argument[0], l_name = argument[1];
return this[4/* section_map */][?l_name] != undefined;

#define file_ini_section_names
// file_ini_section_names(this:ini)->array<string>
var this = argument[0];
var l_out = [];
var l_found = 0;
var l_scl = this[3/* section_list */];
var l_i = 0;
for (var l__g1 = ds_list_size(l_scl); l_i < l__g1; l_i++) {
	var l_sct = l_scl[|l_i];
	if (ds_list_size(l_sct[1/* items */]) > 0) {
		l_out[@l_found] = l_sct[0/* name */];
		l_found++;
	}
}
return l_out;

#define file_ini_read_raw
// file_ini_read_raw(this:ini, section:string, key:string)->string
var this = argument[0], l_section = argument[1], l_key = argument[2];
var l_sct = this[4/* section_map */][?l_section];
if (l_sct != undefined) {
	var l_pair = l_sct[2/* pairs */][?l_key];
	if (l_pair != undefined) return l_pair[2/* val */];
}
return undefined;

#define file_ini_write_raw
// file_ini_write_raw(this:ini, section:string, key:string, val:string)
var this = argument[0], l_section = argument[1], l_key = argument[2], l_val = argument[3];
var l_sct = this[4/* section_map */][?l_section];
if (l_sct == undefined) l_sct = file_ini_section_add_raw(this, l_section);
var l_pair = l_sct[2/* pairs */][?l_key];
if (l_pair == undefined) {
	l_pair = file_ini_pair_create();
	l_pair[@0/* key */] = l_key;
	l_pair[@2/* val */] = l_val;
	l_pair[@1/* equ */] = l_sct[5/* next_equ */];
	var l_item = [2/* item.pair */, l_pair];
	l_pair[@3/* item */] = l_item;
	var l_items = l_sct[1/* items */];
	var l_num = ds_list_size(l_items);
	if (l_num > 0) {
		var l__g = l_items[|l_num - 1];
		if (l__g[0]/* file_ini_item */ == 0/* sep */) var l__g1 = l__g[1]; else ds_list_add(l_items, l_sct[4/* next_sep */]);
	} else if (l_section != "") {
		ds_list_add(l_items, l_sct[4/* next_sep */]);
	}
	ds_list_add(l_items, l_item);
	l_sct[2/* pairs */][?l_key] = l_pair;
} else l_pair[@2/* val */] = l_val;
this[@0/* changed */] = true;

#define file_ini_key_exists
// file_ini_key_exists(this:ini, section:string, key:string)->bool
var this = argument[0], l_section = argument[1], l_key = argument[2];
var l_sct = this[4/* section_map */][?l_section];
return l_sct != undefined && ds_map_exists(l_sct[2/* pairs */], l_key);

#define file_ini_key_delete
// file_ini_key_delete(this:ini, section:string, key:string)->bool
var this = argument[0], l_section = argument[1], l_key = argument[2];
var l_sct = this[4/* section_map */][?l_section];
if (l_sct == undefined) return false;
var l_pair = l_sct[2/* pairs */][?l_key];
if (l_pair == undefined) return false;
var l_item = l_pair[3/* item */];
var l_items = l_sct[1/* items */];
var l_pos = ds_list_find_index(l_items, l_item);
ds_list_delete(l_items, l_pos);
if (l_pos < ds_list_size(l_items)) {
	if (l_items[|l_pos][0]/* file_ini_item */ == 1/* comment */) ds_list_delete(l_items, l_pos);
}
if (l_pos > 0) {
	if (l_items[|l_pos - 1][0]/* file_ini_item */ == 0/* sep */) ds_list_delete(l_items, l_pos - 1);
}
ds_map_delete(l_sct[2/* pairs */], l_key);
this[@0/* changed */] = true;
return true;

#define file_ini_key_names
// file_ini_key_names(this:ini, section:string)->array<string>
var this = argument[0], l_section = argument[1];
var l_sct = this[4/* section_map */][?l_section];
if (l_sct == undefined) return undefined;
var l_out = [];
var l_num = 0;
var l_scl = l_sct[1/* items */];
var l_i = 0;
for (var l__g1 = ds_list_size(l_scl); l_i < l__g1; l_i++) {
	var l_item = l_scl[|l_i];
	if (l_item[0]/* file_ini_item */ == 2/* pair */) {
		var l_p = l_item[1];
		l_out[@l_num] = l_p[0/* key */];
		l_num++;
	}
}
return l_out;

#define file_ini_print
// file_ini_print(this:ini)->string
var this = argument[0];
var l_r = buffer_create(4, buffer_grow, 1);
var l_qs, l_qz, l_qitem;
var l_scl = this[3/* section_list */];
var l_i = 0;
for (var l__g1 = ds_list_size(l_scl); l_i < l__g1; l_i++) {
	var l_sct = l_scl[|l_i];
	if (l_sct[0/* name */] != "") {
		if (l_sct[3/* prefix */] != undefined && buffer_tell(l_r) > 0) {
			var l__g2 = l_sct[3/* prefix */];
			switch (l__g2[0]/* file_ini_item */) {
				case 1/* comment */: buffer_write(l_r, buffer_text, l__g2[1]); break;
				case 0/* sep */: buffer_write(l_r, buffer_text, l__g2[1]); break;
			}
		}
		buffer_write(l_r, buffer_u8, 91);
		l_qs = l_sct[0/* name */];
		l_qz = file_ini_std_string_pos_ext_haxe(l_qs, "]") >= 0;
		if (l_qz || file_ini_std_string_pos_ext_haxe(l_qs, "\r") >= 0 || file_ini_std_string_pos_ext_haxe(l_qs, "\n") >= 0 || file_ini_std_string_pos_ext_haxe(l_qs, "\"") >= 0) {
			buffer_write(l_r, buffer_u8, 34);
			buffer_write(l_r, buffer_text, string_replace_all(string_replace_all(string_replace_all(l_qs, "\r", "\\r"), "\n", "\\n"), "\"", "\\\""));
			buffer_write(l_r, buffer_u8, 34);
		} else buffer_write(l_r, buffer_text, l_qs);
		buffer_write(l_r, buffer_u8, 93);
	}
	var l_sil = l_sct[1/* items */];
	var l_k = 0;
	for (var l__g4 = ds_list_size(l_sil); l_k < l__g4; l_k++) {
		l_qitem = l_sil[|l_k];
		switch (l_qitem[0]/* file_ini_item */) {
			case 2/* pair */:
				var l_p = l_qitem[1];
				l_qs = l_p[0/* key */];
				l_qz = file_ini_quote_keys || file_ini_print_rf_trim(l_qs);
				if (l_qz || file_ini_std_string_pos_ext_haxe(l_qs, "\r") >= 0 || file_ini_std_string_pos_ext_haxe(l_qs, "\n") >= 0 || file_ini_std_string_pos_ext_haxe(l_qs, "\"") >= 0) {
					buffer_write(l_r, buffer_u8, 34);
					buffer_write(l_r, buffer_text, string_replace_all(string_replace_all(string_replace_all(l_qs, "\r", "\\r"), "\n", "\\n"), "\"", "\\\""));
					buffer_write(l_r, buffer_u8, 34);
				} else buffer_write(l_r, buffer_text, l_qs);
				buffer_write(l_r, buffer_text, l_p[1/* equ */]);
				l_qs = l_p[2/* val */];
				l_qz = file_ini_quote_values || file_ini_print_rf_trim(l_qs);
				if (l_qz || file_ini_std_string_pos_ext_haxe(l_qs, "\r") >= 0 || file_ini_std_string_pos_ext_haxe(l_qs, "\n") >= 0 || file_ini_std_string_pos_ext_haxe(l_qs, "\"") >= 0) {
					buffer_write(l_r, buffer_u8, 34);
					buffer_write(l_r, buffer_text, string_replace_all(string_replace_all(string_replace_all(l_qs, "\r", "\\r"), "\n", "\\n"), "\"", "\\\""));
					buffer_write(l_r, buffer_u8, 34);
				} else buffer_write(l_r, buffer_text, l_qs);
				break;
			case 1/* comment */: buffer_write(l_r, buffer_text, l_qitem[1]); break;
			case 0/* sep */: buffer_write(l_r, buffer_text, l_qitem[1]); break;
		}
	}
}
var l_out = file_ini_std_string_builder_print(l_r);
buffer_delete(l_r);
return l_out;

#define file_ini_read_string
// file_ini_read_string(this:ini, section:string, key:string, defValue:string)->string
var this = argument[0], l_section = argument[1], l_key = argument[2], l_defValue = argument[3];
var l_r = file_ini_read_raw(this, l_section, l_key);
if (l_r != undefined) return l_r; else return l_defValue;

#define file_ini_read_real
// file_ini_read_real(this:ini, section:string, key:string, defValue:real)->real
var this = argument[0], l_section = argument[1], l_key = argument[2], l_defValue = argument[3];
var l_s = file_ini_read_raw(this, l_section, l_key);
if (l_s == undefined) return l_defValue;
var l_r = file_ini_std_Std_parseFloat(l_s);
if (file_ini_std_mathnf_isNaN(l_r)) return l_defValue; else return l_r;

#define file_ini_read_int
// file_ini_read_int(this:ini, section:string, key:string, defValue:int)->int
var this = argument[0], l_section = argument[1], l_key = argument[2], l_defValue = argument[3];
var l_s = file_ini_read_raw(this, l_section, l_key);
if (l_s == undefined) return l_defValue;
var l_r = file_ini_std_Std_parseFloat(l_s);
if (file_ini_std_mathnf_isNaN(l_r)) return l_defValue; else return (l_r | 0);

#define file_ini_write_string
// file_ini_write_string(this:ini, section:string, key:string, value:string)
var this = argument[0], l_section = argument[1], l_key = argument[2], l_value = argument[3];
file_ini_write_raw(this, l_section, l_key, string(l_value));

#define file_ini_write_real
// file_ini_write_real(this:ini, section:string, key:string, value:real)
var this = argument[0], l_section = argument[1], l_key = argument[2], l_value = argument[3];
file_ini_write_raw(this, l_section, l_key, file_ini_std_Std_stringify(l_value));

#define file_ini_write_int
// file_ini_write_int(this:ini, section:string, key:string, value:int)
var this = argument[0], l_section = argument[1], l_key = argument[2], l_value = argument[3];
file_ini_write_raw(this, l_section, l_key, string((l_value | 0)));

//}

//{ file.ini

#define file_ini_create
// file_ini_create()
var this = array_create(7);
this[@6/* next_equ */] = "=";
this[@5/* next_sep */] = [0/* item.sep */, "\r\n"];
this[@4/* section_map */] = ds_map_create();
this[@3/* section_list */] = ds_list_create();
this[@2/* path */] = undefined;
this[@1/* format */] = 0;
this[@0/* changed */] = false;
file_ini_section_add_raw(this, "");
return this;

#define file_ini_opt_quote_keys
// file_ini_opt_quote_keys(?force:bool)->bool
var l_force;
if (argument_count > 0) l_force = argument[0]; else l_force = undefined;
if (l_force != undefined) {
	file_ini_quote_keys = l_force;
	return l_force;
} else return file_ini_quote_keys;

#define file_ini_opt_quote_values
// file_ini_opt_quote_values(?force:bool)->bool
var l_force;
if (argument_count > 0) l_force = argument[0]; else l_force = undefined;
if (l_force != undefined) {
	file_ini_quote_values = l_force;
	return l_force;
} else return file_ini_quote_values;

#define file_ini_opt_trailing_comments
// file_ini_opt_trailing_comments(?allow:bool)->bool
var l_allow;
if (argument_count > 0) l_allow = argument[0]; else l_allow = undefined;
if (l_allow != undefined) {
	file_ini_trail_comments = l_allow;
	return l_allow;
} else return file_ini_trail_comments;

#define file_ini_print_rf_trim
// file_ini_print_rf_trim(s:string)->bool
var l_s = argument[0];
return (string_length(l_s) == 0 || file_ini_std_string_pos_ext_haxe(" \t", string_char_at(l_s, 1)) >= 0) || file_ini_std_string_pos_ext_haxe(" \t", string_char_at(l_s, string_length(l_s) - 1 + 1)) >= 0;

#define file_ini_parse_unescape
// file_ini_parse_unescape(s:string)->string
var l_s = argument[0];
l_s = string_replace_all(string_replace_all(string_replace_all(l_s, "\\r", "\r"), "\\n", "\n"), "\\\"", "\"");
return l_s;

#define file_ini_parse
// file_ini_parse(src:string)->ini
var l_src = argument[0];
var l_out = file_ini_create();
if (string_length(l_src) == 0) return l_out;
var l_c, l_qc, l_s;
var l_q_source = file_ini_std_string_reader_buf(l_src);
var l_q_length = buffer_get_size(l_q_source);
var l_q_pos = 0;
if (buffer_peek(l_q_source, 0, buffer_u8) == 239 && buffer_peek(l_q_source, 1, buffer_u8) == 187 && buffer_peek(l_q_source, 2, buffer_u8) == 191) l_q_pos = 3;
if (file_ini_std_string_pos_ext_haxe(l_src, "\r") >= 0) l_s = (file_ini_std_string_pos_ext_haxe(l_src, "\n") >= 0 ? "\r\n" : "\r"); else l_s = "\n";
var l_sep = [0/* item.sep */, l_s];
var l_sep2 = l_sep;
var l_equ = "=";
l_out[@5/* next_sep */] = l_sep;
l_out[@6/* next_equ */] = l_equ;
var l_section = l_out[3/* section_list */][|0];
var l_items = l_section[1/* items */];
var l_item;
var l_tco = file_ini_trail_comments;
var l_start = l_q_pos;
while (l_q_pos < l_q_length) {
	l_c = buffer_peek(l_q_source, l_q_pos, buffer_u8);
	switch (l_c) {
		case 9: case 10: case 13: case 32: l_q_pos++; break;
		default:
			if (l_q_pos > l_start) {
				l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_q_pos);
				l_sep2 = l_sep;
				l_sep = [0/* item.sep */, l_s];
				ds_list_add(l_items, l_sep);
			} else l_sep2 = undefined;
			l_start = l_q_pos;
			var l_valid;
			switch (l_c) {
				case 35: case 59:
					while (l_q_pos < l_q_length) {
						switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
							case 10: case 13: break;
							default:
								l_q_pos++;
								continue;
						}
						break;
					}
					l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_q_pos);
					ds_list_add(l_items, [1/* item.comment */, l_s]);
					break;
				case 91:
					l_s = undefined;
					while (l_q_pos < l_q_length) {
						switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
							case 34:
								if (l_q_pos == l_start + 1) {
									l_qc = l_c;
									l_q_pos++;
									l_start = l_q_pos;
									while (l_q_pos < l_q_length) {
										l_c = buffer_peek(l_q_source, l_q_pos, buffer_u8);
										if (l_c == l_qc) {
											break;
										} else if (l_c == 92) {
											l_q_pos++;
											l_q_pos++;
										} else l_q_pos++;
									}
									l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_q_pos);
									l_s = file_ini_parse_unescape(l_s);
									if (l_c == l_qc) l_q_pos++;
								} else {
									l_q_pos++;
									continue;
								}
								break;
							case 93:
								if (l_s == undefined) l_s = file_ini_std_string_reader_sub(l_q_source, l_start + 1, l_q_pos);
								var l_next = file_ini_section_add_raw(l_out, l_s);
								if (l_sep2 != undefined) {
									ds_list_delete(l_items, ds_list_size(l_items) - 1);
									l_next[@3/* prefix */] = l_sep;
									l_sep = l_sep2;
								}
								l_section[@4/* next_sep */] = l_sep;
								l_section[@5/* next_equ */] = l_equ;
								l_section = l_next;
								l_items = l_section[1/* items */];
								l_q_pos++;
								break;
							default:
								l_q_pos++;
								continue;
						}
						break;
					}
					break;
				default:
					var l_till = l_start;
					var l_pair = file_ini_pair_create();
					l_valid = true;
					if (l_c == 34 || l_c == 39) {
						l_qc = l_c;
						l_q_pos++;
						l_start = l_q_pos;
						while (l_q_pos < l_q_length) {
							l_c = buffer_peek(l_q_source, l_q_pos, buffer_u8);
							if (l_c == l_qc) {
								break;
							} else if (l_c == 92) {
								l_q_pos++;
								l_q_pos++;
							} else l_q_pos++;
						}
						l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_q_pos);
						l_s = file_ini_parse_unescape(l_s);
						if (l_c == l_qc) l_q_pos++;
						l_till = l_q_pos;
						while (l_q_pos < l_q_length) {
							switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
								case 61: l_q_pos++; break;
								case 9: case 32:
									l_q_pos++;
									continue;
								default: l_valid = false;
							}
							break;
						}
					} else {
						while (l_q_pos < l_q_length) {
							switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
								case 61: l_q_pos++; break;
								case 35: case 59: l_valid = false; break;
								case 10: case 13: l_valid = false; break;
								case 9: case 32:
									l_q_pos++;
									continue;
								default:
									l_till = l_q_pos;
									l_q_pos++;
									continue;
							}
							break;
						}
						l_till++;
						l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_till);
					}
					l_pair[@0/* key */] = l_s;
					if (l_valid) while (l_q_pos < l_q_length) {
						l_c = buffer_peek(l_q_source, l_q_pos, buffer_u8);
						switch (l_c) {
							case 10: case 13: l_valid = false; break;
							case 9: case 32:
								l_q_pos++;
								continue;
						}
						break;
					}
					if (l_valid) {
						l_s = file_ini_std_string_reader_sub(l_q_source, l_till, l_q_pos);
						l_equ = l_s;
						l_pair[@1/* equ */] = l_s;
						l_item = [2/* item.pair */, l_pair];
						l_pair[@3/* item */] = l_item;
						ds_list_add(l_items, l_item);
						l_section[2/* pairs */][?l_pair[0/* key */]] = l_pair;
						l_start = l_q_pos;
						if (l_c == 34 || l_c == 39) {
							l_qc = l_c;
							l_q_pos++;
							l_start = l_q_pos;
							while (l_q_pos < l_q_length) {
								l_c = buffer_peek(l_q_source, l_q_pos, buffer_u8);
								if (l_c == l_qc) {
									break;
								} else if (l_c == 92) {
									l_q_pos++;
									l_q_pos++;
								} else l_q_pos++;
							}
							l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_q_pos);
							l_s = file_ini_parse_unescape(l_s);
							if (l_c == l_qc) l_q_pos++;
							l_till = l_q_pos;
							while (l_q_pos < l_q_length) {
								switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
									case 10: case 13: break;
									case 35: case 59:
										if (l_tco) {
											while (l_q_pos < l_q_length) {
												switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
													case 10: case 13: break;
													default:
														l_q_pos++;
														continue;
												}
												break;
											}
											ds_list_add(l_items, [1/* item.comment */, file_ini_std_string_reader_sub(l_q_source, l_till, l_q_pos)]);
										} else {
											l_q_pos++;
											continue;
										}
										break;
									default:
										l_q_pos++;
										continue;
								}
								break;
							}
						} else {
							l_till = l_q_pos;
							while (l_q_pos < l_q_length) {
								switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
									case 10: case 13: break;
									case 35: case 59:
										while (l_q_pos < l_q_length) {
											switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
												case 10: case 13: break;
												default:
													l_q_pos++;
													continue;
											}
											break;
										}
										l_s = file_ini_std_string_reader_sub(l_q_source, l_till + 1, l_q_pos);
										ds_list_add(l_items, [1/* item.comment */, l_s]);
										break;
									case 9: case 32:
										l_q_pos++;
										continue;
									default:
										l_till = l_q_pos;
										l_q_pos++;
										continue;
								}
								break;
							}
							l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_till + 1);
						}
						l_pair[@2/* val */] = l_s;
					} else {
						while (l_q_pos < l_q_length) {
							switch (buffer_peek(l_q_source, l_q_pos, buffer_u8)) {
								case 10: case 13: break;
								default:
									l_q_pos++;
									continue;
							}
							break;
						}
						l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_q_pos);
						ds_list_add(l_items, [1/* item.comment */, l_s]);
					}
			}
			l_start = l_q_pos;
	}
}
if (l_q_pos > l_start) {
	l_s = file_ini_std_string_reader_sub(l_q_source, l_start, l_q_pos);
	l_sep2 = l_sep;
	l_sep = [0/* item.sep */, l_s];
	ds_list_add(l_items, l_sep);
} else l_sep2 = undefined;
l_section[@4/* next_sep */] = l_sep;
l_section[@5/* next_equ */] = l_equ;
l_out[@5/* next_sep */] = l_sep;
l_out[@6/* next_equ */] = l_equ;
buffer_delete(l_q_source);
return l_out;

#define file_ini_open
// file_ini_open(path:string, secure:bool = false)->ini
var l_path1 = argument[0], l_secure;
if (argument_count > 1) l_secure = argument[1]; else l_secure = false;
var l_src;
if (l_secure) {
	var l_tmp = ds_map_secure_load(l_path1);
	if (l_tmp != -1) {
		l_src = l_tmp[?""];
		ds_map_destroy(l_tmp);
	} else l_src = undefined;
} else if (file_exists(l_path1)) {
	var l_loadBuf = buffer_load(l_path1);
	var l_loadStr = (buffer_get_size(l_loadBuf) > 0 ? buffer_read(l_loadBuf, buffer_string) : "");
	buffer_delete(l_loadBuf);
	l_src = l_loadStr;
} else l_src = undefined;
var l_ini = (l_src != undefined ? file_ini_parse(l_src) : file_ini_create());
l_ini[@1/* format */] = (l_secure ? 2 : 1);
l_ini[@2/* path */] = l_path1;
return l_ini;

//}

//{ file.ini.section

#define file_ini_section_create
// file_ini_section_create(name:string)
var this = array_create(6);
var l_name = argument[0];
this[@3/* prefix */] = undefined;
this[@2/* pairs */] = ds_map_create();
this[@1/* items */] = ds_list_create();
this[@0/* name */] = l_name;
return this;

//}

//{ file.ini.pair

#define file_ini_pair_create
// file_ini_pair_create()
var this = array_create(4);
this[@3/* item */] = undefined;
return this;

//}

//{ file_ini_std.mathnf

#define file_ini_std_mathnf_init
// file_ini_std_mathnf_init(a:real, b:real)->real
var l_a = argument[0], l_b = argument[1];
return l_a / l_b;

#define file_ini_std_mathnf_isNaN
// file_ini_std_mathnf_isNaN(v:real)->bool
var l_v = argument[0];
return l_v != l_v;

//}

//{ file_ini_std.Std

#define file_ini_std_Std_stringify
// file_ini_std_Std_stringify(value:dynamic)->string
var l_value = argument[0];
if (l_value == undefined) return "null";
if (is_string(l_value)) return l_value;
var l_n, l_i, l_s;
if (is_struct(l_value)) {
	var l_e = variable_struct_get(l_value, "__enum__");
	if (l_e == undefined) return string(l_value);
	var l_ects = l_e.constructors;
	if (l_ects != undefined) {
		l_i = l_value.__enumIndex__;
		if (l_i >= 0 && l_i < array_length(l_ects)) l_s = l_ects[l_i]; else l_s = "?";
	} else {
		l_s = instanceof(l_value);
		if (string_copy(l_s, 1, 3) == "mc_") l_s = string_delete(l_s, 1, 3);
		l_n = string_length(l_e.name);
		if (string_copy(l_s, 1, l_n) == l_e.name) l_s = string_delete(l_s, 1, l_n + 1);
	}
	l_s += "(";
	var l_fields = l_value.__enumParams__;
	l_n = array_length(l_fields);
	for (l_i = -1; ++l_i < l_n; l_s += file_ini_std_Std_stringify(variable_struct_get(l_value, l_fields[l_i]))) {
		if (l_i > 0) l_s += ", ";
	}
	return l_s + ")";
}
if (is_real(l_value)) {
	l_s = string_format(l_value, 0, 16);
	if (os_browser != browser_not_a_browser) {
		l_n = string_length(l_s);
		l_i = l_n;
		while (l_i > 0) {
			switch (string_ord_at(l_s, l_i)) {
				case 48:
					l_i--;
					continue;
				case 46: l_i--; break;
			}
			break;
		}
	} else {
		l_n = string_byte_length(l_s);
		l_i = l_n;
		while (l_i > 0) {
			switch (string_byte_at(l_s, l_i)) {
				case 48:
					l_i--;
					continue;
				case 46: l_i--; break;
			}
			break;
		}
	}
	return string_copy(l_s, 1, l_i);
}
return string(l_value);

#define file_ini_std_Std_parseFloat
// file_ini_std_Std_parseFloat(s:string)->real
var l_s = argument[0];
var l_l = string_length(l_s);
var l_n = string_length(string_digits(l_s));
var l_p = string_pos(".", l_s);
var l_e = string_pos("e", l_s);
if (l_e == 0) l_e = string_pos("E", l_s);
switch (l_e) {
	case 0: break;
	case 1: return file_ini_std_mathnf_not_a_number;
	case 2: if (l_p > 0) return file_ini_std_mathnf_not_a_number; break;
	default: if (l_p > 0 && l_e < l_p) return file_ini_std_mathnf_not_a_number;
}
if (l_e != 0 && l_e < l_l - 1) switch (string_ord_at(l_s, l_e + 1)) {
	case 43: case 45: l_l--; break;
}
if (l_n && l_n == l_l - (string_ord_at(l_s, 1) == 45) - (l_p != 0) - (l_e != 0)) return real(l_s); else return file_ini_std_mathnf_not_a_number;

//}

//{ file_ini_std.string

#define file_ini_std_string_pos_ext_haxe
// file_ini_std_string_pos_ext_haxe(this:string, sub:string, startPos:int = 0)->int
var this = argument[0], l_sub = argument[1], l_startPos;
if (argument_count > 2) l_startPos = argument[2]; else l_startPos = 0;
var l_out = string_pos(l_sub, (l_startPos > 0 ? string_delete(this, 1, l_startPos) : this));
if (l_out > 0) return l_out + l_startPos - 1; else return -1;

//}

//{ file_ini_std.string_builder

#define file_ini_std_string_builder_print
// file_ini_std_string_builder_print(this:buffer)->string
var l_this1 = argument[0];
var l_p = buffer_tell(l_this1);
buffer_write(l_this1, buffer_u8, 0);
buffer_seek(l_this1, buffer_seek_start, 0);
var l_s = buffer_read(l_this1, buffer_string);
buffer_seek(l_this1, buffer_seek_start, l_p);
return l_s;

//}

//{ file_ini_std.string_reader

#define file_ini_std_string_reader_buf
// file_ini_std_string_reader_buf(s:string)->buffer
var l_s = argument[0];
var l_len = string_byte_length(l_s);
var l_sb = buffer_create(l_len, buffer_fixed, 1);
buffer_write(l_sb, buffer_text, l_s);
var l_fb = buffer_create(l_len, buffer_fast, 1);
buffer_copy(l_sb, 0, l_len, l_fb, 0);
buffer_delete(l_sb);
return l_fb;

#define file_ini_std_string_reader_sub
// file_ini_std_string_reader_sub(b:buffer, start:int, till:int)->string
var l_b = argument[0], l_start = argument[1], l_till = argument[2];
var l_len = l_till - l_start;
if (l_len <= 0) return "";
var l_sb = buffer_create(l_len, buffer_fixed, 1);
buffer_copy(l_b, l_start, l_len, l_sb, 0);
var l_r = buffer_read(l_sb, buffer_string);
buffer_delete(l_sb);
return l_r;

//}
