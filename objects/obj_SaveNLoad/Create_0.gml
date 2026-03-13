#region //Change Language Sprites
	global.ResultsText = [
		[spr_ResultsNew, spr_ResultsHead],
		[spr_ResultsNewESP, spr_ResultsHead],
	]

	global.RankText = [
		[spr_ResultsRankNew, spr_ResultsRankCheckHead],
		[spr_ResultsRankNewESP, spr_ResultsRankCheckHead],
	]
#endregion

#region ///-----Default Options-----///
	//Audio
	global.MASTER_VOL = 1;
	global.MUSIC_VOL = 1;
	global.SFX_VOL = 1;
	global.TEXT_VOL = 1;
	global.AMBIENCE_VOL = 1;
	global.UniquePauseTheme = false;
	global.Footstep = true;

	//Visual
	global.SimplifyVFX = false;
	global.ScreenShake = true;
	global.Particles = true;
	global.ConDisplay = false;
	global.Outline = true;
	global.Squash = true;
	global.TextSpd = 1;
	global.Language = 1;
	global.VSync = false;

	//Misc
	global.FullScreen = false;
	global.SongTag = true;
	global.ConRumble = true
	global.ConType = 0;
	global.ExtendCamera = true;
	global.FPSOn = true;
	global.Speedrun = false;
	
	//Online
	global.DiscordRich = true;
	global.ShowGhost = true;
	
	//Preferences
	global.FocusLoss = false;
	global.ColorCode = true;
	global.ChangeColor = 0;

	//Controls
	global.ConDeadZone = 0.5;
	global.TrigDeadZone = 0.5;
	global.ControllerOnly = false;
	global.KeyboardP1 = false;
#endregion

#region ///-----Speed & Menu Controls-----///

	//Controls Keyboard
	global.LeftKeySpeed = vk_left;
	global.RightKeySpeed = vk_right;
	global.UpKeySpeed = vk_up;
	global.DownKeySpeed = vk_down;
	global.JumpKeySpeed = "Z";
	global.ActionKeySpeed = "X";
	global.Action1KeySpeed = "C";
	global.Action2KeySpeed = vk_space;
	global.Action3KeySpeed = "V";
	global.Action4KeySpeed = vk_lshift;
	global.PauseKeySpeed = vk_enter;
	global.SelectKeySpeed = vk_lcontrol;


	//Controls Controller
	global.LeftPadSpeed = gp_padl;
	global.RightPadSpeed = gp_padr;
	global.UpPadSpeed = gp_padu;
	global.DownPadSpeed = gp_padd;
	global.JumpButtonSpeed = gp_face1;
	global.ActionButtonSpeed = gp_face2;
	global.Action1ButtonSpeed = gp_face3;
	global.Action2ButtonSpeed = gp_shoulderr;
	global.Action3ButtonSpeed = gp_face4;
	global.Action4ButtonSpeed = gp_shoulderl;
	global.PauseButtonSpeed = gp_start;
	global.SelectButtonSpeed = gp_select;
#endregion

#region ///-----Action Controls-----///

	//Controls Keyboard
	global.LeftKeyAction = vk_left;
	global.RightKeyAction = vk_right;
	global.UpKeyAction = vk_up;
	global.DownKeyAction = vk_down;
	global.LightKeyAction = "X";
	global.MediumKeyAction = "C";
	global.HeavyKeyAction = "V";
	global.SpecialKeyAction = "Z";
	global.DashKeyAction = vk_space;
	global.SuperDashKeyAction = vk_lshift;
	global.ParryKeyAction = "G";
	global.ChargeKeyAction = "B";


	//Controls Controller
	global.LeftPadAction = gp_padl;
	global.RightPadAction = gp_padr;
	global.UpPadAction = gp_padu;
	global.DownPadAction = gp_padd;
	global.LightButtonAction = gp_face3;
	global.MediumButtonAction = gp_face4;
	global.HeavyButtonAction = gp_face2;
	global.SpecialButtonAction = gp_face1;
	global.DashButtonAction = gp_shoulderrb;
	global.SuperDashButtonAction = gp_shoulderr;
	global.ParryButtonAction = gp_shoulderl;
	global.ChargeButtonAction = gp_shoulderlb;
#endregion

#region ///-----Player Controllers-----///
	global.Player1Con = 0;
	global.Player2Con = 0;
	global.Player3Con = 0;
#endregion

#region ///-----File BS-----///
	if !directory_exists("saves") {
		directory_create("saves");
	}
	
	if !directory_exists("global") {
		directory_create("global");
	}
	
	if !directory_exists("options") {
		directory_create("options");
	}

	if !directory_exists("ghosts") {
		directory_create("ghosts");
	}
	
	if !directory_exists("replay") {
		directory_create("replay");
	}
	
	if !directory_exists("custom_boombox") {
		directory_create("custom_boombox");
	}
	
	if !directory_exists("screenshots") {
		directory_create("screenshots");
	}

	global.Replay = false;

	global.FileLimit = 7;

	//File Names
	global.MainDataFile = "ARMAINDATA";
	global.SpeedDataFile = "ARSPEEDDATA";
	global.ActionDataFile = "ARACTIONDATA";
	global.NoMindDataFile = "ARNOMINDDATA";
	global.PastMindDataFile = "ARPASTMINDDATA";
	
	global.OptionsDataFile = "AROPTIONSDATA";
	global.ControlsDataFile = "ARCONTROLSDATA";
	global.JukeboxDataFile = "ARJUKEBOXDATA";
	global.LanguageCreationFile = "LANGCHOSEN";
	
	scr_RenameFiles();

	//YOUR name (I really only added this just to see if I could with no help. Needless to say, it's pretty decent.)
	global.PlayerName = "";

	//Player Time
	global.PlayerTimeSeconds = 0;
	global.PlayerTimeMinutes = 0;
	global.PlayerTimeHours = 0;
#endregion

#region ///-----Player Char BS-----///
	//Characters you were playing as (Partner characters will come in later) (Ok, I MAY have lied to myself) (Ok, I MAY have not lied to myself) (Ok, I MAY have lied again for now) (There's a good chance I WASN'T lying to myself)
	global.PlayerChar = 0;
	global.PlayerCostume = 0;

	global.PartnerChar = -1;
	global.PartnerCostume = 0;

	global.Partner2Char = -1;
	global.Partner2Costume = 0;

	global.Girly = false;
	global.MIND = false;
	
	global.PlayerID = noone;
#endregion

#region ///-----Title BS-----///
	global.TitleOpt = "";
	global.TitleSettings = 0;
#endregion

#region //Indicate you're playing from the Freeplay Menu
	global.Freeplay = false;
#endregion

