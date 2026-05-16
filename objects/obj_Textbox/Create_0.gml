//Textbox Creation
textbox_width = 768;
starterText_Width = 30;

textbox_height = 120;
border = 30;
line_sep = 20;
line_width = textbox_width - ((border * 3));
txtb_img = 0;
speakerChecker = "";
speakerChecker2 = "";

textboxYChange = 0;

//Textbox Character Portraits Position Shit
xChange = -260;
xChange2 = 260;
xChangeFinish = 60;
xChangeStart = 300;
sprite_index = spr_NoOneTextPort;
_speakerChar = spr_NoOneTextPort;
sprTextbox = spr_TextboxHead;

_charCol = 1;
_charCol2 = 1;

yChange = 0;
yChange2 = 0;

increaseY = false;
grav = 2;
yingEverywhere = -10;


if global.SimplifyVFX {
	txtb_img_spd = 0;
} else {
	txtb_img_spd = 0.1;
}

depth = -10;

//The Text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;

draw_char = 0;
text_spd = 0.5 * global.TextSpd;

setGUI = true;
stopText = false;

//Speaker Name
speakerName = "";


//Options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

optionHandSpeed = 0;

setup = false;
setupComplete = false;

//Sound
snd_delay = 2;
snd_count = snd_delay;

//Effects
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 4;

scr_GetCharShitCreate();
iconIndex = 0;