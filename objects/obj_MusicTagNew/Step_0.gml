if !global.SongTag {
	instance_destroy();
}


///-----Track names based on BGM-----///

#region /////--------Game Over--------/////
	///-----It Takes a Lot to Accept Reality-----///
	if audio_is_playing(mus_AcceptReality) {
		songName = scr_LocalText("mus_Accept");
		songCredits = scr_LocalText("comp_Nerd");
	}
#endregion


#region /////--------Misc--------/////
	///-----Fading Dreams-----///
	if audio_is_playing(mus_FadingDreams) {
		songName = scr_LocalText("mus_Fade");
		songCredits = scr_LocalText("comp_Nerd");
	}
#endregion


#region /////--------Title--------/////
	///-----MINDWAVE-----///
	if audio_is_playing(mus_MINDWAVE) {
		songName = scr_LocalText("mus_MINDWAVE");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	if audio_is_playing(mus_MINDWAVE_A) {
		songName = scr_LocalText("mus_MINDWAVE2");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Solemn-----///
	if audio_is_playing(mus_Solemn) {
		songName = scr_LocalText("mus_Solemn");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Wakey-Wakey-----///
	if audio_is_playing(mus_WakeyWakey) {
		songName = scr_LocalText("mus_Wakey");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----File Select-----///
	if audio_is_playing(mus_CestLaVie) {
		songName = scr_LocalText("mus_Cest");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	if audio_is_playing(mus_MindnBody) {
		songName = scr_LocalText("mus_MindBody");
		songCredits = scr_LocalText("comp_Nerd");
	}
#endregion


#region /////--------Menus--------/////
	///-----Wrap It Up (Kappa Mvt.)-----///
	if audio_is_playing(mus_WrapItUpK) {
		songName = scr_LocalText("mus_WrapK");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Wrap It Up (Lucifer Mvt.)-----///
	if audio_is_playing(mus_WrapItUpL) {
		songName = scr_LocalText("mus_WrapL");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Unwind a Lil' Bit, Yeah?-----///
	if audio_is_playing(mus_UnwindaBit) {
		songName = scr_LocalText("mus_Unwind");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Backstreet Newgrounds-----///
	if audio_is_playing(mus_Backstreet) {
		songName = scr_LocalText("mus_Backstreet");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Funk 'n' Rush-----///
	if audio_is_playing(mus_FunknRushNew) {
		songName = scr_LocalText("mus_Funk");
		songCredits = scr_LocalText("comp_Nerd");
	}
#endregion


#region /////--------Freeplay / Pause--------/////
	///-----Waitin' (Kappa Mvt.)-----///
	if audio_is_playing(mus_FreeplayKMvt) or audio_is_playing(mus_Waitin) {
		songName = scr_LocalText("mus_FKap");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----No Rush (Sarah Mvt.)-----///
	if audio_is_playing(mus_FreeplaySMvt) or audio_is_playing(mus_NoRush) {
		songName = scr_LocalText("mus_FSar");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Arpeggio (Lone Mvt.)-----///
	if audio_is_playing(mus_FreeplayLMvt) or audio_is_playing(mus_Arpeggio) {
		songName = scr_LocalText("mus_FLon");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Fighting Glove (Brock Mvt.)-----///
	if audio_is_playing(mus_FreeplayBMvt) or audio_is_playing(mus_Hajime) {
		songName = scr_LocalText("mus_FBro");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Euro-Step (Neegi Mvt.)-----///
	if audio_is_playing(mus_FreeplayNMvt) or audio_is_playing(mus_EurobeatCheck) {
		songName = scr_LocalText("mus_FNee");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Star-Bright (Cloee Mvt.)-----///
	if audio_is_playing(mus_FreeplayCMvt) or audio_is_playing(mus_StarBright) {
		songName = scr_LocalText("mus_FClo");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Flamerunner (Akira Mvt.)-----///
	if audio_is_playing(mus_FreeplayAMvt) or audio_is_playing(mus_Flamerunner) {
		songName = scr_LocalText("mus_FAki");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Knuckleblaster (Taylor Mvt.)-----///
	if audio_is_playing(mus_FreeplayTMvt) or audio_is_playing(mus_Knuckleblaster) {
		songName = scr_LocalText("mus_FTay");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Sharpshooter (Ayana Mvt.)-----///
	if audio_is_playing(mus_FreeplayAYMvt) or audio_is_playing(mus_Sharpshooter) {
		songName = scr_LocalText("mus_FAya");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Perra-Culo (Roxxane Mvt.)-----///
	if audio_is_playing(mus_FreeplayRXMvt) or audio_is_playing(mus_PerraCulo) {
		songName = scr_LocalText("mus_FRox");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	///-----Waiting (Lucifer Mvt.)-----///
	if audio_is_playing(mus_FreeplayLuMvt) or audio_is_playing(mus_Waiting) {
		songName = scr_LocalText("mus_FLuc");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Hurry Up (Rush Mvt.)-----///
	if audio_is_playing(mus_FreeplayRMvt) or audio_is_playing(mus_HurryUp) {
		songName = scr_LocalText("mus_FRus");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Black Arms (Edge Mvt.)-----///
	if audio_is_playing(mus_FreeplayEMvt) or audio_is_playing(mus_BlackArms) {
		songName = scr_LocalText("mus_Edg");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Holster (Ivy Mvt.)-----///
	if audio_is_playing(mus_FreeplayIMvt) or audio_is_playing(mus_Holster) {
		songName = scr_LocalText("mus_FIvy");
		songCredits = scr_LocalText("comp_Nerd");
	}
#endregion


#region /////--------MIND--------/////
	///-----DISCONNECTED-----///
	if audio_is_playing(mus_DISCONNECTED) {
		songName = scr_LocalText("mus_Dis"); //I cannot believe I misspelled this shit and didn't realize until 2 months later. (It's the end of September by the time I'm typing this.)
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Lost Reason-----///
	if audio_is_playing(mus_LostReason) {
		songName = scr_LocalText("mus_Lost");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Scratchin'-----///
	if audio_is_playing(mus_Scratchin) {
		songName = "Scratchin'";
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----My Mind-----///
	if audio_is_playing(mus_MyMind) {
		songName = scr_LocalText("mus_Mind");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----My Mind (Girly Mix)-----///
	if audio_is_playing(mus_MyMindGirly) {
		songName = scr_LocalText("mus_MindG");
		songCredits = scr_LocalText("comp_Nerd");
	}


	///-----Disturbing the Mind-----///
	if audio_is_playing(mus_DisturbingMind) {
		songName = scr_LocalText("mus_Dist");
		songCredits = scr_LocalText("comp_Nerd");
	}

	///-----Disturbing the Mind (Girly Mix)-----///
	if audio_is_playing(mus_DisturbingMindGirly) {
		songName = scr_LocalText("mus_Dist");
		songCredits = scr_LocalText("comp_Nerd");
	}
#endregion


#region /////--------Hometown--------/////
	///-----New Night, New Day-----///
	if audio_is_playing(mus_NewDay) {
		songName = scr_LocalText("mus_NewDay");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	
	///-----Sunlight-----///
	if audio_is_playing(mus_Sunlight) {
		songName = scr_LocalText("mus_Sunlight");
		songCredits = scr_LocalText("comp_Nerd");
	}
	
	
	///-----Sunlight (Girly Mix)-----///
	if audio_is_playing(mus_SunlightGirly) {
		songName = scr_LocalText("mus_SunlightG");
		songCredits = scr_LocalText("comp_Nerd");
	}


	///-----New Day, New Night-----///
	if audio_is_playing(mus_NewNight) {
		songName = scr_LocalText("mus_NewNight");
		songCredits = scr_LocalText("comp_Nerd");
	}


	///-----Moonlight-----///
	if audio_is_playing(mus_Moonlight) {
		songName = scr_LocalText("mus_Moonlight");
		songCredits = scr_LocalText("comp_Nerd");
	}


	///-----Moonlight (Girly Mix)-----///
	if audio_is_playing(mus_MoonlightGirly) {
		songName = scr_LocalText("mus_MoonlightG");
		songCredits = scr_LocalText("comp_Nerd");
	}
#endregion


#region /////--------Results Themes--------/////
	#region ///-----Kappa-----///
		//Shit
		if audio_is_playing(mus_NextTime) {
			songName = scr_LocalText("mus_NextTime");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Good
		if audio_is_playing(mus_StandProud) {
			songName = scr_LocalText("mus_Stand");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Sick
		if audio_is_playing(mus_HonorarySonic) {
			songName = scr_LocalText("mus_Sonic");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion


	#region ///-----Sarah-----///
		//Shit
		if audio_is_playing(mus_DidYourBest) {
			songName = scr_LocalText("mus_YourBest");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Good
		if audio_is_playing(mus_KnewYouHadIt) {
			songName = scr_LocalText("mus_InYou");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Sick
		if audio_is_playing(mus_HeartsAround) {
			songName = scr_LocalText("mus_Hearts");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion


	#region ///-----Lone-----///
		//Shit
		if audio_is_playing(mus_Diminuendo) {
			songName = scr_LocalText("mus_Diminuendo");
			songCredits = scr_LocalText("comp_Nerd");
		}
		
		//Good
		if audio_is_playing(mus_Allegro) {
			songName = scr_LocalText("mus_Allegro");
			songCredits = scr_LocalText("comp_Nerd");
		}
		
		//Sick
		if audio_is_playing(mus_Crescendo) {
			songName = scr_LocalText("mus_Crescendo");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion
	
	
	#region ///-----Brock-----///
		//Shit
		if audio_is_playing(mus_PulledPunches) {
			songName = scr_LocalText("mus_PulledPunches");
			songCredits = scr_LocalText("comp_Nerd");
		}
	
		//Sick
		if audio_is_playing(mus_Fisticuffs) {
			songName = scr_LocalText("mus_Fisticuffs");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion
	

	#region ///-----Neegi-----///
		//Sick
		if audio_is_playing(mus_HonorWithin) {
			songName = scr_LocalText("mus_HonorWithin");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion


	#region ///-----Cloee-----///
		//Shit
		if audio_is_playing(mus_NotAllBad) {
			songName = scr_LocalText("comp_NotAllBad");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion
	

	#region ///-----Akira-----///
		//Shit
		if audio_is_playing(mus_Diminished) {
			songName = scr_LocalText("mus_Diminished");
			songCredits = scr_LocalText("comp_Nerd");
		}
		
		//Good
		if audio_is_playing(mus_Lighter) {
			songName = scr_LocalText("mus_Lighter");
			songCredits = scr_LocalText("comp_Nerd");
		}
		
		//Sick
		if audio_is_playing(mus_LitUp2HOT) {
			songName = scr_LocalText("mus_FeelinNice");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion


	#region ///-----Taylor-----///
		//Sick
		if audio_is_playing(mus_FeelDaWind) {
			songName = scr_LocalText("comp_FeelDaWin");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion


	#region ///-----Ayana-----///
		//Playmate
		if audio_is_playing(mus_Playmate) {
			songName = scr_LocalText("comp_Playmate");
			songCredits = scr_LocalText("comp_Nerd");
		}
	
		//Sick
		if audio_is_playing(mus_D4NG3R) {
			songName = scr_LocalText("comp_D4NG3R");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion


	#region ///-----Roxxane-----///
		//Shit
		if audio_is_playing(mus_HijoDePuta) {
			songName = scr_LocalText("comp_DePuta");
			songCredits = scr_LocalText("comp_Nerd");
		}
		
		//Sick
		if audio_is_playing(mus_JoderSi) {
			songName = scr_LocalText("comp_JoderSi");
			songCredits = scr_LocalText("comp_Nerd");
		}
		
	#endregion
	
	
	#region ///-----Lucifer-----///
		//Shit
		if audio_is_playing(mus_BeenBetter) {
			songName = scr_LocalText("mus_BeenBetter");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Good
		if audio_is_playing(mus_YouStrong) {
			songName = scr_LocalText("mus_YouStrong");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Sick
		if audio_is_playing(mus_HonoraryBlaze) {
			songName = scr_LocalText("mus_Blaze");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion
	
	
	#region ///-----Rush-----///
		//Shit
		if audio_is_playing(mus_KiddinMe) {
			songName = scr_LocalText("mus_Kiddin");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Good
		if audio_is_playing(mus_NotBad) {
			songName = scr_LocalText("mus_NotBad");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Sick
		if audio_is_playing(mus_TalkinAbout) {
			songName = scr_LocalText("mus_Talkin");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion


	#region ///-----Edge-----///
		//Shit
		if audio_is_playing(mus_BrokenChaos) {
			songName = scr_LocalText("comp_BrokenChaos");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion
	

	#region ///-----Ivy-----///
		//Shit
		if audio_is_playing(mus_ShotDown) {
			songName = scr_LocalText("mus_Shot");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Good
		if audio_is_playing(mus_ArrightPardner) {
			songName = scr_LocalText("mus_Pardner");
			songCredits = scr_LocalText("comp_Nerd");
		}

		//Sick
		if audio_is_playing(mus_JUSTICE) {
			songName = scr_LocalText("mus_JUSTICE");
			songCredits = scr_LocalText("comp_Nerd");
		}
	#endregion
	
	
#endregion
