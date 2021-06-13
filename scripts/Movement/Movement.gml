function Collision()
{
	//horizontal
	if (place_meeting(x + hsp,y,oBlock))
	{
		while (!place_meeting(x + sign(hsp),y,oBlock)) x = x + sign(hsp);
		if (abs(hsp) > 5)
		{
			ImpactSound()
			var dir = sign(hsp) == 1 ? 180 : 0
			var off = 60
			part_type_direction(dustBurst,dir-off,dir+off,0,0)
			part_particles_create(dustBurstSys,x+(sprite_width/2*sign(hsp)),y,dustBurst,30)
		}
		hsp = 0;
		dhsp *= collisionSpdDecrease
	}
	x += hsp

	//vertical
	if (place_meeting(x,y + vsp,oBlock))
	{
		while (!place_meeting(x,y + sign(vsp),oBlock)) y = y + sign(vsp);
		if (abs(vsp) > 5)
		{
			ImpactSound()
			var dir = sign(vsp) == 1 ? 90 : 270
			var off = 60
			part_type_direction(dustBurst,dir-off,dir+off,0,0)
			part_particles_create(dustBurstSys,x,y+(sprite_height/2*sign(vsp)),dustBurst,30)
		}
		if (sign(vsp) == 1) dvsp = 0
		vsp = 0
		wvsp = 0
		dvsp *= collisionSpdDecrease
	}
	y += vsp
}

function Input(active)
{
	/*if (keyboard_check_pressed(vk_escape)) game_end()*/
	if (active)
	{
		//Walk
		left = keyboard_check(ord("A")) or keyboard_check(vk_left)
		right = keyboard_check(ord("D")) or keyboard_check(vk_right)
		down = keyboard_check(ord("S")) or keyboard_check(vk_down)
		up = keyboard_check(ord("W")) or keyboard_check(vk_up)
		
		//Dash
		if (!place_meeting(oPlayer.x,oPlayer.y,oZone))
		{
			mDir = point_direction(x,y,mouse_x,mouse_y)
			
			var _turnOffDash = !(room == rmLevel0 && oMenu.tutProgress < 2)
			dashHold = mouse_check_button(mb_left) * _turnOffDash;
			dashPress = mouse_check_button_pressed(mb_left) * _turnOffDash;
			dashRelease = mouse_check_button_released(mb_left) * _turnOffDash;
		}
		else
		{
			mDir = 0
			dashHold = 0
			dashPress = 0
			dashRelease = 0
		}
	}
	else
	{
		left = 0
		right = 0
		up = 0
		down = 0
		mDir = 0
		dashHold = 0
		dashPress = 0
		dashRelease = 0
	}
}

function DashFriction()
{
	finalFrict = place_meeting(x,y+1,oBlock) ? grndFrc : frc
	dhsp -= min(finalFrict,abs(dhsp)) * sign(dhsp)
	dvsp -= min(finalFrict,abs(dvsp)) * sign(dvsp)
}

function Spring()
{
	var spring = instance_place(x,y,oSpring)
	if (place_meeting(x,y,oSpring))
	{
		var velocity = abs(dhsp) + abs(dvsp)
		var mult = .2
		var boost = 10 + (velocity * mult) 
		switch (spring.image_angle)
		{
			case 0:
				dvsp = -boost
				wvsp = 0
				break
				
			case 90:
				dhsp = -boost
				break
				
			case 180:
				dvsp = boost
				break
				
			case 270:
				dhsp = boost
				break
		}
	}
}