Input(true)

//Walk
whsp = (right - left) * walkSp

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
}

DashFriction()

//Spd sum
hsp = whsp + dhsp
vsp = wvsp + dvsp

//Collision
Collision()