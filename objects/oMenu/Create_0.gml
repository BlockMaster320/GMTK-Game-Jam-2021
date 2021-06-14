menuState = menu.mainMenu;
buttonHoverControl = false;
buttonHover = false;

//Constants
enum menu
{
	mainMenu,
	levelSelect,
	game,
	pause
}

levelUnlocked = 0;
levelCurrent = noone;
levelArray = [rmLevel0, rmLevel1, rmLevel2, rmLevel3, rmLevel4, rmLevel5, rmLevel6, rmLevel7, rmLevel8, rmLevel9, rmLevel10, rmLevel11, rmLevel12, rmLevel13, rmLevel14]

//Tutorial
tutProgress = 0;
tutOpacity = 0;
tutAnimation = 0;
tutAnimationSign = 1;
