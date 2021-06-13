if (!surface_exists(id.light))
    id.light = surface_create(room_width,room_height)
if (!surface_exists(id.darken))
    id.darken = surface_create(room_width,room_height)

surface_set_target(id.light)
draw_clear_alpha(c_black,0)
surface_reset_target()

surface_set_target(id.darken)
draw_clear_alpha(c_black,0)
surface_reset_target()