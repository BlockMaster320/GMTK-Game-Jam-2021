surface_resize(application_surface,window_get_width(),window_get_height())
shader_set(shPostProcess)
draw_surface(application_surface,0,0)
shader_reset()