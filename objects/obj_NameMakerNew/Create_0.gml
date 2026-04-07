charArray = [
	[["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",],
	["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",],
	["Ñ", "ñ", "Á", "á", "É", "é", "Í", "í", "Ó", "ó", "Ú", "ú", "Ü", "ü",]],
	[["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",],
	["!", "¡", "?", "¿", ".", ",", ":", ";", "'", "`", "\"", "\\", "|", "+", "-", "*", "/", "=", "<", ">", "~", "^", "#", "$", "%", "&",],
	["@", "_", "(", ")", "[", "]", "{", "}",]]
]

charScale = 1.5;
charAlpha = 1;

nameChar = 0;
nameColumn = 0;
nameBar = 0;

changeTimer = 1;
changeFrames = 10;

confirmName = true;
nameChosen = false;
nameConfirmed = false;

visibleTimer = 2;
visibleNameUnder = false;

charX = 0;

nameY = 0;
nameAngle = 0;
nameScale = 1;

rightArrow = false;
rightFrames = 0;

leftArrow = false;
leftFrames = 0;