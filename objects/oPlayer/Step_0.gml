Input(true)

//Walk
var spd, grv
if (oBall.moveState = STATE.connected)
{
	spd = walkSp
	grv = grvHeavy
}
else
{
	spd = runSp
	grv = grvLight
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

Spring()

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
if (point_in_circle(x + sprite_width * 0.5, y + sprite_height * 0.5, oGoal.x, oGoal.y, 25))
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
			tutOpacity = 0;
			tutProgress = 0;
			
			var _saveString = json_string_load(saveFile);
			var _saveStruct = json_parse(_saveString);
			_saveStruct.levelUnlocked = levelUnlocked;
			_saveString = json_stringify(_saveStruct);
			json_string_save(_saveString, saveFile);
		}
	}
}

//particles
var xx = oCamera.x + oCamera.vW + random_range(0,50)
var yy = oCamera.y + random_range(-50,oCamera.vH+50)
var spawn = random(10) < 1
part_particles_create(dustCloseSys,xx,yy,dustClose,spawn)
