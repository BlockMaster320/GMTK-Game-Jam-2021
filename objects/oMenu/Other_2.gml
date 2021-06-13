//Saving && Loading
saveFile = "savefile.sav";
if (!file_exists(saveFile))
{
	var _saveStruct = {
		levelUnlocked : 0
	};
	var _saveString = json_stringify(_saveStruct);
	json_string_save(_saveString, saveFile)
}
else
{
	var _saveString = json_string_load(saveFile);
	var _saveStruct = json_parse(_saveString);
	levelUnlocked = _saveStruct.levelUnlocked;
}
