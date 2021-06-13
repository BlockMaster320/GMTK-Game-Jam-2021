if (keyboard_check_pressed(ord("R"))) room_restart()
Input(!cutscene)

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
if (whsp != 0 and place_meeting(x,y+1,oBlock))
{
	var spawn = random(30) < 1
	part_particles_create(dustPufSys,x,y+15,dustPuf,spawn)
	FootStep(spd)
}

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
if (oCamera.stay > 0)
{
	x = xstart
	y = ystart
	wvsp = 0
	image_alpha = 0
	oBall.moveState = STATE.connected
}
else if (!oCamera.stay and !cutscene) image_alpha = 1

if (place_meeting(x,y,oSpike))
{
	dhsp = 0
	dvsp = 0
	wvsp = 0
	oBall.moveState = STATE.connected
	oBall.dashed = false
	var spd = hsp > vsp ? hsp : vsp
	part_type_speed(blood,spd-5,spd+5,0,0)
	var dir = point_direction(0,0,lengthdir_x(spd,sign(hsp)),lengthdir_y(spd,sign(vsp)))
	part_type_direction(blood,dir-20,dir+20,0,0)
	part_particles_create(bloodSys,x,y,blood,30)
	audio_play_sound(sndDeath,0,0)
	oCamera.stay = 50
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
			
			audio_play_sound(sndGoal,0,0)
			
			var _saveString = json_string_load(saveFile);
			var _saveStruct = json_parse(_saveString);
			_saveStruct.levelUnlocked = levelUnlocked;
			_saveString = json_stringify(_saveStruct);
			json_string_save(_saveString, saveFile);
		}
	}
}

//particles
var xx = oCamera.x + oCamera.vW + random_range(0,200)
var yy = oCamera.y + random_range(-200,oCamera.vH+200)
var spawn = random(4) < 1
part_particles_create(dustCloseSys,xx,yy,dustClose,spawn)

xx = oCamera.x + oCamera.vW + random_range(0,200)
yy = oCamera.y + random_range(-200,oCamera.vH+200)
spawn = random(2) < 1
part_particles_create(dustFarSys,xx,yy,dustFar,spawn)
