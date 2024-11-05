///
function scr_mouse_over_button(_btn_x,_btn_y,_btn_w,_btn_h) {
	
if (live_call(argument0,argument1,argument2,argument3)) return live_result;

//var _pos_scl = global.pr
//var _scl = (global.sw/450)
//if global.is_landscape = 1 {
//	_scl = (global.sh/800)
//}
//var _tscl = clamp(_scl*1,0.5*global.pr,2*global.pr)


if point_in_rectangle(device_mouse_x_to_gui(0)*global.pr,device_mouse_y_to_gui(0)*global.pr,(_btn_x)-(256*_btn_w),(_btn_y)-(256*_btn_h),(_btn_x)+(256*_btn_w),(_btn_y)+(256*_btn_h)) {
	return true;	
} else {
	return false;	
}


}