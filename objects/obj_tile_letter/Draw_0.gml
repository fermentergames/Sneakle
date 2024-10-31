if (live_call()) return live_result;

if 1=1 {
	
	var _letter_hue = obj_ctrl.timey*0.2 mod 255
	var _letter_hue = 150//obj_ctrl.timey*0.2 mod 255


	//if tile_id = 0 {
	//	scl *= 4
	//	image_xscale = scl
	//	image_yscale = image_xscale	
	//}
	
	if tile_id > 9 {
	//am_selected_fd = 1
	}


	image_alpha = 1
	image_blend = make_color_hsv(lerp(_letter_hue,145,am_selected_fd),lerp(60,180,am_selected_fd),clamp(80+(80*am_set_flash2)+(180*am_selected_flash2)+(40*am_selected_fd),0,255))
	image_blend_base = image_blend
	border_col = merge_color(image_blend,c_white,0.3)
	letter_col = c_white//merge_color(image_blend,c_white,0.7)
	//letter_col = merge_color(letter_col,c_white,am_selected_fd)

	var _exed_col = make_color_hsv(245,220,20)
	//if am_samelettered = 1 {
	//	_exed_col = make_color_hsv(40,120,80)
	//}

	if am_selected <= 0 && am_exed >= 1 {
		image_blend = merge_color(image_blend,_exed_col,am_exed_fd*1)
		border_col = merge_color(image_blend,make_color_hsv(250,255,205),am_exed_fd*0.2)
		letter_col = merge_color(letter_col,border_col,am_exed_fd*1)
		
		image_alpha = 1-(am_exed_fd*0.0)
	}
	
	image_blend = merge_color(image_blend,make_color_hsv(100,255,210),am_clued_fd*0.7)//*(1-am_selected_fd))
	letter_col = merge_color(letter_col,make_color_hsv(70,0,255),am_clued_fd*0.9*(1-am_selected_fd))
	//letter_col = merge_color(letter_col,c_black,am_selected_fd*1)
	
	border_col = merge_color(border_col,make_color_hsv(140,255,255),am_selected_fd*0.7)
	border_col = merge_color(border_col,make_color_hsv(65,255*(0.5+(0.5*(1-am_selected_fd))),255),am_clued_fd*0.7*(1))

	
	
	


	//draw_self()

	depth = -y-1000

	if am_dragging >= 1 {
		depth = -y-3000
	}




	var shad_fd = clamp(am_dragging_fd+(1-born_fd),0,1)

	var _spawn_slam = sqr(spawn_slam)*-1000
	
	var _shad_ht = 0
	var _tile_ht = 0*sqr(1-am_selected_flash2)


	var _tile_shape = 0
	
	if shad_fd > 0 {
	//shadow
	draw_sprite_ext(spr_sqr512,_tile_shape,x+lengthdir_x(_shad_ht*shad_fd,image_angle-90),y+lengthdir_y(_shad_ht*shad_fd,image_angle-90),image_xscale*(1+(0.2*shad_fd)),image_yscale*(1+(0.2*shad_fd)),image_angle,c_black,0.3*shad_fd)
	}

	//bottom edge
	//draw_sprite_ext(spr_sqr512,_tile_shape,x,y+_spawn_slam,image_xscale,image_yscale,image_angle,border_col,image_alpha)

	//if am_set_flash > 0 {
	////flash on set
	//draw_sprite_ext(spr_sqr512,1,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*2*sqr(1-am_set_flash),image_yscale*2*sqr(1-am_set_flash),image_angle,make_color_hsv(38,0,255),image_alpha*2*am_set_flash)
	//}
	
	//main tile
	draw_sprite_ext(spr_sqr512,_tile_shape,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*1.00,image_yscale*1.00,image_angle,image_blend,image_alpha)

	if am_selected_flash2 > 0 {
	gpu_set_blendmode(bm_add)
	//selected glow
	draw_sprite_ext(spr_sqr512,0,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*(1+(0.0*am_selected_fd)),image_yscale*(1+(0.0*am_selected_fd)),image_angle,image_blend,image_alpha*(am_selected_flash2))
	//draw_sprite_ext(spr_sqr512_glow,0,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*(0.7+(0.3*am_selected_fd)),image_yscale*(0.7+(0.3*am_selected_fd)),image_angle,image_blend,image_alpha*(am_selected_fd+am_selected_flash2))
	
	}
	
	//clued glow
	//draw_sprite_ext(spr_sqr512_glow,1,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale,image_yscale,image_angle,image_blend,image_alpha*am_clued_fd*0.5)


	if am_part_of_secret_word_fd > 0 && global.game_phase = 2 {

		gpu_set_blendmode(bm_add)
		//secret glow
		draw_sprite_ext(spr_sqr512,0,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*(1+(0.0*am_selected_fd)),image_yscale*(1+(0.0*am_selected_fd)),image_angle,c_white,image_alpha*(am_part_of_secret_word_fd*(0.12+(0.03*(sin(obj_ctrl.timey*0.1))))))
	
	}
	
	if am_clued_flash2 > 0 {

		gpu_set_blendmode(bm_add)
		//am_clued_won_fd glow
		draw_sprite_ext(spr_sqr512,0,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*(1+(0.0*(am_clued_fd))),image_yscale*(1+(0.0*(am_clued_fd))),image_angle,image_blend,image_alpha*(am_clued_flash2*3))
	
	}
	
	if am_clued_won_fd > 0 {

		gpu_set_blendmode(bm_add)
		//am_clued_won_fd glow
		draw_sprite_ext(spr_sqr512,0,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*(1+(0.0*am_selected_fd)),image_yscale*(1+(0.0*am_selected_fd)),image_angle,image_blend,image_alpha*(am_clued_won_fd*(0.15+(0.15*(sin(obj_ctrl.timey*0.07))))))
	
	}

	gpu_set_blendmode(bm_normal)
	

	if am_exed = 1 && am_selected <= 0 {
		//exed
		draw_sprite_ext(spr_sqr512,4,x+lengthdir_x(-_tile_ht,image_angle-90),y+lengthdir_y(-_tile_ht,image_angle-90)+_spawn_slam,image_xscale*0.7*sqr(am_exed_fd),image_yscale*0.7*sqr(am_exed_fd),image_angle+45,c_black,image_alpha*0.6)

	}
	

	//scribble(my_letter_str)
	////.scale_to_box(-1, 650*_scl, -1)
	//.line_spacing("55%")
	//.starting_format(font_get_name(draw_get_font()), letter_col)
	//.blend(c_white, draw_get_alpha())
	//.align(fa_center, fa_middle)
	//.transform(2.5*scl,2.5*scl,image_angle)
	//.draw(x+lengthdir_x(-4+(50*scl),image_angle-90),y+lengthdir_y(-4+(50*scl),image_angle-90)+_spawn_slam)

	if global.game_phase < 2 {

	draw_set_alpha(lerp(0.6,1,clamp(am_selected_fd+am_clued_fd+am_part_of_secret_word_fd+(1*am_exed_fd),0,1)))
	draw_set_color(letter_col)//merge_color(letter_col,c_white,am_selected_fd))
	draw_set_color(merge_color(letter_col,c_white,am_selected_fd))

	var _text_offset_y = -0//20
	var _text_scl = 2.2*scl //20

	draw_text_transformed(x+lengthdir_x(-_tile_ht+(_text_offset_y*scl),image_angle-90),y+lengthdir_y(-_tile_ht+(_text_offset_y*scl),image_angle-90)+_spawn_slam,string_upper(my_letter_str),_text_scl,_text_scl,image_angle)

	//draw_text_transformed(x+lengthdir_x(-_tile_ht+(_text_offset_y*scl),image_angle-90),y+lengthdir_y(-_tile_ht+(_text_offset_y*scl),image_angle-90)+_spawn_slam+24,tile_id,_text_scl*0.2,_text_scl*0.2,image_angle)

	}

	draw_set_color(c_white)

	//if global.game_phase = 3 && 1=0 {
	
	//	scribble(am_exed)
	//	//.scale_to_box(-1, 650*_scl, -1)
	//	.line_spacing("55%")
	//	.starting_format(font_get_name(draw_get_font()), letter_col)
	//	.blend(c_white, draw_get_alpha()*0.7)
	//	.align(fa_center, fa_middle)
	//	.transform(1*scl,1*scl,image_angle)
	//	.draw(x+22+lengthdir_x(-4+(50*scl),image_angle-90),y+15+lengthdir_y(-4+(50*scl),image_angle-90)+_spawn_slam)


	//	scribble(am_clued)
	//	//.scale_to_box(-1, 650*_scl, -1)
	//	.line_spacing("55%")
	//	.starting_format(font_get_name(draw_get_font()), letter_col)
	//	.blend(c_white, draw_get_alpha()*0.7)
	//	.align(fa_center, fa_middle)
	//	.transform(1*scl,1*scl,image_angle)
	//	.draw(x-22+lengthdir_x(-4+(50*scl),image_angle-90),y+15+lengthdir_y(-4+(50*scl),image_angle-90)+_spawn_slam)

	//}
	
	

	
	
}