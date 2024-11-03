///
if (live_call()) return live_result;




if am_dragging >= 1 {
	am_dragging = 0
	
	prev_targ_id = targ_id
	targ_id = instance_nearest(x,y,obj_tile_space)
	tile_id = targ_id.tile_id
	
	obj_ctrl.dragging = 0
	
	if point_distance(x,y,targ_id.x,targ_id.y) <= 40 {
	
		
		
		var _conflicting_tile = collision_point(targ_id.x,targ_id.y,obj_tile_letter,true,true)
		
		if _conflicting_tile != noone {
			with (_conflicting_tile) {
				if other.am_set = 1 { //swap with other tile's target
					
					am_set = 1
					targ_id = other.prev_targ_id
					prev_targ_id = targ_id
					x_targ = targ_id.x
					y_targ = targ_id.y
					
					tile_id = targ_id.tile_id
					
					
				} else { //conflict with a tile that hasn't been set yet, so just reset
				
					//reset
					am_set = 0 
					targ_id = self
					prev_targ_id = self
					x_targ = xstart
					y_targ = ystart
					

				}
			}
		}
		
		
		
		x_targ = targ_id.x
		y_targ = targ_id.y
		am_set = 1
		prev_targ_id = targ_id
		am_set_flash = 1
		
	
	} else {
		
		if point_distance(x,y,xstart,ystart) <= 40 {
			x_targ = xstart
			y_targ = ystart
		}
		
		targ_id = self
		prev_targ_id = targ_id
		am_set = 0
	}
	
}





