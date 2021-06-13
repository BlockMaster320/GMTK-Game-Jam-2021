//Fullscreen
if (keyboard_check(ord("F")))
{
	window_set_fullscreen(!window_get_fullscreen());
	alarm[0] = 10;
}