#region //Character Select Shit (This makes it so much easier, holy fuck)
	global.PlayerSelection =
	[
		//Kappa (HEAD)
		[
			["name_Kappa", false, "name_Kap"], //Char Name (Name of your Character) && Girly 
		
			false, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let you choose to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdleHead, 9, scr_LocalText("name_Kap")], //MIND
			],
		
			[255, 255, 255], //RGB (Must be filled out)
		 
			[spr_PauseMenuBGBasic, 15, spr_MCursorHead], //Character Textbox (Optional: Sprite Strip)
		
			obj_KappaHeadOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_KappaHead, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_KappaHead, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Kappa_Head, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameKappaHead, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				//Because of how I coded this in source, you'll have to interpret your character's stats
				17, //Char Age (Optional)
				19, //Acceleration (Max: 20)
				14, //Jump Height (Max: 20)
				13, //Weight (Max: 20)
				11, //Max Speed (Grab from your max_Speed variable)
				16, //Break Speed (Grab from your full_Speed variable)
				18,
			],
		
			[spr_BoostMeterKappaHead, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemKappaHead, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemKappaHeadRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeKappaHead, spr_LifeKappaHead, spr_StageCharKappaHead, spr_LifeKappaHead, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_KappaHeadBoost, spr_KappaHeadBoostSimple, spr_HeadStompingVFX, spr_HeadStompedVFX, spr_KappaSpeedBreakVFX, 1],
			[spr_KappaHeadTrickFinishVFX, 1],
		
			mus_FreeplayKMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Waitin, //Pause Theme (Ditto for Freeplay)
			"Waitin' (Freeplay Kappa Mvt.)",
		
			[mus_NextTime, mus_StandProud, mus_HonorarySonic, mus_HonorarySonic, mus_ImDoneHere], //Results Theme Tracks [shit, good, sick, perfect]
			["You'll Get 'em Next Time", "Stand Proud", "Honorary Sonic", "Honorary Sonic",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_KappaHead, 1], //Results Portrait
			["stagecharkappahead",],
			[spr_CheckpointHead, spr_RingHeadIcon, spr_RingKappaHandHead, spr_CharSelectKappaHeadIcon, spr_IntroQuoteKappa, 1],
		],
	
		//Kappa
		[
			["name_Kappa", false, "name_Kap"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			false, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let you choose to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Kap1"], //Normal
				[true, spr_KappaIdleHideki, 9, "cost_Kap2"], //Hideki
			],
		
			[010, 036, 203], //RGB (Must be filled out)
		
			[spr_KappaTextbox, 15, spr_MCursorKappa], //Character Textbox (Optional: Sprite Strip)
		
			obj_KappaNormalOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_KappaSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_KappaSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Kappa_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameKappa, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				//Because of how I coded this in source, you'll have to interpret your character's stats
				17, //Char Age (Optional)
				19, //Acceleration (Max: 20)
				14, //Jump Height (Max: 20)
				13, //Weight (Max: 20)
				11, //Max Speed (Grab from your max_Speed variable)
				16, //Break Speed (Grab from your full_Speed variable)
				18,
			],
		
			[spr_BoostMeterKappa, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemKappa, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemKappaRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeKappaSet, spr_LifeKappaSetColor, spr_StageCharKappaSet, spr_LifeKappaHead, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_KappaBoost, spr_KappaBoostSimple, spr_KappaStompingVFX, spr_KappaStompedVFX, spr_KappaSpeedBreakVFX, 1],
			[spr_KappaTrickFinalVFX, 1],
		
			mus_FreeplayKMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Waitin, //Pause Theme (Ditto for Freeplay)
			"Waitin' (Freeplay Kappa Mvt.)",
		
			[mus_NextTime, mus_StandProud, mus_HonorarySonic, mus_HonorarySonic, mus_ImDoneHere], //Results Theme Tracks [shit, good, sick, perfect]
			["You'll Get 'em Next Time", "Stand Proud", "Honorary Sonic", "Honorary Sonic",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_KappaSet, 1], //Results Portrait
			["stagecharkappanormal",],
			[spr_CheckpointKappa, spr_RingKappaIcon, spr_RingKappaHand, spr_CharSelectKappaIcon, spr_IntroQuoteKappa, 1],
		],
	
		//Sarah
		[
			["name_Sarah", true, "name_Sar"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			false, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_SarahIdleRight, 7, "cost_Sar1"], //Normal
			],
		
			[064, 245, 255], //RGB (Must be filled out)
		
			[spr_SarahTextbox, 11, spr_MCursorSarah],
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_SarahSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_SarahSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Sarah_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameSarah, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				16, //Char Age (Optional) (Type string, "N/A", or anything else in a string if you don't want to disclose)
				16, //Acceleration (Max: 20)
				16, //Jump Height (Max: 20)
				11, //Weight (Max: 20)
				10, //Max Speed (Grab from your max_Speed variable)
				15, //Break Speed (Grab from your full_Speed variable)
				17,
			],
		
			[spr_BoostMeterSarah, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemSarah, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemSarahRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeSarahSet, spr_LifeSarahSetColor, spr_StageCharSarahSet, spr_LifeSarahHead, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_SarahBoost, spr_SarahBoostSimple, spr_SarahStompingVFX, spr_SarahStompedVFX, spr_SarahSpeedBreakVFX, 1],
			[spr_SarahTrickFinalVFX, 1],
		
			mus_FreeplaySMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_NoRush, //Pause Theme (Ditto for Freeplay)
			"No Rush (Freeplay Sarah Mvt.)",
		
			[mus_DidYourBest, mus_KnewYouHadIt, mus_HeartsAround, mus_HeartsAround, mus_YouDidIt], //Results Theme Tracks [shit, good, sick, perfect]
			["You Did Your Best", "I Knew You Had it in You", "Hearts All Around", "Hearts All Around",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_SarahSet, 1], //Results Portrait
			["stagecharsarahnormal",],
			[spr_CheckpointSarah, spr_RingSarahIcon, spr_RingSarahHand, spr_CharSelectSarahIcon, spr_IntroQuoteSarah, 1],
		],
	
		//Lone
		[
			["name_Alone", true, "name_Lone"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			false, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Lon1"], //Normal
			],
		
			[114, 070, 217], //RGB (Must be filled out)
		
			[spr_LoneTextbox, 42, spr_MCursorLone], //Character Textbox (Optional: Sprite Strip)
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_LoneSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_LoneSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Sarah_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameLone, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				16, //Char Age (Optional)
				16,
				15,
				11,
				8,
				15,
				17,
			],
		
			[spr_BoostMeterLone, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLone, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLoneRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeLoneSet, spr_LifeLoneSetColor, spr_StageCharLoneSet, spr_LifeLoneSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_SarahBoost, spr_SarahBoostSimple, spr_LoneStompingVFX, spr_LuciferStompedVFX, spr_IvySpeedBreakVFX, 1],
			[spr_SarahTrickFinalVFX, 1],
		
			mus_FreeplayLMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Arpeggio, //Pause Theme (Ditto for Freeplay)
			"Arpeggio (Freeplay Lone Mvt.)",
		
			[mus_Diminuendo, mus_Allegro, mus_Crescendo, mus_Crescendo, mus_AlFine], //Results Theme Tracks [shit, good, sick, perfect]
			["Diminuendo", "Allegro", "Crescendo", "Crescendo",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_LoneSet, 1], //Results Portrait
			["stagecharlonenormal",],
			[spr_CheckpointSarah, spr_RingLoneIcon, spr_RingLoneHand, spr_CharSelectLoneIcon, spr_IntroQuoteLone, 1],
		],
	
		//Brock
		[
			["name_Brock", false, "name_Bro"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Bro1"], //Normal
			],
		
			[220, 067, 030], //RGB (Must be filled out)
		
			[spr_BrockTextbox, 13, spr_MCursorBrock], //Character Textbox (Optional: Sprite Strip)
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_BrockSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_BrockSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Sarah_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameSarah, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				19, //Char Age (Optional)
				16,
				15,
				11,
				8,
				14,
				16,
			],
		
			[spr_BoostMeterLone, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLone, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLoneRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeBrockSet, spr_LifeBrockSetColor, spr_StageCharBrockSet, spr_LifeBrockSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_KappaBoost, spr_KappaBoostSimple, spr_KappaStompingVFX, spr_KappaStompedVFX, spr_IvySpeedBreakVFX, 1],
			[spr_KappaTrickFinalVFX, 1],
		
			mus_FreeplayBMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Hajime, //Pause Theme (Ditto for Freeplay)
			"Hajime (Freeplay Brock Mvt.)",
		
			[mus_PulledPunches, mus_KnewYouHadIt, mus_Fisticuffs, mus_Fisticuffs, mus_ImDoneHere], //Results Theme Tracks [shit, good, sick, perfect]
			["Held-Back", "I Knew You Had it in You", "Fisticuffs", "Fistcuffs",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_BrockSet, 1], //Results Portrait
			["stagecharbrocknormal",],
			[spr_CheckpointKappa, spr_RingKappaIcon, spr_RingKappaHand, spr_CharSelectBrockIcon, spr_IntroQuoteBrock, 1],
		],
	
		//Neegi
		[
			["name_Neegi", true, "name_Nee"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Nee1"], //Normal
			],
		
			[114, 0, 255], //RGB (Must be filled out)
		
			[spr_NeegiTextbox, 13, spr_MCursorNeegi], //Character Textbox (Optional: Sprite Strip)
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_NeegiSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_NeegiSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Sarah_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameSarah, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				16, //Char Age (Optional)
				16,
				15,
				11,
				8,
				15,
				17,
			],
		
			[spr_BoostMeterLone, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLone, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLoneRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeNeegiSet, spr_LifeNeegiSetColor, spr_StageCharNeegiSet, spr_LifeNeegiSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_SarahBoost, spr_SarahBoostSimple, spr_SarahStompingVFX, spr_LuciferStompedVFX, spr_IvySpeedBreakVFX, 1],
			[spr_SarahTrickFinalVFX, 1],
		
			mus_FreeplayNMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_EurobeatCheck, //Pause Theme (Ditto for Freeplay)
			"Eurobeat Check (Freeplay Neegi Mvt.)",
		
			[mus_HijoDePuta, mus_KnewYouHadIt, mus_HonorWithin, mus_HonorWithin, mus_ImDoneHere], //Results Theme Tracks [shit, good, sick, perfect]
			["¡HIJO DE PUTA!", "I Knew You Had it in You", "Honor Within", "Honor Within",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_NeegiSet, 1], //Results Portrait
			["stagecharneeginormal",],
			[spr_CheckpointSarah, spr_RingKappaIcon, spr_RingKappaHand, spr_CharSelectNeegiIcon, spr_IntroQuoteNeegi, 1],
		],
	
		//Cloee
		[
			["name_Cloee", true, "name_Clo"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Clo1"], //Normal
			],
		
			[255, 132, 025], //RGB (Must be filled out)
		
			[spr_CloeTextbox, 10, spr_MCursorCloee],
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_CloeeSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_CloeeSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Sarah_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameSarah, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				16, //Char Age (Optional)
				16,
				15,
				11,
				6,
				14,
				16,
			],
		
			[spr_BoostMeterCloee, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemCloee, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemCloeeRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeCloeeSet, spr_LifeCloeeSetColor, spr_StageCharCloeSet, spr_LifeCloeeSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_SarahBoost, spr_SarahBoostSimple, spr_SarahStompingVFX, spr_LuciferStompedVFX, spr_IvySpeedBreakVFX, 1],
			[spr_SarahTrickFinalVFX, 1],
		
			mus_FreeplayCMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_StarBright, //Pause Theme (Ditto for Freeplay)
			"Star-Bright (Freeplay Cloee Mvt.)",
		
			[mus_NotAllBad, mus_KnewYouHadIt, mus_HeartsAround, mus_HeartsAround, mus_YouDidIt], //Results Theme Tracks [shit, good, sick, perfect]
			["Not All Bad", "I Knew You Had it in You", "Hearts All Around", "Hearts All Around",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_CloeeSet, 1], //Results Portrait
			["stagecharcloeenormal",],
			[spr_CheckpointSarah, spr_RingCloeeIcon, spr_RingCloeeHand, spr_CharSelectCloeeIcon, spr_IntroQuoteCloee, 1],
		],
	
		//Akira
		[
			["name_Akira", false, "name_AK"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			false, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Aki1"], //Normal
			],
		
			[143, 000, 000], //RGB (Must be filled out)
		
			[spr_AkiraTextbox, 5, spr_MCursorAkira],
		
			obj_KappaNormalOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_AkiraSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_AkiraSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Akira_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameAkira, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				17, //Char Age (Optional)
				16,
				15,
				11,
				11,
				16,
				18,
			],
		
			[spr_BoostMeterAkira, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemAkira, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemAkiraRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeAkiraSet, spr_LifeAkiraSetColor, spr_StageCharAkiraSet, spr_LifeAkiraSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_KappaBoost, spr_KappaBoostSimple, spr_KappaStompingVFX, spr_KappaStompedVFX, spr_IvySpeedBreakVFX, 1],
			[spr_KappaTrickFinalVFX, 1],
		
			mus_FreeplayAMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Flamerunner, //Pause Theme (Ditto for Freeplay)
			"Flamerunner (Freeplay Akira Mvt.)",
		
			[mus_Diminished, mus_Lighter, mus_LitUp2HOT, mus_LitUp2HOT, mus_Lit], //Results Theme Tracks [shit, good, sick, perfect]
			["Diminished", "Lighter", "Feelin' Nice", "Feelin' Nice",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_AkiraSet, 1], //Results Portrait
			["stagecharakiranormal",],
			[spr_CheckpointKappa, spr_RingAkiraIcon, spr_RingAkiraHand, spr_CharSelectAkiraIcon, spr_IntroQuoteAkira, 1],
		],
	
		//Taylor
		[
			["name_Taylor", true, "name_TJ"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Tay1"], //Normal
			],
		
			[198, 025, 064], //RGB (Must be filled out)
		
			[spr_TaylorTextbox, 4, spr_MCursorTaylor],
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_TaylorSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_TaylorSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Taylor_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameSarah, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				19, //Char Age (Optional)
				16,
				15,
				11,
				6,
				14,
				16,
			],
		
			[spr_BoostMeterLone, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLone, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLoneRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeTaylorSet, spr_LifeTaylorSetColor, spr_StageCharTaylorSet, spr_LifeTaylorSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_SarahBoost, spr_SarahBoostSimple, spr_SarahStompingVFX, spr_LuciferStompedVFX, spr_IvySpeedBreakVFX, 1],
			[spr_SarahTrickFinalVFX, 1],
		
			mus_FreeplayTMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Knuckleblaster, //Pause Theme (Ditto for Freeplay)
			"Knuckleblaster (Freeplay Taylor Mvt.)",
		
			[mus_HijoDePuta, mus_KnewYouHadIt, mus_FeelDaWind, mus_FeelDaWind, mus_YouDidIt], //Results Theme Tracks [shit, good, sick, perfect]
			["¡HIJO DE PUTA!", "I Knew You Had it in You", "Feel Da Wind", "Feel Da Wind",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_TaylorSet, 1], //Results Portrait
			["stagechartaylornormal",],
			[spr_CheckpointSarah, spr_RingKappaIcon, spr_RingKappaHand, spr_CharSelectTaylorIcon, spr_IntroQuoteTaylor, 1],
		],
	
		//Ayana
		[
			["name_Ayana", true, "name_AA"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Aya1"], //Normal
			],
		
			[207, 46, 87], //RGB (Must be filled out)
		
			[spr_AyanaTextbox, 2, spr_MCursorAyana],
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_AyanaSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_AyanaSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Ayana_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameSarah, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				19, //Char Age (Optional)
				16,
				15,
				11,
				6,
				15,
				17,
			],
		
			[spr_BoostMeterLone, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLone, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLoneRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeAyanaSet, spr_LifeAyanaSetColor, spr_StageCharAyanaSet, spr_LifeAyanaSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_SarahBoost, spr_SarahBoostSimple, spr_SarahStompingVFX, spr_LuciferStompedVFX, spr_IvySpeedBreakVFX, 1],
			[spr_SarahTrickFinalVFX, 1],
		
			mus_FreeplayAYMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Sharpshooter, //Pause Theme (Ditto for Freeplay)
			"Sharpshooter (Freeplay Ayana Mvt.)",
		
			[mus_HijoDePuta, mus_Playmate, mus_D4NG3R, mus_D4NG3R, mus_YouDidIt], //Results Theme Tracks [shit, good, sick, perfect]
			["¡HIJO DE PUTA!", "Playmate", "D 4 N G 3 R", "D 4 N G 3 R",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_AyanaSet, 1], //Results Portrait
			["stagecharayananormal",],
			[spr_CheckpointSarah, spr_RingKappaIcon, spr_RingKappaHand, spr_CharSelectAyanaIcon, spr_IntroQuoteAyana, 1],
		],
		
		//Roxxane
		[
			["name_Roxxane", true, "name_Rocks"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Rox1"], //Normal
			],
		
			[241, 139, 176], //RGB (Must be filled out)
		
			[spr_RoxxaneTextbox, 12, spr_MCursorRoxxane], //Character Textbox (Optional: Sprite Strip)
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_RoxxaneSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_RoxxaneSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Sarah_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameRoxxane, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				18, //Char Age (Optional)
				16,
				15,
				11,
				6,
				15,
				17,
			],
		
			[spr_BoostMeterLone, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLone, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLoneRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeRoxxaneSet, spr_LifeRoxxaneSetColor, spr_StageCharRoxxaneSet, spr_LifeRoxxaneSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_SarahBoost, spr_SarahBoostSimple, spr_SarahStompingVFX, spr_KappaStompedVFX, spr_IvySpeedBreakVFX, 1], //Boost [Normal, Simple, Frames]
			[spr_SarahTrickFinalVFX, 1], //Final Trick VFX
		
			mus_FreeplayRXMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_PerraCulo, //Pause Theme (Ditto for Freeplay)
			"Perra-Culo (Freeplay Roxxane Mvt.)",
		
			[mus_HijoDePuta, mus_KnewYouHadIt, mus_JoderSi, mus_JoderSi, mus_PorFin], //Results Theme Tracks [shit, good, sick, perfect]
			["¡HIJO DE PUTA!", "I Knew You Had it in You", "¡JODER SÍ!", "¡JODER SÍ!",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_RoxxaneSet, 1], //Results Portrait
			["stagecharroxxanenormal",],
			[spr_CheckpointSarah, spr_RingKappaIcon, spr_RingKappaHand, spr_CharSelectRoxxaneIcon, spr_IntroQuoteRoxxane, 1],
		],
	
		//Lucifer
		[
			["name_Lucifer", true, "name_Luci"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			false, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Luc1"], //Normal
			],
		
			[207, 041, 229], //RGB (Must be filled out)
		
			[spr_LuciferTextbox, 12, spr_MCursorLucifer], //Character Textbox (Optional: Sprite Strip)
		
			obj_SarahOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_LuciferSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_LuciferSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Lucifer_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameLucifer, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				//Because of how I coded this in source, you'll have to interpret your character's stats
				17, //Char Age (Optional)
				19, //Acceleration (Max: 20)
				14, //Jump Height (Max: 20)
				13, //Weight (Max: 20)
				11, //Max Speed (Grab from your max_Speed variable)
				16, //Break Speed (Grab from your full_Speed variable)
				18,
			],
		
			[spr_BoostMeterLucifer, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLucifer, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLuciferRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeLuciferSet, spr_LifeLuciferSetColor, spr_StageCharKappaSet, spr_LifeLuciferSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_LuciferBoost, spr_LuciferBoostSimple, spr_LuciferStompingVFX, spr_LuciferStompedVFX, spr_LuciferSpeedBreakVFX, 1], //Boost [Normal, Simple, Frames]
			[spr_LuciferTrickFinalVFX, 1], //Final Trick VFX
		
			mus_FreeplayLuMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Waiting, //Pause Theme (Ditto for Freeplay)
			"Waiting (Freeplay Lucifer Mvt.)",
		
			[mus_BeenBetter, mus_YouStrong, mus_HonoraryBlaze, mus_HonoraryBlaze, mus_ItsDone], //Results Theme Tracks [shit, good, sick, perfect]
			["That Could've Been Better", "You Are Strong", "Honorary Blaze", "Honorary Blaze",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_LuciferSet, 1], //Results Portrait
			["stagecharlucifernormal",],
			[spr_CheckpointSarah, spr_RingLuciferIcon, spr_RingLuciferHand, spr_CharSelectLuciferIcon, spr_IntroQuoteLucifer, 1],
		],
	
		//Rush
		[
			["name_Rush", true, "name_Ru"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			false, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_RushIdle, 9, "cost_Rus1"], //Normal
			],
		
			[000, 200, 248], //RGB (Must be filled out)
		
			[spr_RushTextbox, 24, spr_MCursorRush], //Character Textbox (Optional: Sprite Strip)
		
			obj_RushOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_RushSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_RushSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Rush_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameRush, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				20, //Char Age (Optional)
				20,
				16,
				15,
				12,
				17,
				19,
			],
		
			[spr_BoostMeterRush, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemRush, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemRushRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeRushSet, spr_LifeRushSetColor, spr_StageCharRushSet, spr_LifeRushHead, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_RushBoost, spr_RushBoostSimple, spr_RushStompingVFX, spr_RushStompedVFX, spr_RushSpeedBreakVFX, 1], //Boost
			[spr_RushTrickFinalVFX, 1], //Final Trick VFX
		
			mus_FreeplayRMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_HurryUp, //Pause Theme (Ditto for Freeplay)
			"Hurry Up (Freeplay Rush Mvt.)", //Freeplay/Pause Theme Name (Must be a string, EX: "")
		
			[mus_KiddinMe, mus_NotBad, mus_TalkinAbout, mus_TalkinAbout, mus_Groovy], //Results Theme Tracks [shit, good, sick, perfect]
			["You Gotta be Kiddin' Me", "Ayy, Not Bad", "That's What I'm TALKIN' About!!", "That's What I'm TALKIN' About!!",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_RushSet, 1], //Results Portrait
			["stagecharrushnormal",],
			[spr_CheckpointRush, spr_RingRushIcon, spr_RingRushHand, spr_CharSelectRushIcon, spr_IntroQuoteRush, 1],
		],
	
		//Edge
		[
			["name_Edge", true, "name_Ed"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			true, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			false, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_KappaIdle, 9, "cost_Edg1"], //Normal
			],
		
			[046, 036, 052], //RGB (Must be filled out)
		
			[spr_EdgeTextbox, 12, spr_MCursorEdge], //Character Textbox (Optional: Sprite Strip)
		
			obj_RushOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_EdgeSet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_EdgeSet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Rush_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameEdge, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				20, //Char Age (Optional)
				20,
				15,
				11,
				12,
				17,
				19,
			],
		
			[spr_BoostMeterLone, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemLone, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemLoneRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeEdgeSet, spr_LifeEdgeSetColor, spr_StageCharEdgeSet, spr_LifeEdgeSet, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_RushBoost, spr_RushBoostSimple, spr_KappaStompingVFX, spr_KappaStompedVFX, spr_IvySpeedBreakVFX, 1], //Boost
			[spr_RushTrickFinalVFX, 1], //Final Trick VFX
		
			mus_FreeplayEMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_BlackArms, //Pause Theme (Ditto for Freeplay)
			"Black-Arms (Freeplay Edge Mvt.)",
		
			[mus_BrokenChaos, mus_KnewYouHadIt, mus_HeartsAround, mus_HeartsAround, mus_Skrrrt], //Results Theme Tracks [shit, good, sick, perfect]
			["Broken Chaos", "I Knew You Had it in You", "Hearts All Around", "Hearts All Around",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_EdgeSet, 1], //Results Portrait
			["stageCharEdgeNormal",],
			[spr_CheckpointRush, spr_RingKappaIcon, spr_RingKappaHand, spr_CharSelectEdgeIcon, spr_IntroQuoteEdge, 1],
		],
	
		//Ivy
		[
			["name_Ivy", false, "name_Ivy"], //Char Name (Name of your Character)
		
			true, //Char Playable (If false, your character will not appear in Character Select screen at all)
			false, //Char Locked (If true, your character will appear blacked out and won't be selectable)
			true, //Char Ask Girly (If true, Character Select will let the player you to have "Girly" remixes for certain tracks while playing this character)
		
			[ //Char Costumes (Must Have at least 1)
				[true, spr_IvyIdle, 11, "cost_Ivy1"], //Normal
			],
		
			[255, 189, 000], //RGB (Must be filled out)
		
			[spr_IvyTextbox, 8, spr_MCursorEdge], //Character Textbox (Optional: Sprite Strip)
		
			obj_IvyOverworld, //SPEED STAGE Player Object
			obj_ActionPlayer, //ACTION STAGE Player Object
		
			[spr_LevelCard_IvySet, 1], //SPEED STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_LevelCard_IvySet, 1], //ACTION STAGE Level Portrait (Optional (Costumes): Sprite Strip)
			[spr_Freeplay_Ivy_Set, 1], //Freeplay Character Portrait (Optional (Costumes): Sprite Strip)
			[spr_CharNameIvy, 1], //Character Select/Freeplay Char Name (Optional (Animated): Sprite Strip)
		
			[ //Character Select Stats (SPEED STAGE)
				13, //Char Age (Optional)
				16,
				12,
				11,
				9,
				14,
				16,
			],
		
			[spr_BoostMeterIvy, 1], //Boost Meter (Sprite Strip)
			[spr_BoostEmblemIvy, 1], //Trick Particles/Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_BoostEmblemIvyRush, 1], //RUSH MODE Version of Boost Emblem (Optional (Animated): Sprite Strip)
			[spr_LifeIvySet, spr_LifeIvySetColor, spr_StageCharIvySet, spr_LifeIvyHead, 1], //Extra Life Icon/STAGE Char Icon (Optional (Costumes): Sprite Strip)
			[spr_IvyBoost, spr_IvyBoostSimple, spr_IvyStompingVFX, spr_IvyStompedVFX, spr_IvySpeedBreakVFX, 1], //Boost
			[spr_IvyFinalTrickVFX, 1], //Trick Icon that appears when you do a Rush Trick Finish (Optional (Animated): Sprite Strip)
		
			mus_FreeplayIMvt, //Freeplay Theme (Recommend 160 BPM, for consistancy with base tracks)
			mus_Holster, //Pause Theme (Ditto for Freeplay)
			"Holster (Freeplay Ivy Mvt.)", //Freeplay/Pause Theme Name (Must be a string, EX: "")
		
			[mus_ShotDown, mus_ArrightPardner, mus_JUSTICE, mus_JUSTICE, mus_GunSlinger], //Results Theme Tracks [shit, good, sick, perfect]
			["Shot Down", "It's Arright, Pardner", "JUSTICE", "JUSTICE",], //Results Theme Track Names (Must be a string, EX: "My Balls")
			["Kappa Nerd", "Kappa Nerd", "Kappa Nerd", "Kappa Nerd",], //Results Theme Track Composer(s) (Must be a string, EX: "Lord Beerus")
			[spr_LevelCard_IvySet, 1], //Results Portrait
			["stagecharivynormal",],
			[spr_CheckpointIvy, spr_RingIvyIcon, spr_RingIvyHand, spr_CharSelectIvyIcon, spr_IntroQuoteIvy, 1],
		],
	
	
	];

	global.SelectedPlayer = 0;
	global.SelectedPartner = 0;
	
	global.SelectedCostume = 0;
	global.SelectedPartCost = 0;

	global.ChooseCostume = false;

	global.PlayerNum = array_length(global.PlayerSelection);
	global.CostumeNum = array_length(global.PlayerSelection[global.SelectedPlayer][4]);
