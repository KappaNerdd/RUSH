global.Controllers = [];
global.Player1Con = 0;
global.Player2Con = 0;
global.Player3Con = 0;

p1Timer = 180;
textAlphaP1 = 0;

p2Timer = 180;
textAlphaP2 = 0;

p3Timer = 180;
textAlphaP3 = 0;

depth = -30;

conInputs = [
	[gp_padl, spr_InputPadLeft],
	[gp_padr, spr_InputPadRight],
	[gp_padu, spr_InputPadUp],
	[gp_padd, spr_InputPadDown],
	[gp_face1, spr_InputFaceA],
	[gp_face2, spr_InputFaceB],
	[gp_face3, spr_InputFaceX],
	[gp_face4, spr_InputFaceY],
	[gp_shoulderl, spr_InputFaceLB],
	[gp_shoulderlb, spr_InputFaceLT],
	[gp_shoulderr, spr_InputFaceRB],
	[gp_shoulderrb, spr_InputFaceRT],
	[gp_start, spr_InputFaceStart],
	[gp_select, spr_InputFaceSelect],
]

global.SpeedCount = false;
global.SpeedSec = 0;
global.SpeedMin = 0;
global.SpeedHour = 0;