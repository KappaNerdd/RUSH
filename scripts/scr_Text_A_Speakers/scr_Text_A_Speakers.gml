function scr_TextSpeakers(_check) {
	switch(_check) {
		/////--------No One--------/////
		#region ///-----No One-----///
			case "No One":
				speaker_sprite[page_number] = spr_NoOneTextPort;
				speaker_Name[page_number] = "No One";
				txtb_spr[page_number] = spr_TextboxHead;
				snd[page_number] = snd_GeneralText;
				
				if _check2 == "No One" {
					speaker_extra[page_number] = spr_NoOneTextPort;
				}
			break;
			
			case "No One Ghost":
				speaker_sprite[page_number] = spr_NoOneTextPort;
				speaker_Name[page_number] = "No One";
				txtb_spr[page_number] = spr_TextboxHead;
				snd[page_number] = snd_NoText;
				
				if _check2 == "No One Ghost" {
					speaker_extra[page_number] = spr_NoOneTextPort;
				}
			break;
		#endregion
			
		/////--------Main Characters--------/////
		#region ///-----Kappa-----///
			#region //---No One---//
				case "Kappa_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_KappaTextbox;
					snd[page_number] = snd_MaleText;
				break;
			#endregion
			
			#region //---Head---//
				case "Kappa_Neutral_Head":
					speaker_sprite[page_number] = spr_Kappa_Neutral_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_Waiting_Head":
					speaker_sprite[page_number] = spr_Kappa_Waiting_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_Shocked_Head":
					speaker_sprite[page_number] = spr_Kappa_Shocked_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_FightStance_Head":
					speaker_sprite[page_number] = spr_Kappa_FightStance_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_Confused_Head":
					speaker_sprite[page_number] = spr_Kappa_Confused_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_LookUp_Head":
					speaker_sprite[page_number] = spr_Kappa_LookUp_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_LetsGetActive_Head":
					speaker_sprite[page_number] = spr_Kappa_LetsGetActive_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_Think_Head":
					speaker_sprite[page_number] = spr_Kappa_Think_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			
				case "Kappa_Prepare_Head":
					speaker_sprite[page_number] = spr_Kappa_Prepare_Head;
					speaker_Name[page_number] = "Kappa";
					txtb_spr[page_number] = spr_TextboxHead;
					snd[page_number] = snd_GeneralText;
				break;
			#endregion
				
			#region //---Normal---//
				case "Kappa_Neutral_Normal":
						speaker_sprite[page_number] = spr_Kappa_Neutral_Normal;
						speaker_Name[page_number] = "Kappa";
						txtb_spr[page_number] = spr_KappaTextbox;
						snd[page_number] = snd_MaleText;
					break;
					
					case "Kappa_Thinking_Normal":
						speaker_sprite[page_number] = spr_Kappa_Think_Normal;
						speaker_Name[page_number] = "Kappa";
						txtb_spr[page_number] = spr_KappaTextbox;
						snd[page_number] = snd_MaleText;
					break;
					
					case "Kappa_HeadHurt_Normal":
						speaker_sprite[page_number] = spr_Kappa_Confused_Normal;
						speaker_Name[page_number] = "Kappa";
						txtb_spr[page_number] = spr_KappaTextbox;
						snd[page_number] = snd_MaleText;
					break;
					
					case "Kappa_ThumbsUp_Normal":
						speaker_sprite[page_number] = spr_Kappa_OK_Normal;
						speaker_Name[page_number] = "Kappa";
						txtb_spr[page_number] = spr_KappaTextbox;
						snd[page_number] = snd_JSRSprayComplete;
					break;
				#endregion			
		#endregion
			
			
		#region ///-----Sarah-----///
			#region //---No One---//
				case "Sarah_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_SarahTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion
			
			#region //---Normal---//
				case "Sarah_Neutral_Normal":
					speaker_sprite[page_number] = spr_Sarah_Neutral_Normal;
					speaker_Name[page_number] = "Sarah";
					txtb_spr[page_number] = spr_SarahTextbox;
					snd[page_number] = snd_FemaleText;
				break;
					
				case "Sarah_Confused_Normal":
					speaker_sprite[page_number] = spr_Sarah_Confused_Normal;
					speaker_Name[page_number] = "Sarah";
					txtb_spr[page_number] = spr_SarahTextbox;
					snd[page_number] = snd_FemaleText;
				break;
					
				case "Sarah_Giddy_Normal":
					speaker_sprite[page_number] = spr_Sarah_Giddy_Normal;
					speaker_Name[page_number] = "Sarah";
					txtb_spr[page_number] = spr_SarahTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion			
		#endregion
				
		#region ///-----Lone-----///
			#region //---No One---//
				case "Lone_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_LoneTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion		
			
			#region //---Normal---//
				case "Lone_Neutral_Normal":
					speaker_sprite[page_number] = spr_Lone_Neutral_Normal;
					speaker_Name[page_number] = "Lone";
					txtb_spr[page_number] = spr_LoneTextbox;
					snd[page_number] = snd_FemaleText;
				break;
					
				case "Lone_Saiyan_Normal":
					speaker_sprite[page_number] = spr_Lone_Saiyan_Normal;
					speaker_Name[page_number] = "Lone";
					txtb_spr[page_number] = spr_LoneTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion
		#endregion
			
		#region ///-----Sophi-----///
			#region //---No One---//
				case "Sophi_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_SophiaTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion
				
			#region //---Normal---//
				case "Sophi_Neutral_Normal":
					speaker_sprite[page_number] = spr_Sophi_Neutral_Normal;
					speaker_Name[page_number] = "Sophi";
					txtb_spr[page_number] = spr_SophiaTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion	
		#endregion
			
		#region ///-----Scott-----///
			#region //---No One---//
				case "Scott_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_ScottTextbox
					snd[page_number] = snd_MaleText;
				break;
			#endregion
				
			#region //---Normal---//
				case "Scott_Neutral_Normal":
					speaker_sprite[page_number] = spr_Scott_Neutral_Normal;
					speaker_Name[page_number] = "Scott";
					txtb_spr[page_number] = spr_ScottTextbox
					snd[page_number] = snd_MaleText;
				break;
			#endregion		
		#endregion
			
			
		#region ///-----Brock-----///
			#region //---No One---//
				case "Brock_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_BrockTextbox;
					snd[page_number] = snd_MaleText;
				break;
			#endregion		
		#endregion
			
			
		#region ///-----Neegi-----///
			#region //---No One---//
				case "Neegi_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_NeegiTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion			
		#endregion
			
			
		#region ///-----Cloee-----///	
			#region //---No One---//
				case "Cloee_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_CloeeTextbox;
					snd[page_number] = snd_FemaleText;
				break;
			#endregion				
		#endregion
			
			
		#region ///-----Akira-----///
			#region //---No One---//
				case "Akira_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_AkiraTextbox;
					snd[page_number] = snd_MaleText;
				break;
			#endregion
		#endregion
			
			
		#region ///-----Lucifer-----///
			#region //---No One---//
				case "Lucifer_NoOne":
					speaker_sprite[page_number] = spr_NoOneTextPort;
					speaker_Name[page_number] = "No One";
					txtb_spr[page_number] = spr_LuciferTextbox
					snd[page_number] = snd_FemaleText;
				break;
			#endregion
				
				
			#region //---Normal---//
				case "Lucifer_Thinking_Normal":
					speaker_sprite[page_number] = spr_LuciThinkOld;
					speaker_Name[page_number] = "Lucifer";
					txtb_spr[page_number] = spr_LuciferTextbox
					snd[page_number] = snd_FemaleText;
				break;
			#endregion		
		#endregion
	}	
}

