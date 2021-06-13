#region id.light surf
surface_set_target(id.light)
draw_circle_color(	x,y,radius,
					lightCol,
					c_black,false)
surface_reset_target()
#endregion

surface_set_target(id.light)
draw_set_alpha(.5)
draw_surface(myShadows.shadow,0,0)
draw_set_alpha(1)
surface_reset_target()

draw_set_alpha(alpha)
gpu_set_blendmode(bm_add)
draw_surface(id.light,0,0)
gpu_set_blendmode(bm_normal)
draw_set_alpha(1)

#region Lighten "darken" surface
surface_set_target(id.darken)
gpu_set_blendmode_ext(bm_dest_color,bm_src_color)
draw_circle_color(	x,y,radius,
					c_black,
					c_gray,false)
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface(id.darken,0,0)
#endregion
