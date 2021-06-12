Input(true)

//Walk
var spd, grv
if (oBall.moveState = STATE.thrown)
{
	spd = runSp
	grv = grvLight
}
else
{
	spd = walkSp
	grv = grvHeavy
}
whsp = (right - left) * spd

//Gravity
wvsp += grv

//Dash
var ballX = oBall.x
var ballY = oBall.y
if (oBall.moveState = STATE.thrown and dashPress)
{
	distToBall = point_distance(x,y,ballX,ballY)
	ballDir = point_direction(x,y,ballX,ballY)
	var dashSpd = baseSpd + (distToBall * spdMult)
	dhsp += lengthdir_x(dashSpd,ballDir) 
	dvsp += lengthdir_y(dashSpd,ballDir)
	if (dvsp < 0) wvsp = 0
	oBall.dashed = true
	global.screenShake += 6
	audio_play_sound(sndDash,0,0)
}

DashFriction()

//Movement cancel
if (sign(whsp) == -sign(dhsp)) dhsp *= movementCancel

//Spd sum
hsp = whsp + dhsp
vsp = wvsp + dvsp

//Collision
Collision()

//Death
if (place_meeting(x,y,oSpike))
{
	dhsp = 0
	dvsp = 0
	wvsp = 0
	oBall.moveState = STATE.connected
	oBall.dashed = false
	x = xstart
	y = ystart
}

//Collision With the Goal
if (point_in_circle(x + sprite_width * 0.5, y + sprite_height * 0.5, oGoal.x, oGoal.y, 50))
{
	with (oMenu)
	{
		if (levelCurrent == levelUnlocked)
			levelUnlocked = min(levelUnlocked + 1, array_length(levelArray) - 1);
		
		if (levelCurrent == levelUnlocked)
		{
			menuState = menu.mainMenu;
			levelCurrent = noone;
			room_goto(rmMenu);
		}
		else
		{
			levelCurrent ++;
			room_goto(levelArray[levelCurrent]);
		}
	}
}
