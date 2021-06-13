id.light = surface_create(room_width,room_height)
id.darken = surface_create(room_width,room_height)

lightCol = make_color_rgb(252,245,201)
radius = 200
alpha = .2

myShadows = instance_create_layer(x,y,"Interactions",oShadows)
with (myShadows)
{
    myLight = other.id
}