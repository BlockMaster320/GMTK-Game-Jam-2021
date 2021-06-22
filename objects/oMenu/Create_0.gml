menuState = menu.mainMenu;
buttonHoverControl = false;
buttonHover = false;

//Constants
enum menu
{
	mainMenu,
	levelSelect,
	settings,
	game,
	pause
}

#macro RED make_colour_hsv(7, 158, 219)
#macro YELLOW make_colour_hsv(30, 158, 219)
#macro GREEN make_colour_hsv(56, 142, 219)

//Levels
levelUnlocked = 0;
levelCurrent = noone;
levelArray = [rmLevel0, rmLevel1, rmLevel2, rmLevel3, rmLevel4, rmLevel5, rmLevel6, rmLevel7, rmLevel8, rmLevel9, rmLevel10, rmLevel11, rmLevel12, rmLevel13, rmLevel14]

//Tutorial
tutProgress = 0;
tutOpacity = 0;
tutAnimation = 0;
tutAnimationSign = 1;

//Timers
showTimer = false;
bestTimes = noone;
bestTimes[1] = 5000
timerOn = false;
timeCurrent = 0;

//Saving && Loading
saveFile = "savefile.sav";
if (!file_exists(saveFile))
{
	var _saveStruct = {
		levelUnlocked : 0,
		bestTimes : array_create(array_length(levelArray), 0),
		settings : [false]
	};
	var _saveString = json_stringify(_saveStruct);
	json_string_save(_saveString, saveFile)
}
else
{
	var _saveString = json_string_load(saveFile);
	var _saveStruct = json_parse(_saveString);
	levelUnlocked = _saveStruct.levelUnlocked;
	bestTimes = _saveStruct.bestTimes;
	showTimer = _saveStruct.settings[0];
}