#endregion

#region ///-----RGB Shit-----///
	scr_CreateRBG();

	//Kane Shit
	changeColTimer = 0;
	changeColFrames = 300;
	changeColBlue = true;
	
	
	global.ColorBase = [
		[c_white, "col_White"],
		[c_ltgray, "col_LightGray"],
		[c_gray, "col_Gray"],
		[c_dkgray, "col_DarkGray"],
		[c_black, "col_Black"],
		[c_maroon, "col_Maroon"],
		[c_red, "col_Red"],
		[c_orange, "col_Orange"],
		[c_yellow, "col_Yellow"],
		[c_lime, "col_Lime"],
		[c_olive, "col_Olive"],
		[c_green, "col_Green"],
		[c_aqua, "col_Aqua"],
		[c_teal, "col_Teal"],
		[c_blue, "col_Blue"],
		[c_navy, "col_Navy"],
		[c_purple, "col_Purple"],
		[c_fuchsia, "col_Magenta"],
	]
#endregion

#region ///-----Dying BS-----///
	global.Health = 1000000;
	global.MaxHealth = 1000000;

	global.DeathCountdown = 120;
	global.GameOverCountdown = 180;

	//Player extra lives
	global.PlayerExtraLives = 3;
	global.CollectedLives = 0;
	
	global.Death = false;

	global.RespawnX = 0;
	global.RespawnY = 0;
