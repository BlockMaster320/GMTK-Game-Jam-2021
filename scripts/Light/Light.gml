///@arg targetX
///@arg targetY
///@arg Xcoord - 1=x,0=y
function ShadowLine(argument0, argument1, argument2) {
	var targetX = argument0
	var targetY = argument1
	var coord = argument2

	if (coord)
	{
		return x + lengthdir_x(3000,point_direction(other.x,other.y,targetX,targetY))
	}
	else
	{
		return y + lengthdir_y(3000,point_direction(other.x,other.y,targetX,targetY))
	}
}
