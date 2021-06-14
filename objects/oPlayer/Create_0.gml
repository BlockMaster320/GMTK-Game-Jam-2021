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

//Audio
footstepDelayDef = 40
footstepDelay = 0

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
part_type_size(dustClose,3,4,0,0)
part_type_life(dustClose,800,900)
part_type_color1(dustClose,c_white)
part_type_speed(dustClose,.6,2,0,.05)
part_type_direction(dustClose,170,190,random_range(-.1,.1),.3)
part_type_alpha1(dustClose,0.3)
part_type_blend(dustClose,true)

dustFarSys = part_system_create()
dustFar = part_type_create()
part_type_size(dustFar,.3,2,0,0)
part_type_life(dustFar,2000,2100)
part_type_color1(dustFar,c_white)
part_type_speed(dustFar,.1,.6,0,.05)
part_type_direction(dustFar,170,190,0,.3)
part_type_alpha1(dustFar,0.2)
part_type_blend(dustFar,true)

bloodSys = part_system_create()
blood = part_type_create()
part_type_size(blood,3,9,-.2,0)
part_type_life(blood,50,70)
part_type_color1(blood,make_color_rgb(158,45,28))
part_type_gravity(blood,.2,270)

dustPufSys = part_system_create()
dustPuf = part_type_create()
part_type_life(dustPuf,50,70)
part_type_sprite(dustPuf,sDust,0,0,true)
part_type_alpha2(dustPuf,1,.3)


var xx,yy
for (var i = 0; i < 15; i++)
{
	xx = random_range(oCamera.x,oCamera.x+480)
	yy = random_range(oCamera.y,oCamera.y+280)
	part_particles_create(dustCloseSys,xx,yy,dustClose,1)
}

for (var i = 0; i < 30; i++)
{
	xx = random_range(oCamera.x,oCamera.x+480)
	yy = random_range(oCamera.y,oCamera.y+280)
	part_particles_create(dustFarSys,xx,yy,dustFar,1)
}

//Cutscene
if (room = rmLevel0) cutscene = true
else cutscene = false

if (!audio_is_playing(sndSoundtrack) and !cutscene) audio_play_sound(sndSoundtrack,0,1)