#endregion

#region //Bruh
	global.ForceLine = 0;
	langCheck = 0;
	//show_debug_overlay(true);
#endregion

#region //Extra shit for the sake of initialization
	global.Opacity = 0;
	global.ThunderCountdown = 300;
#endregion

#region ///-----Jukebox-----///
	global.Jukebox = false;
	global.JukeboxLoop = false;
	global.JukeboxShuffle = false;
	global.JukeBoxChoice = 0;
	global.CustomJukeChoice = 0;
	
	global.CustomID = 0;
	
	global.JukeOptions = [
		{
			loop: false,
			shuffle: false,
		}
	]
	
	global.NewJukes = [
		
	]
	
	global.JukeboxPlaylist = [
		
	]
	
	global.CustomJukeboxPlaylist = [
		
	]
	
	global.CustomJukeShuffled = [
		
	]
#endregion

#region ///-----Options BS-----///
	global.optionsData = [
		{ //Audio Options
			master: 1, //Master Volume
			music: 1, //Music Volume
			sfx: 1, //SFX Volume
			txt: 1, //Text Volume
			ambience: 1, //Ambience Volume
			uniquePause: false, //Unique Pause Theme
			footStep: true, //Character Foot Steps
		},
	
		{ //Visual Options
			simpVFX: false, //Simplify VFX
			screenShake: true, //Screen Shake
			part: true, //Particles
			conDis: false, //Controller Display
			outline: true, //Character Outline
			squash: true, //Squash 'n' Stretch
			textSpd: 1, //Text Speed
			lang: 0, //Language
			vsync: false, //VSync
		},
	
		{ //Misc Options
			fullscrn: 0, //Fullscreen
			musTag: true, //Music Tag
			conRum: true, //Controller Rumble
			conType: 0, //Controller Type
			extCam: true, //Extended Camera
			speedrun: false, //Speedrun Timer
			FPS: true, //FPS
		},
		
		{ //Preferences Options
			colorCode: true, //Character Color-Coding
			changeColor: 0, //Change Base Color
			focusLoss: false, //Pause on Focus Loss
		},
		
		{ //Online Options
			discord: true,
			ghost: true,
		},

	]

	global.optionsControls = [
		///-----Speed & Menu-----///
	
		{ //Keyboard
			left: vk_left, //Left Key
			right: vk_right, //Right Key
			up: vk_up, //Up Key
			down: vk_down, //Down Key
	
			jump: "Z", //Jump Key
			act1: "X", //Action 1
			act2: "C", //Action 2
			act3: vk_space, //Action 3
			act4: "V", //Action 4
			act5: vk_lshift, //Action 5
			start: vk_enter, //Start
			select: vk_tab, //Select
		},
	
	
		{ //Controller
			sDead: 0.5, //Stick Deadzone
			tDead: 0.5, //Trigger Deadzone
	
			left: gp_padl, //Pad Left
			right: gp_padr, //Pad Right
			up: gp_padu, //Pad Up
			down: gp_padd, //Pad Down
	
			jump: gp_face1, //A Button
			act1: gp_face2, //B Button
			act2: gp_face3, //X Button
			act3: gp_shoulderr, //RB Button
			act4: gp_face4, //Y Button
			act5: gp_shoulderl, //LB Button
			start: gp_start, //Start Button
			select: gp_select, //Select Button
		},
		
		
		///-----Action-----///
	
		{ //Keyboard
			left: vk_left, //Left Key
			right: vk_right, //Right Key
			up: vk_up, //Up Key
			down: vk_down, //Down Key
	
			light: "X", //Light Attack
			medium: "C", //Medium Attack
			heavy: "V", //Heavy Attack
			jump: "Z", //Jump Key
			dash: vk_space, //Dash
			superDash: vk_lshift, //Super-Dash
			parry: "G", //Parry
			charge: "B", //Charge
		},
	
	
		{ //Controller	
			left: gp_padl, //Pad Left
			right: gp_padr, //Pad Right
			up: gp_padu, //Pad Up
			down: gp_padd, //Pad Down
	
			light: gp_face3, //X Button
			medium: gp_face4, //Y Button
			heavy: gp_face2, //B Button
			jump: gp_face1, //A Button
			dash: gp_shoulderrb, //LB Button
			superDash: gp_shoulderr, //Start Button
			parry: gp_shoulderl, //Select Button
			charge: gp_shoulderlb, //A Button
		},
	]
