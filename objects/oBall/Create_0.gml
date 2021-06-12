whsp = 0
dhsp = 0
hsp = 0
wvsp = 0
dvsp = 0
vsp = 0
collisionSpdDecrease = 0.2	//O kolik % ze zmenší rychlos po nárazu do zdi
grv = 0.3
frc = 0.025
grndFrc = 0.75

enum STATE
{
	connected,
	thrown,
	comingBack
}

moveState = STATE.connected
collide = true

//Throw
charging = false
throwStrength = 0
throwStrengthBase = 5
throwTime = 0
throwMaxTime = 50
throwMult = 0.15

//Thrown
dashed = false

//Return
returnSpeed = 50
