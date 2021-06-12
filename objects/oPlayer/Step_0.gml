Input(true)

//Walk
var spd
if (oBall.moveState = STATE.thrown) spd = runSp
else spd = walkSp
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
	oBall.dashed = true
}

DashFriction()

//Spd sum
hsp = whsp + dhsp
vsp = wvsp + dvsp

//Collision
Collision()

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
