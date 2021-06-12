Input(true)

var pX = oPlayer.x
var pY = oPlayer.y

//Movement state
switch (moveState)
{
	case STATE.connected:
		collide = false
		x = pX
		y = pY
		
		if (dashHold)
		{
			throwTime = clamp(throwTime+1,0,throwMaxTime)
			throwStrength = throwStrengthBase + (throwTime * .3)
		}
		else throwTime = 0
		if (dashRelease)
		{
			dhsp = lengthdir_x(throwStrength,mDir)
			dvsp = lengthdir_y(throwStrength,mDir)
			moveState = STATE.thrown
		}
		
		break
	
	case STATE.thrown:
		collide = true
		if (returnPress) moveState = STATE.comingBack
		break
	
	case STATE.comingBack:
		collide = false
		if (point_distance(x,y,pX,pY) < returnSpeed)
		{
			moveState = STATE.connected
			
			dhsp = 0
			dvsp = 0
			whsp = 0
			wvsp = 0
		}
		else
		{
			var pDir = point_direction(x,y,pX,pY)
			x += lengthdir_x(returnSpeed,pDir)
			y += lengthdir_y(returnSpeed,pDir)
		}
		break
}

if (collide)
{
	//Gravity
	wvsp += grv

	DashFriction()

	//Spd sum
	hsp = whsp + dhsp
	vsp = wvsp + dvsp

	Collision()
}