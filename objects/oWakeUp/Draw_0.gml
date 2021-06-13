startTimer--
if (startTimer == 0) image_speed = 1
draw_self()
if (image_index = 1) audio_play_sound(sndReturning,0,0)
if (image_index = 9) audio_play_sound(sndReturn,0,0)
if (image_index = 14) audio_play_sound(sndThrow,0,0)
if (image_index = 21)
{
	image_speed = 0
	image_index = 22
	oPlayer.image_alpha = 1
	oPlayer.cutscene = false
}