#endregion

#region ///-----More Save BS-----///
	global.statData = [ //Kinda pullin' an UNDERTALE/DELTARUNE with this one.

		{ //Player Data
			player_Name : "fs_Empty",
			player_TimeSeconds : 0,
			player_TimeMinutes : 0,
			player_TimeHours : 0,
	
			save_x : 0,
			save_y : 0,
			save_rm : "fs_Empty",
	
			player_Char : 0,
			player_Costume : 0,
			player_Sprite : spr_StageCharNone,
	
			partner_Char : -1,
			partner_Costume : 0,
	
			partner2_Char : -1,
			partner2_Costume : 0,
	
			player_ExtraLives : 0,
			player_Health : 0,
		},
	
		//Room Checking
	
		{ //Head
			head_Overworld2_Check1 : false,
			head_Overworld6_Check1 : false,
			head_Overworld7_Check1 : false,
			head_Overworld9_Check1 : false,
		}
	
	]
#endregion

#region ///-----Stickers-----///
	global.Stickers = [
		
	]
#endregion

#region //Rank System (Speed)
	global.StageName = 0;
	global.StageType = 0;
	global.StageNum = 0;
	global.MIND = false;
	global.Rank = 0;
	global.RankTime = 0;
	global.RankScore = 0;
	global.RankRings = 0;
	global.RankEnemies = 0;
	global.LevelForced = false;
	global.countUp = false;
	global.seconds = 0;
	global.minutes = 0;
	global.GameScore = 0;
	global.ScoreMult = 1;
	global.Rings = 0;
	global.EnemyCount = 0;
	global.CustomMus = false
	global.CustomMusic = noone;
	
	global.Secrets = 0;
	global.MusicSecret = false;
	global.FRankTime = 0;
	global.DRankTime = 0;
	global.CRankTime = 0;
	global.BRankTime = 0;
	global.ARankTime = 0;
	global.SRankTime = 0;
	
	global.DRankScore = 0;
	global.CRankScore = 0;
	global.BRankScore = 0;
	global.ARankScore = 0;
	global.SRankScore = 0;

	global.SpeedSelected = 0;

	global.speedStageData = 
	[
	
		//Mind Levels (I keep switchin' between "Mind" and "Head." I don't fuckin' know why.)
		{ //MIND Level 1
			stage_Name: "level_MIND", stage_Type: "freeplay_Level", stage_Desc: "freeplay_DescMind1", level_Num: 1, level_Icon: spr_LevelIconMind, stage_RM: rm_HeadSpeed1, levelForced: false,
		
			rankS_Time: 140, rankA_Time: 150, rankB_Time: 205, rankC_Time: 225, rankD_Time: 250, rankF_Time: 320,
			
			rankS_Score: 130000, rankA_Score: 100000, rankB_Score: 70000, rankC_Score: 40000, rankD_Score: 10000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 250,
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 32,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 0000000,
		
			locked: false, complete: false, mind: true, stage_Sprite: spr_LevelMindHead, level_Sprite: spr_Level1Head,
			
			musicTrack: mus_MyMind, musicTrackGirly: mus_MyMindGirly,
		
			requirement: "condit_StoryMode", record_File: "mind1_Ghost", folder_Name: "/mind1/",
		},
	
		{ //MIND Level 2
			stage_Name: "level_MIND", stage_Type: "freeplay_Level", stage_Desc: "freeplay_DescMind2", level_Num: 2, level_Icon: spr_LevelIconMind, stage_RM: rm_HeadSpeed2, levelForced: false,
		
			rankS_Time: 155, rankA_Time: 205, rankB_Time: 220, rankC_Time: 240, rankD_Time: 305, rankF_Time: 330,
			
			rankS_Score: 175000, rankA_Score: 125000, rankB_Score: 75000, rankC_Score: 50000, rankD_Score: 25000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 275,
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 50,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: false, complete: false, mind: true, stage_Sprite: spr_LevelMindHead, level_Sprite: spr_Level2Head,
			
			musicTrack: mus_MyMind, musicTrackGirly: mus_MyMindGirly,
		
			requirement: "condit_StoryMode", record_File: "mind2_Ghost", folder_Name: "/mind2/",
		},
		
		{ //MIND Level Boss
			stage_Name: "level_MIND", stage_Type: "freeplay_Level" + "freeplay_Boss", stage_Desc: "freeplay_DescMindBoss", level_Num: "", level_Icon: spr_LevelIconMind, stage_RM: rm_HeadSpeedBoss, levelForced: true,
		
			rankS_Time: 140, rankA_Time: 150, rankB_Time: 205, rankC_Time: 225, rankD_Time: 250, rankF_Time: 320,
			
			rankS_Score: 250000, rankA_Score: 200000, rankB_Score: 175000, rankC_Score: 150000, rankD_Score: 100000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: false, complete: false, mind: true, stage_Sprite: spr_LevelMindHead, level_Sprite: spr_LevelBossHead,
			
			musicTrack: mus_DisturbingMind, musicTrackGirly: mus_DisturbingMindGirly, 
		
			requirement: "condit_StoryMode", record_File: "mindBoss_Ghost", folder_Name: "/mind_boss/",
		},
		
		{ //MIND Bonus 1
			stage_Name: "level_MIND", stage_Type: "freeplay_Bonus", stage_Desc: "freeplay_DescMindBon1", level_Num: 1, level_Icon: spr_LevelIconMind, stage_RM: rm_HeadSpeedBonus1, levelForced: false,
		
			rankS_Time: 115, rankA_Time: 125, rankB_Time: 140, rankC_Time: 200, rankD_Time: 225, rankF_Time: 255,
		
			rankS_Score: 250000, rankA_Score: 200000, rankB_Score: 175000, rankC_Score: 150000, rankD_Score: 100000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: false, complete: false, mind: true, stage_Sprite: spr_LevelMindHead, level_Sprite: spr_LevelBonus1Head,
			
			musicTrack: mus_MyMind, musicTrackGirly: mus_MyMindGirly,
		
			requirement: "condit_CRankMind", record_File: "mindBonus1_Ghost", folder_Name: "/mind_b1/",
		},
		
		{ //MIND Bonus 2
			stage_Name: "level_MIND", stage_Type: "freeplay_Bonus", stage_Desc: "freeplay_DescMindBon2", level_Num: 2, level_Icon: spr_LevelIconMind, stage_RM: rm_HeadSpeedBonus2, levelForced: false,
		
			rankS_Time: 114, rankA_Time: 119, rankB_Time: 124, rankC_Time: 129, rankD_Time: 134, rankF_Time: 139,
			
			rankS_Score: 150000, rankA_Score: 100000, rankB_Score: 75000, rankC_Score: 50000, rankD_Score: 25000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: true, complete: false, mind: true, stage_Sprite: spr_LevelMindHead, level_Sprite: spr_LevelBonus2Head,
			
			musicTrack: mus_MyMind, musicTrackGirly: mus_MyMindGirly, 
		
			requirement: "condit_CRankMind", record_File: "mindBonus2_Ghost", folder_Name: "/mind_b2/",
		},
		
		{ //HOMETOWN (DAY) Level 1
			stage_Name: "level_OTD", stage_Type: "freeplay_Level", stage_Desc: "freeplay_DescOTD1", level_Num: 1, level_Icon: spr_LevelIconOTD, stage_RM: rm_HometownDSpeed1, levelForced: false,
		
			rankS_Time: 215, rankA_Time: 225, rankB_Time: 240, rankC_Time: 300, rankD_Time: 325, rankF_Time: 350,
			
			rankS_Score: 360000, rankA_Score: 300000, rankB_Score: 260000, rankC_Score: 200000, rankD_Score: 160000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: false, complete: false, mind: false, stage_Sprite: spr_LevelOthertownDay, level_Sprite: spr_Level1Norm,
			
			musicTrack: mus_Sunlight, musicTrackGirly: mus_SunlightGirly, 
		
			requirement: "condit_StoryMode", record_File: "OTD1_Ghost", folder_Name: "/othertown_day1/",
		},
		
		{ //HOMETOWN (DAY) Level 2
			stage_Name: "level_OTD", stage_Type: "freeplay_Level", stage_Desc: "freeplay_DescOTD2", level_Num: 2, level_Icon: spr_LevelIconOTD, stage_RM: rm_HometownDSpeed2, levelForced: false,
		
			rankS_Time: 114, rankA_Time: 119, rankB_Time: 124, rankC_Time: 129, rankD_Time: 134, rankF_Time: 139,
			
			rankS_Score: 150000, rankA_Score: 100000, rankB_Score: 75000, rankC_Score: 50000, rankD_Score: 25000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: true, complete: false, mind: false, stage_Sprite: spr_LevelOthertownDay, level_Sprite: spr_Level2Norm,
			
			musicTrack: mus_Sunlight, musicTrackGirly: mus_SunlightGirly, 
		
			requirement: "condit_Available", record_File: "OTD2_Ghost", folder_Name: "/othertown_day2/",
		},
		
		{ //HOMETOWN (DAY) Level 3
			stage_Name: "level_OTD", stage_Type: "freeplay_Level", stage_Desc: "freeplay_DescOTD3", level_Num: 3, level_Icon: spr_LevelIconOTD, stage_RM: rm_HeadSpeedBonus1, levelForced: false,
		
			rankS_Time: 114, rankA_Time: 119, rankB_Time: 124, rankC_Time: 129, rankD_Time: 134, rankF_Time: 139,
			
			rankS_Score: 150000, rankA_Score: 100000, rankB_Score: 75000, rankC_Score: 50000, rankD_Score: 25000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: true, complete: false, mind: false, stage_Sprite: spr_LevelMindHead, level_Sprite: spr_Level3Norm,
			
			musicTrack: mus_Sunlight, musicTrackGirly: mus_SunlightGirly, 
		
			requirement: "condit_Available", record_File: "OTD3_Ghost", folder_Name: "/othertown_day3/",
		},
		
		{ //HOMETOWN (NIGHT) Level 1
			stage_Name: "level_OTN", stage_Type: "freeplay_Level", stage_Desc: "freeplay_DescOTN1", level_Num: 1, level_Icon: spr_LevelIconOTN, stage_RM: rm_HometownNSpeed1, levelForced: false,
		
			rankS_Time: 145, rankA_Time: 155, rankB_Time: 210, rankC_Time: 230, rankD_Time: 255, rankF_Time: 325,
			
			rankS_Score: 250000, rankA_Score: 200000, rankB_Score: 175000, rankC_Score: 150000, rankD_Score: 100000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: false, complete: false, mind: false, stage_Sprite: spr_LevelOthertownNight, level_Sprite: spr_Level1Norm,
			
			musicTrack: mus_Moonlight, musicTrackGirly: mus_MoonlightGirly, 
		
			requirement: "condit_StoryMode", record_File: "OTN1_Ghost", folder_Name: "/othertown_night1/",
		},
		
		{ //HOMETOWN (NIGHT) Level 2
			stage_Name: "level_OTN", stage_Type: "freeplay_Level", stage_Desc: "freeplay_DescOTN2", level_Num: 2, level_Icon: spr_LevelIconOTN, stage_RM: rm_HometownNSpeed1, levelForced: false,
		
			rankS_Time: 114, rankA_Time: 119, rankB_Time: 124, rankC_Time: 129, rankD_Time: 134, rankF_Time: 139,
			
			rankS_Score: 150000, rankA_Score: 100000, rankB_Score: 75000, rankC_Score: 50000, rankD_Score: 25000,
			
			rings: 0, rings_Rank: 0, rankS_Ring: 55, rankA_Ring: 35, rankB_Ring: 20, rankC_Ring: 10, rankD_Ring: 5, 
			
			enemies: 0, enemy_Rank: 0, rankS_Enemy: 55, rankA_Enemy: 35, rankB_Enemy: 20, rankC_Enemy: 10, rankD_Enemy: 5,
			
			jsrSecrets: [false, false, false, false, false], musicSecret: false,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
			
			player_CharRings: -1, player_SpriteRings: spr_StageCharNone, player_CostumeRings: 0,
			
			player_CharEnemy: -1, player_SpriteEnemy: spr_StageCharNone, player_CostumeEnemy: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 00000,
		
			locked: true, complete: false, mind: false, stage_Sprite: spr_LevelOthertownNight, level_Sprite: spr_Level2Norm,
			
			musicTrack: mus_Moonlight, musicTrackGirly: mus_MoonlightGirly, 
		
			requirement: "condit_Available", record_File: "OTN2_Ghost", folder_Name: "/othertown_night2/",
		},
	
	]
