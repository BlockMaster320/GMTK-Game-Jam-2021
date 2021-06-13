if (!surface_exists(id.shadow))
    id.shadow = surface_create(room_width,room_height)

draw_set_color(c_black)
surface_set_target(id.shadow)
draw_clear_alpha(c_black,0)
with(oBlock)
{
    if ((point_distance(other.x,other.y,x,y) < oLight.radius * 1.5 /*and 
        point_distance(other.x,other.y,x,y) >= 16/2*/))
    {
	var bb1 = bbox_left-1
	var bb2 = bbox_top-1
	var bb3 = bbox_right+1
	var bb4 = bbox_bottom+1
	var bb5 = bbox_left-1
		
    #region Shadow
    draw_triangle(    bb1,bb2,
                    bb3,bb4,
                    ShadowLine(bb1,bb2,1),ShadowLine(bb1,bb2,0),
                    0)
                    
    draw_triangle(    ShadowLine(bb1,bb2,1),ShadowLine(bb1,bb2,0),
                    bb3,bb4,
                    ShadowLine(bb3,bb4,1),ShadowLine(bb3,bb4,0),
                    0)
    draw_triangle(    bb3,bb2,
                    bb5,bb4,
                    ShadowLine(bb3,bb2,1),ShadowLine(bb3,bb2,0),
                    0)
                    
    draw_triangle(    ShadowLine(bb3,bb2,1),ShadowLine(bb3,bb2,0),
                    bb5,bb4,
                    ShadowLine(bb5,bb4,1),ShadowLine(bb5,bb4,0),
                    0)
    #endregion
    }
}

surface_reset_target()