//TUTORIAL
if (menuState == menu.game || menuState == menu.pause)
{
	Input(true);
	switch (room)
	{
		case rmLevel0:
		{
			if (tutProgress < 2)
			{
				draw_sprite_ext(sTutorial, 0, 90, 70, 0.8, 0.8, 0, c_white, tutOpacity);
				if (tutProgress == 0 && (left || right)) tutProgress ++;
			
				var _animChannel = animcurve_get_channel(acSmoothTransition, 0);
				var _animValue = animcurve_channel_evaluate(_animChannel, tutAnimation);
				if (tutProgress == 1)
				{
					draw_sprite_ext(sTutorial, 1, 290, 140 + _animValue * 5, 1, 1, 0, c_white, tutOpacity);
					if (oPlayer.x > 290)
					{
						tutProgress ++;
						tutOpacity = 0;
					}
				}
			}
			
			if (tutProgress >= 2)
			{
				draw_sprite_ext(sTutorial, 1, 305, 110, 1, 1, 155, c_white, tutOpacity);
				
				if (tutProgress == 2)
					draw_sprite_ext(sTutorial, 2, 305, 40, 0.8, 0.8, 0, c_white, tutOpacity);
				
				if (tutProgress == 3)
					draw_sprite_ext(sTutorial, 3, 305, 40, 0.8, 0.8, 0, c_white, tutOpacity);
				
				if (tutProgress == 4)
					draw_sprite_ext(sTutorial, 4, 305, 40, 0.8, 0.8, 0, c_white, tutOpacity);
				
				if (dashRelease)
				{
					tutProgress ++;
					if (tutProgress == 5)
						tutProgress = 2;
				}
			}
		}
		break;
	}
	
	tutOpacity = min(tutOpacity + 0.02, 1);
	tutAnimation += (tutAnimationSign * 2 - 1) * 0.03;
	if (tutAnimation <= 0 || tutAnimation >= 1)
		tutAnimationSign = !tutAnimationSign;
	
	show_debug_message(tutAnimation);
}