#endregion

#region //Rank System (Action)
	global.ActionPlayer = obj_ActionPlayer;
	global.ActionEnemy = obj_ActionPlayer;
	
	global.ActionSelected = 0;
	
	global.actionStageData = 
	[
		{ //VS. Roxxane
			stage_Name: "VS. ", stage_Type: "ROXXANE", stage_Desc: "freeplay_DescOTD1", stage_RM: rm_HeadSpeed1, levelForced: false,
		
			rankS_Time: 115, rankA_Time: 125, rankB_Time: 140, rankC_Time: 200, rankD_Time: 225, rankF_Time: 255,
			
			rankS_Score: 400000, rankA_Score: 300000, rankB_Score: 200000, rankC_Score: 150000, rankD_Score: 100000,
			
			player_Char: -1, player_Sprite: spr_StageCharNone, player_Costume: 0,
			
			player_CharTime: -1, player_SpriteTime: spr_StageCharNone, player_CostumeTime: 0,
			
			player_CharScore: -1, player_SpriteScore: spr_StageCharNone, player_CostumeScore: 0,
		
			rank: 0, rankTime: 0, totalTime: 99999, rankScore: 0, minutes: 99, seconds: 59.99, gameScore: 0000000,
		
			locked: false, complete: false, mind: true, stage_Sprite: spr_LevelMindHead, level_Sprite: spr_Level1Head, 
			
			musicTrack: mus_Pendejo, musicTrackGirly: mus_Pendejo,
		
			requirement: "condit_Unavailable", 
		},
	]
#endregion

#region //Camera Zoom
	global.CamWidth = 768;
	global.CamHeight = 432;
	
	global.CamSafeArea = 1050;
#endregion


//Rank System (Test)
global.stageData = {
	
	//Test Levels
    test_Level : { stage_Name: 0, stage_Type: 0, level_Num: 1, player_Char : -1, rank: 0, minutes: 99, seconds: 59 },
	test_Level2 : { stage_Name: 0, stage_Type: 0, level_Num: 2, player_Char : -1, rank: 0, minutes: 99, seconds: 59 },
	
}