for (var i = 0; i < 4; i++)
{
	var off = .05
	var xx = x - (x * off * i) - 10
	var yy = y - 10
	if (i != 0) yy -= 60
	draw_sprite_ext(sBackground,i,xx,yy,2,2,0,c_white,1)
}