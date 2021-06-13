whsp = 0
dhsp = 0
hsp = 0
wvsp = 0
dvsp = 0
vsp = 0
collisionSpdDecrease = 0.2	//O kolik % ze zmenší rychlos po nárazu do zdi
walkSp = 0.7
runSp = 2.5
grvLight = 0.17
grvHeavy = 0.5
frc = 0.025
grndFrc = 0.75
movementCancel = 0.85

//Dash
baseSpd = 5
spdMult = 0.035

//Player Animation
animSpeed = 0;
animTimer = 0;
animFrame = 0;
animDirection = 1;
animArrayIdle = [0, 1, 2, 3];
animArrayWalk = [0, 1, 2, 3, 4, 5, 6, 7];
animArrayRun = [0, 1, 1, 1, 2, 3, 4, 4, 4, 5];

//SHADERY
application_surface_draw_enable(false)

//Particles
dustBurstSys = part_system_create()
dustBurst = part_type_create()
part_type_size(dustBurst,2,5,-.2,0)
part_type_life(dustBurst,20,30)
part_type_color1(dustBurst,$472C49)
part_type_speed(dustBurst,2,4,0,0)
part_type_gravity(dustBurst,.3,270)

dustCloseSys = part_system_create()
dustClose = part_type_create()
part_type_size(dustClose,2,5,0,0)
part_type_life(dustClose,800,900)
part_type_color1(dustClose,c_white)
part_type_speed(dustClose,.3,1,0,.05)
part_type_direction(dustClose,170,190,random_range(-.1,.1),.3)
part_type_alpha1(dustClose,0.3)
part_type_blend(dustClose,true)
