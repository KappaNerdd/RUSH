sprite_index = obj_CustomJumpKeySpeed.sprite_index;
image_index = obj_CustomJumpKeySpeed.image_index;

waitTimer = 120;

visible = false;

image_speed = 0;


file = file_text_open_write(string(global.PastMindDataFile) + ".sav");
file_text_write_string(file, "NOW'S YOUR CHANCE TO SEE MY [BIG COCK] - Spamton G. Spamton");
file_text_close(file);
	
var _dir = working_directory + "/saves/" + string(global.saveFile) + "/";
var _filename = _dir + string(global.NoMindDataFile) + string(global.saveFile) + ".sav";
		
file2 = file_text_open_write(_filename);
file_text_write_string(file2, "Drivin' in my truck, right after a beer. \nHey, that bump is shaped like a deer. \nDUI? \nHow about you DIE? \nI'll go a hundred miillllessss an hour. \nLittle do you know, I filled up on gas. \nImma get your fountain-makin' ass. \nPulverize this FUCK! \nWith my BergenTRÜCK! \nIt seems you're outta luck! \nTRUCK!");
file_text_close(file2);