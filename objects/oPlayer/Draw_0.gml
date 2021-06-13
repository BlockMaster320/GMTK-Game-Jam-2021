//Draw a Chain to Ball
if (instance_exists(oBall))
{
	draw_line_width_colour(x, y + 6, oBall.x, oBall.y, 1, $191919, $191919);
}

//Draw Self
draw_self();

//PLAYER ANIMATION
//Set Animation Variables
var _previousSprite = sprite_index;
var _animArray = animArrayIdle;
var _animSpeed = 15;

//Change the Animation Stage
if (hsp != 0)
{
	if (oBall.moveState == STATE.connected)	//walk
	{
		sprite_index = sPlayerWalk;
		_animArray = animArrayWalk;
		_animSpeed = 5;
	}
	else	//run
	{
		sprite_index = sPlayerRun;
		_animArray = animArrayRun;
		_animSpeed = 5;
	}
	animDirection = sign(hsp);
	image_xscale = animDirection;
}
else	//idle
{
	if (sprite_index != sPlayerKick)
	{
		sprite_index = sPlayerIdle;
		animSpeed = 15;
		
		if (oBall.moveState == STATE.connected)
			draw_sprite_ext(sPlayerBall, 0, x, y, animDirection, 1, 0, c_white, image_alpha);
	}
}

//Reset the Animation Values When Changing Between Sprites
image_index = _animArray[animFrame % array_length(_animArray)];
if (sprite_index != _previousSprite)
{
	animTimer = 0;
	animFrame = 0;
}

animFrame += (animTimer % _animSpeed == 0);
animTimer ++;

