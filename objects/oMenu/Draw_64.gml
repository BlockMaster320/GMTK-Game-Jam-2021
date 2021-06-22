//MAIN MENU
//Set Draw Values
var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();
var _drawY = _guiH * 0.5;
var _drawX = _guiW * 0.5;

var _buttonW = 200;
var _buttonWLong = 300;
var _buttonH = 70;
var _buttonSpacing = 30;

buttonHoverControl = false;

draw_set_font(fntMenu);
window_set_cursor(cr_default);

var _falseTimerTrigger = false;

switch (menuState)
{
	case menu.mainMenu:
	{
		draw_sprite_ext(sLogo, 0, _drawX + 20, _guiH * 0.3, 1, 1, 0, c_white, 1);
		
		if (button(_drawX, _drawY, _buttonW, _buttonH, "Play", true))
			menuState = menu.levelSelect;
		
		_drawY += _buttonH + _buttonSpacing;
		if (button(_drawX, _drawY, _buttonW, _buttonH, "Settings", true))
			menuState = menu.settings;
		
		_drawY += _buttonH + _buttonSpacing;
		if (button(_drawX, _drawY, _buttonW, _buttonH, "Quit", true))
			game_end();
		
		//Draw Game Info
		draw_set_font(fntMenuCredits);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text_transformed_colour(_guiW - 20, _guiH - 20, "A GAME BY:\n\n\n\nTheGreatMurloc (coding, sfxs)\n\nBlockMaster (coding, graphics)\n\nMopFlop (graphics)\n\nDemoPanCZE (music)", 1, 1, 0, c_white, c_white, c_white, c_white, 1);
				draw_set_halign(fa_right);
		
		draw_set_halign(fa_left);
		draw_text_transformed_colour(20, _guiH - 20, "Created as a submission\n\nfor the GMTK Game Jam 2021", 1, 1, 0, c_white, c_white, c_white, c_white, 1);
		draw_set_halign(fa_top);
		draw_set_valign(fa_left);
		draw_set_font(fntMenu);
		
		tutProgress = 0;
		tutOpacity = 0;
	}
	break;
	
	case menu.levelSelect:
	{
		var _levelSelectionY = _guiH * 0.35;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text_transformed_colour(_guiW * 0.5, _levelSelectionY - 130, "LEVEL SELECTION", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		if (button(50 + _buttonWLong * 0.5, _guiH - 50 - _buttonH, _buttonWLong, _buttonH, "Back to Menu", true))
			menuState = menu.mainMenu;
		
		if (button(_guiW - 50 - (_buttonWLong + 30) * 0.5, _guiH - 50 - _buttonH, _buttonWLong + 30, _buttonH, "Reset Progress", true))
		{
			levelUnlocked = 0;
			
			var _saveString = json_string_load(saveFile);
			var _saveStruct = json_parse(_saveString);
			_saveStruct.levelUnlocked = 0;
			_saveString = json_stringify(_saveStruct);
			json_string_save(_saveString, saveFile);
		}
		
		var _rows = 4;
		var _columns = 4;
		var _levelW = 100;
		var _levelH = 100;
		var _levelSpacing = 25;
		
		var _levelX = _guiW * 0.5 - floor(_columns * 0.5) * (_levelW + _levelSpacing) + (_levelW + _levelSpacing) * 0.5 * (_columns % 2 == 0);
		var _levelY = (_levelSelectionY + _levelH) - floor(_rows * 0.5) * (_levelH + _levelSpacing) + (_levelH + _levelSpacing) * 0.5 * (_rows % 2 == 0);
		for (var _r = 0; _r < _rows; _r ++)
		{
			for (var _c = 0; _c < _columns; _c ++)
			{
				var _level = _r * _columns + _c;
				var _drawX = _levelX + (_levelW + _levelSpacing) * _c;
				var _drawY = _levelY + (_levelH + _levelSpacing) * _r;
				if (_level > array_length(levelArray) - 1)
					break;
				if button(_drawX, _drawY, _levelW, _levelH, _level, (levelUnlocked >= _level))
				{
					if (_level < array_length(levelArray))
					{
						menuState = menu.game;
						levelCurrent = _level;
						room_goto(levelArray[_level]);
						
						_falseTimerTrigger = true;
					}
				}
				
				if (button_hover(_drawX, _drawY, _levelW, _levelH, (levelUnlocked >= _level)))
				{
					var _timeBest = bestTimes[_level];
					var _seconds = _timeBest div 1000;
					var _minutes = _seconds div 60;
					var _milliseconds = floor((_timeBest % 1000) / 10);
					var _timeString = (_timeBest == 0) ? "none" : string(_minutes) + ":" + string(_seconds) + "." + string(_milliseconds);
					
					var _timeY = _guiH * 0.35;
					draw_set_halign(fa_center);
					draw_text_transformed_colour(_guiW * 0.83, _timeY, "BEST TIME", 1, 1, 0, c_white, c_white, c_white, c_white, 1);
					draw_text_transformed_colour(_guiW * 0.83, _timeY + 50, _timeString, 2, 2, 0, c_white, c_white, c_white, c_white, 1);
					draw_set_halign(fa_left);
				}
			}
		}
		
		/*draw_line_colour(_guiW * 0.5, 0, _guiW * 0.5, _guiH, c_green, c_green);*/
	}
	break;
	
	case menu.settings:
	{
		var _showTimerString = (showTimer) ? "ON" : "OFF";
		if (button(_drawX, _drawY, _buttonW * 1.2, _buttonH, "Timer: " + _showTimerString, true))
		{
			showTimer = !showTimer;
			
			var _saveStruct = json_parse(json_string_load(saveFile));
			_saveStruct.settings[0] = showTimer;
			var _saveString = json_stringify(_saveStruct);
			json_string_save(_saveString, saveFile);
		}
		
		if (button(50 + _buttonWLong * 0.5, _guiH - 50 - _buttonH, _buttonWLong, _buttonH, "Back to Menu", true))
			menuState = menu.mainMenu;
	}
	break;
	
	case menu.game:
	{
		/*draw_text_transformed_colour(30, 30, "press ESC to pause", 0.5, 0.5, 0,
									 c_white, c_white, c_black, c_black, 1)*/
		if (keyboard_check_pressed(vk_escape))
			menuState = menu.pause;
	}
	break;
	
	case menu.pause:
	{
		_drawY = _guiH * 0.4;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text_transformed_colour(_guiW * 0.5, _drawY - _buttonH - 50, "GAME PAUSED", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		if (button(_drawX, _drawY, _buttonWLong, _buttonH, "Continue", true))
			menuState = menu.game;
		
		_drawY += _buttonH + _buttonSpacing;
		if (button(_drawX, _drawY, _buttonWLong, _buttonH, "Main Menu", true))
		{
			menuState = menu.mainMenu;
			levelCurrent = noone;
			room_goto(rmMenu);
			
			tutProgress = 0;
			tutOpacity = 0;
			
			timeCurrent = 0;
			timerOn = false;
		}
		
		if (keyboard_check_pressed(vk_escape))
			menuState = menu.game;
	}
	break;
}

//Timers
if (menuState == menu.game || menuState == menu.pause)
{
	Input(true);
	if (!timerOn)
	{
		if (right || left || up || down || dashPress && !_falseTimerTrigger)
			timerOn = true;
	}
	else
		timeCurrent += floor(delta_time / 1000);
	
	if (showTimer)
	{
		var _seconds = timeCurrent div 1000;
		var _minutes = _seconds div 60;
		var _milliseconds = floor((timeCurrent % 1000) / 10);
		draw_text_transformed_colour(45, 45, string(_minutes) + ":" + string(_seconds) + "." + string(_milliseconds), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_colour(41, 41, string(_minutes) + ":" + string(_seconds) + "." + string(_milliseconds), 2, 2, 0, c_white, c_white, c_white, c_white, 1);

		var _bestTime = bestTimes[levelCurrent];
		var _timeDifference = _bestTime - timeCurrent;
		var _secondsDifference = abs(_timeDifference) div 1000;
		var _minutesDifference = abs(_secondsDifference) div 60;
		var _millisecondsDifference = abs(floor((_timeDifference % 1000) / 10));
		var _sign = (_timeDifference >= 0) ? "- " : "+ ";
		var _colour = (_timeDifference >= 0) ? GREEN : RED;
	
		if (_bestTime == 0)
		{
			_sign = "";
			_colour = c_white;
		}
		draw_text_transformed_colour(45, 45 + 50, _sign + string(_minutesDifference) + ":" + string(_secondsDifference) + "." + string(_millisecondsDifference), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_colour(41, 41 + 50, _sign + string(_minutesDifference) + ":" + string(_secondsDifference) + "." + string(_millisecondsDifference), 1, 1, 0, _colour, _colour, _colour, _colour, 1);
	}
}

buttonHover = buttonHoverControl;
