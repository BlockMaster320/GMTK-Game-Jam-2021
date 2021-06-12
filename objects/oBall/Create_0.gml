whsp = 0
dhsp = 0
hsp = 0
wvsp = 0
dvsp = 0
vsp = 0
collisionSpdDecrease = 0.2	//O kolik % ze zmenší rychlos po nárazu do zdi
grv = 1
frc = 0.05
grndFrc = 1.5

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
throwStrengthBase = 20
throwTime = 0
throwMaxTime = 80

//Thrown
dashed = false

//Return
returnSpeed = 50
spdBoost = 10
