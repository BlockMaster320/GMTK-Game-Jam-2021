function Collision()
{
	//horizontal
	if (place_meeting(x + hsp,y,oBlock))
	{
		while (!place_meeting(x + sign(hsp),y,oBlock)) x = x + sign(hsp);
		hsp = 0;
		dhsp *= collisionSpdDecrease
	}
	x += hsp

	//vertical
	if (place_meeting(x,y + vsp,oBlock))
	{
		while (!place_meeting(x,y + sign(vsp),oBlock)) y = y + sign(vsp);
		if (sign(vsp) == 1) dvsp = 0
		vsp = 0
		wvsp = 0
		dvsp *= collisionSpdDecrease
	}
	y += vsp
}

function Input(active)
{
	if (keyboard_check_pressed(ord("R"))) game_restart()
	/*if (keyboard_check_pressed(vk_escape)) game_end()*/
	if (active)
	{
		//Walk
		left = keyboard_check(ord("A")) or keyboard_check(vk_left)
		right = keyboard_check(ord("D")) or keyboard_check(vk_right)
		down = keyboard_check(ord("S")) or keyboard_check(vk_down)
		up = keyboard_check(ord("W")) or keyboard_check(vk_up)

		//Dash
		mDir = point_direction(x,y,mouse_x,mouse_y)
	
		dashHold = mouse_check_button(mb_left)
		dashPress = mouse_check_button_pressed(mb_left)
		dashRelease = mouse_check_button_released(mb_left)
	}
}

function DashFriction()
{
	finalFrict = place_meeting(x,y+1,oBlock) ? grndFrc : frc
	dhsp -= min(finalFrict,abs(dhsp)) * sign(dhsp)
	dvsp -= min(finalFrict,abs(dvsp)) * sign(dvsp)
	show_debug_message(dhsp - finalFrict * sign(dhsp))
}