draw_self();

//Draw throwTime Representation


if (charging)
{
	var _lengthBase = 30;
	var _directionBase = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
	var _pointBase = [oPlayer.x + lengthdir_x(_lengthBase, _directionBase),
					  oPlayer.y + lengthdir_y(_lengthBase, _directionBase)]
	
	
	for (var _i = 2; _i >= 0; _i --)
	{
		var _changeRate = clamp(throwTime, 0, (throwMaxTime / 3) * (_i + 1)) * 0.7;
		var _length = _changeRate;
		var _angle = 7/* + _changeRate * 0.4*/;
		var _point1 = [oPlayer.x + lengthdir_x(_lengthBase + _length, _directionBase + _angle),
					   oPlayer.y + lengthdir_y(_lengthBase + _length, _directionBase + _angle)]
		var _point2 = [oPlayer.x + lengthdir_x(_lengthBase + _length, _directionBase - _angle),
					   oPlayer.y + lengthdir_y(_lengthBase + _length, _directionBase - _angle)]
		
		var _colour = make_colour_hsv(56, 142, 219);
		if (_i == 1) _colour = make_colour_hsv(30, 158, 219);
		if (_i == 2) _colour = make_colour_hsv(7, 158, 219);
			
		draw_triangle_colour(_pointBase[0], _pointBase[1], _point1[0], _point1[1], _point2[0], _point2[1],
							 _colour, _colour, _colour, false);
	}
	
	
	/*show_debug_message(_directionBase);*/
}