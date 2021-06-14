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
				if (tutProgress == 0 && (left || right)) tutProgress = 1;
			
				var _animChannel = animcurve_get_channel(acSmoothTransition, 0);
				var _animValue = animcurve_channel_evaluate(_animChannel, tutAnimation);
				if (tutProgress == 1)
				{
					draw_sprite_ext(sTutorial, 1, 215, 140 + _animValue * 5, 1, 1, 0, c_white, tutOpacity);
					if (oPlayer.x > 210)
					{
						tutProgress = 2;
						tutOpacity = 0;
					}
				}
			}
			
			if (tutProgress >= 2)
			{
				draw_sprite_ext(sTutorial, 1, 225, 110, 1, 1, 155, c_white, tutOpacity);
				
				if (tutProgress == 2)
					draw_sprite_ext(sTutorial, 2, 365, 180, 0.8, 0.8, 0, c_white, tutOpacity);
				
				if (tutProgress == 3)
					draw_sprite_ext(sTutorial, 3, 365, 180, 0.8, 0.8, 0, c_white, tutOpacity);
				
				if (tutProgress == 4)
					draw_sprite_ext(sTutorial, 4, 365, 180, 0.8, 0.8, 0, c_white, tutOpacity);
				
				if (dashRelease)
				{
					tutProgress ++;
					if (tutProgress == 5)
						tutProgress = 2;
				}
			}
		}
		break;
		
		case rmLevel1:
		{
			draw_sprite_ext(sTutorial, 5, 230, 230, 0.8, 0.8, 0, c_white, tutOpacity);
			draw_sprite_ext(sTutorial, 6, 230, 70, 0.8, 0.8, 0, c_white, tutOpacity);
			
		}
		break;
		
		case rmLevel3:
		{
			if (tutProgress == 0)
			{
				draw_sprite_ext(sTutorial, 7, 100, 360, 0.8, 0.8, 0, c_white, tutOpacity);
				if (oPlayer.x > 170) tutProgress = 1;
			}
			
			if (tutProgress == 1 && oPlayer.x > 350)
			{
				tutProgress = 2;
				tutOpacity = 0;
			}
			
			if (tutProgress == 2)
			{
				draw_sprite_ext(sTutorial, 8, 560, 330, 0.8, 0.8, 0, c_white, tutOpacity);
				draw_sprite_ext(sTutorial, 9, 560, 400, 0.8, 0.8, 0, c_white, tutOpacity);
			}
		}
		break;
	}
	
	tutOpacity = min(tutOpacity + (0.02 * !oPlayer.cutscene), 1);
	tutAnimation += (tutAnimationSign * 2 - 1) * 0.03;
	if (tutAnimation <= 0 || tutAnimation >= 1)
		tutAnimationSign = !tutAnimationSign;
}
