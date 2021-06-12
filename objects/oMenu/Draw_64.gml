//MAIN MENU
//Set Draw Values
var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();
var _drawY = _guiH * 0.5;
var _drawX = _guiW * 0.5;

var _buttonW = 150;
var _buttonH = 70;
var _buttonSpacing = 30;

draw_set_font(fntMenu);
window_set_cursor(cr_default);

switch (menuState)
{
	case menu.mainMenu:
	{
		if (button(_drawX, _drawY, _buttonW, _buttonH, "Play", true))
			menuState = menu.levelSelect;
		
		_drawY += _buttonH + _buttonSpacing;
		if (button(_drawX, _drawY, _buttonW, _buttonH, "Quit", true))
			game_end();
		
	}
	break;
	
	case menu.levelSelect:
	{
		var _levelSelectionY = _guiH * 0.3;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text_transformed_colour(_guiW * 0.5, _levelSelectionY - 50, "LEVEL SELECION", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		var _buttonWLong = _buttonW * 2;
		if (button(50 + _buttonWLong * 0.5, _guiH - 50 - _buttonH, _buttonWLong, _buttonH, "Back to Menu", true))
			menuState = menu.mainMenu;
		
		var _rows = 2;
		var _columns = 3;
		var _levelW = 150;
		var _levelH = 150;
		var _levelSpacing = 30;
		
		var _levelX = _guiW * 0.5 - floor(_columns * 0.5) * (_levelW + _levelSpacing) + (_levelW + _levelSpacing) * 0.5 * (_columns % 2 == 0);
		var _levelY = (_levelSelectionY + _levelH) - floor(_rows * 0.5) * (_levelH + _levelSpacing) + (_levelH + _levelSpacing) * 0.5 * (_rows % 2 == 0);
		for (var _r = 0; _r < _rows; _r ++)
		{
			for (var _c = 0; _c < _columns; _c ++)
			{
				var _level = _r * _columns + _c;
				var _drawX = _levelX + (_levelW + _levelSpacing) * _c;
				var _drawY = _levelY + (_levelH + _levelSpacing) * _r;
				if button(_drawX, _drawY, _levelW, _levelH, _level, true)
				{
					if (_level < array_length(levelArray))
					{
						room_goto(levelArray[_level]);
						menuState = menu.game;
					}
				}
			}
		}
		
		draw_line_colour(_guiW * 0.5, 0, _guiW * 0.5, _guiH, c_green, c_green);
	}
	break;
}

