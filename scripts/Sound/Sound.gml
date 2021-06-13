function ImpactSound()
{
	var snd = choose(sndImpact1,sndImpact2,sndImpact3,sndImpact4)
	audio_play_sound(snd,0,0)
}

function FootStep(spd)
{
	footstepDelay--
	if (footstepDelay <= 0)
	{
		footstepDelay = footstepDelayDef
		if (spd = runSp) footstepDelay /= 1.5
		var snd = choose(sndFootstep1,sndFootstep2,sndFootstep3,sndFootstep4,sndFootstep5,sndFootstep6)
		audio_play_sound(snd,0,0)
	}
}
