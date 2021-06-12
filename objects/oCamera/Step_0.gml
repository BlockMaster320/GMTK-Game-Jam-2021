targetX = oPlayer.x - (vW / 2)
targetY = oPlayer.y - (vH / 2)

rot += random_range(-global.screenShake*.1,global.screenShake*.1)

global.screenShake = max(global.screenShake-1,0)

x = lerp(x,targetX,cameraSpd)
y = lerp(y,targetY,cameraSpd)
rot = lerp(rot,0,cameraSpd)

x = clamp(x,0,room_width-vW)
y = clamp(y,0,room_height-vH)
x += global.screenShake * .3
y += global.screenShake * .3

camera_set_view_pos(cam,x,y)
camera_set_view_angle(cam,rot)