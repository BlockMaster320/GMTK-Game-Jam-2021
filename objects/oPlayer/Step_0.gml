Input(true)

//Walk
whsp = (right - left) * walkSp

//Gravity
wvsp += grv

//Spd sum
hsp = whsp + dhsp
vsp = wvsp + dvsp

//Collision
Collision()