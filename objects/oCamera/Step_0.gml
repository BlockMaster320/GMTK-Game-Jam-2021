stay--
if (stay <= 0)
{
	var _direction = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
	var _length = min(point_distance(oPlayer.x, oPlayer.y, mouse_x, mouse_y), 200) * 0.2;
	
	targetX = oPlayer.x - (vW / 2) + lengthdir_x(_length, _direction);
	targetY = oPlayer.y - (vH / 2) + lengthdir_y(_length, _direction);
}

rot += random_range(-global.screenShake*.1,global.screenShake*.1)

global.screenShake = max(global.screenShake-1,0)

x = lerp(x,targetX, max(cameraSpd, clamp(abs(oPlayer.hsp) * 0.02, 0, 1)))
y = lerp(y,targetY, max(cameraSpd, clamp(abs(oPlayer.vsp) * 0.02, 0, 1)))
rot = lerp(rot,0,cameraSpd)

x = clamp(x,0,room_width-vW)
y = clamp(y,0,room_height-vH)
x += global.screenShake * .3
y += global.screenShake * .3

camera_set_view_pos(cam,x,y)
camera_set_view_angle(cam,rot)