function scr_text_defaults_for_text() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//Variables for every character
	for(var c = 0; c < 500; c++) {
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		rainbowText[c, page_number] = false;
		rainbowTop[c, page_number] = false;
		speakerSpriteAt[c, page_number] = spr_NoOneTextPort;
		
		circleText[c, page_number] = false;
		circleDir[c, page_number] = c * 30;
		
		scaleText[c, page_number] = false;
		scaleDir[c, page_number] = c * 20;
		
		float_text[c, page_number] = false;
		float_dir[c, page_number] = c * 30;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
		
		text_Size[c, page_number] = 2;
		text_SizeRemove[c, page_number] = 0.1;
		
		text_Alpha[c, page_number] = 0;
		text_AlphaAdd[c, page_number] = 0.1;
	}
	
	forceLine[page_number] = false;
	speaker2Char[page_number] = false;
	
	txtb_spr[page_number] = spr_TextboxHead;
	speaker_Name[page_number] = "No One";
	speaker_sprite[page_number] = spr_NoOneTextPort;
	speaker_extra[page_number] = spr_NoOneTextPort;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_GeneralText;
	
	txtb_spr2[page_number] = spr_TextboxHead;
	speaker_Name2[page_number] = "No One";
	speaker_sprite2[page_number] = spr_NoOneTextPort;
	speaker_side2[page_number] = 1;
	snd2[page_number] = snd_GeneralText;
}

function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) { //Obsolete
	for(var c = _start; c <= _end; c++) {
		col_1[c, page_number - 1] = _col1;
		col_2[c, page_number - 1] = _col2;
		col_3[c, page_number - 1] = _col3;
		col_4[c, page_number - 1] = _col4;
	}
}

function scr_text_float(_start, _end) { //Obsolete
	for(var c = _start; c <= _end; c++) {
		float_text[c, page_number - 1] = true;
	}
}

function scr_text_shake(_start, _end) { //Obsolete
	for(var c = _start; c <= _end; c++) {
		shake_text[c, page_number - 1] = true;
	}
}

function scr_text(_text) {
	scr_text_defaults_for_text();
	
	text[page_number] = _text;
	
	if argument_count > 1 { //Textbox Speaker Side
		switch(argument[1]) { 
			case "true":
				speaker2Char[page_number] = true;
			break;
			
			case "false":
				speaker2Char[page_number] = false;
			break;
		}
	}
	
	if argument_count > 2 { //Textbox Speakers
		with(obj_Textbox) {
			speakerNames[page_number] = argument[2];
			speakerSprites[page_number] = [];
		}
		
		for (var i = 0; i < array_length(argument[2]); i++) {
			scr_TextSpeakers(argument[2][i]);
			speakerSprites[page_number][i] = speaker_sprite[page_number];
		}
		
		scr_TextSpeakers(argument[2][0]);
	}
	
	
	if argument_count > 3 { //Text Speed (Per Page)
		text_spd[page_number] = argument[3];
	}
	
	
	if argument_count > 4 { //Fuck with other objects' sprites
		if argument > 5 { //Choose object's sprite
			argument[4].sprite_index = argument[5];
		}
		
		if argument > 6 { //Choose object's xscale
			argument[5].image_xscale = argument[5];
		}
	}
	
	
	page_number++;
}



// @param option
// @param link_id
function scr_option(_option, _link_id) {
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	option_number++;
}

// @param text_id
function create_textbox(_text_id) {
	with(instance_create_depth(0, 0, 0, obj_Textbox)) {
		scr_game_text(_text_id);
	}
}

// @param chapter_id
function scr_CreateChapterName(_text_id) {
	with(instance_create_depth(0, 0, 0, obj_ChapterName)) {
		scr_game_text(_text_id);
	}
}