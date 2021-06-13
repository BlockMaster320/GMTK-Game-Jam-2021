Input(!oPlayer.cutscene)

var pX = oPlayer.x
var pY = oPlayer.y

//Movement state
switch (moveState)
{
	case STATE.connected:
		collide = false
		image_alpha = 0
		x = pX
		y = pY
		
		if (dashPress)
		{
			charging = true
			audio_play_sound(sndWindup,0,0)
		}
		
		if (charging)
		{
			throwTime = clamp(throwTime+1,0,throwMaxTime)
			throwStrength = throwStrengthBase + (throwMult * throwTime)
			if (!audio_is_playing(sndWindup) and !audio_is_playing(sndWindupMiddle))
				audio_play_sound(sndWindupMiddle,0,1)
		}
		else throwTime = 0
		if (dashRelease and charging)
		{
			dhsp = lengthdir_x(throwStrength,mDir)
			dvsp = lengthdir_y(throwStrength,mDir)
			moveState = STATE.thrown
			
			global.screenShake += 6
			audio_stop_sound(sndWindup)
			audio_stop_sound(sndWindupMiddle)
			audio_play_sound(sndThrow,0,0)
			
			oPlayer.sprite_index = sPlayerKick;
		}
		
		if (dashRelease and charging) charging = false
		
		break
	
	case STATE.thrown:
		collide = true
		if (dashPress and dashed)
		{
			audio_play_sound(sndReturning,0,0)
			moveState = STATE.comingBack
			dashed = false
		}
		image_alpha = 1
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
			
			global.screenShake += 6
			audio_stop_sound(sndReturning)
			audio_play_sound(sndReturn,0,0)
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

	Spring()

	DashFriction()

	//Spd sum
	hsp = whsp + dhsp
	vsp = wvsp + dvsp

	Collision()
}