if !global.SongTag {
	instance_destroy();
}


///-----Track names based on BGM-----///

#region /////--------Game Over--------/////
	///-----It Takes a Lot to Accept Reality-----///
	if audio_is_playing(mus_AcceptReality) {
		songName = scr_LocalText("mus_Accept");
		songCredits = "Kappa Nerd";
	}
#endregion


#region /////--------Misc--------/////
	///-----Fading Dreams-----///
	if audio_is_playing(mus_FadingDreams) {
		songName = scr_LocalText("mus_Fade");
		songCredits = "Kappa Nerd";
	}
#endregion


#region /////--------Title--------/////
	///-----Solemn-----///
	if audio_is_playing(mus_Solemn) {
		songName = scr_LocalText("mus_Solemn");
		songCredits = "Kappa Nerd";
	}

	///-----Wakey-Wakey-----///
	if audio_is_playing(mus_WakeyWakey) {
		songName = scr_LocalText("mus_Wakey");
		songCredits = "Kappa Nerd";
	}

	///-----File Select-----///
	if audio_is_playing(mus_CestLaVie) {
		songName = scr_LocalText("mus_Cest");
		songCredits = "Kappa Nerd";
	}
	
	if audio_is_playing(mus_MindnBody) {
		songName = scr_LocalText("mus_SOUL");
		songCredits = "Kappa Nerd";
	}
#endregion


#region /////--------Freeplay / Pause--------/////
	///-----Waitin' (Kappa Mvt.)-----///
	if audio_is_playing(mus_FreeplayKMvt) or audio_is_playing(mus_Waitin) {
		songName = scr_LocalText("mus_FKap");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}

	///-----No Rush (Sarah Mvt.)-----///
	if audio_is_playing(mus_FreeplaySMvt) or audio_is_playing(mus_NoRush) {
		songName = scr_LocalText("mus_FSar");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}
	
	///-----Arpeggio (Lone Mvt.)-----///
	if audio_is_playing(mus_FreeplayLMvt) or audio_is_playing(mus_Arpeggio) {
		songName = scr_LocalText("mus_FLon");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}

	///-----Euro-Step (Neegi Mvt.)-----///
	if audio_is_playing(mus_FreeplayNMvt) or audio_is_playing(mus_EurobeatCheck) {
		songName = scr_LocalText("mus_FNee");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}

	///-----Star-Bright (Cloee Mvt.)-----///
	if audio_is_playing(mus_FreeplayCMvt) or audio_is_playing(mus_StarBright) {
		songName = scr_LocalText("mus_FClo");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}

	///-----Flamerunner (Akira Mvt.)-----///
	if audio_is_playing(mus_FreeplayAMvt) or audio_is_playing(mus_Flamerunner) {
		songName = scr_LocalText("mus_FAki");
		songCredits = "Kappa Nerd";
		songLength = "0:36";
	}

	///-----Knuckleblaster (Taylor Mvt.)-----///
	if audio_is_playing(mus_FreeplayTMvt) or audio_is_playing(mus_Knuckleblaster) {
		songName = scr_LocalText("mus_FTay");
		songCredits = "Kappa Nerd";
		songLength = "0:36";
	}

	///-----Sharpshooter (Ayana Mvt.)-----///
	if audio_is_playing(mus_FreeplayAYMvt) or audio_is_playing(mus_Sharpshooter) {
		songName = scr_LocalText("mus_FAya");
		songCredits = "Kappa Nerd";
		songLength = "0:24";
	}
	
	///-----Perra-Culo (Roxxane Mvt.)-----///
	if audio_is_playing(mus_FreeplayRXMvt) or audio_is_playing(mus_PerraCulo) {
		songName = scr_LocalText("mus_FRox");
		songCredits = "Kappa Nerd";
		songLength = "0:36";
	}
	
	///-----Waiting (Lucifer Mvt.)-----///
	if audio_is_playing(mus_FreeplayLuMvt) or audio_is_playing(mus_Waiting) {
		songName = scr_LocalText("mus_FLuc");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}

	///-----Hurry Up (Rush Mvt.)-----///
	if audio_is_playing(mus_FreeplayRMvt) or audio_is_playing(mus_HurryUp) {
		songName = scr_LocalText("mus_FRus");
		songCredits = "Kappa Nerd";
		songLength = "0:36";
	}

	///-----Black Arms (Edge Mvt.)-----///
	if audio_is_playing(mus_FreeplayEMvt) or audio_is_playing(mus_BlackArms) {
		songName = scr_LocalText("mus_Edg");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}

	///-----Holster (Ivy Mvt.)-----///
	if audio_is_playing(mus_FreeplayIMvt) or audio_is_playing(mus_Holster) {
		songName = scr_LocalText("mus_FIvy");
		songCredits = "Kappa Nerd";
		songLength = "0:48";
	}
#endregion


#region /////--------Character Select--------/////
	///-----Funk 'n' Rush-----///
	if audio_is_playing(mus_FunknRushNew) {
		songName = scr_LocalText("mus_Funk");
		songCredits = "Kappa Nerd";
		songLength = "2:03";
	}
#endregion


#region /////--------MIND--------/////
	///-----DISCONNECTED-----///
	if audio_is_playing(mus_DISCONNECTED) {
		songName = scr_LocalText("mus_Dis"); //I cannot believe I misspelled this shit and didn't realize until 2 months later. (It's the end of September by the time I'm typing this.)
		songCredits = "Kappa Nerd";
		songLength = "2:17";
	}

	///-----Lost Reason-----///
	if audio_is_playing(mus_LostReason) {
		songName = scr_LocalText("mus_Lost");
		songCredits = "Kappa Nerd";
		songLength = "1:52";
	}

	///-----Scratchin'-----///
	if audio_is_playing(mus_Scratchin) {
		songName = "Scratchin'";
		songCredits = "Kappa Nerd";
		songLength = "0:53";
	}

	///-----My Mind-----///
	if audio_is_playing(mus_MyMind) {
		songName = scr_LocalText("mus_Mind");
		songCredits = "Kappa Nerd";
		songLength = "2:11";
	}

	///-----My Mind (Girly Mix)-----///
	if audio_is_playing(mus_MyMindGirly) {
		songName = scr_LocalText("mus_MindG");
		songCredits = "Kappa Nerd";
		songLength = "2:11";
	}


	///-----Disturbing the Mind-----///
	if audio_is_playing(mus_DisturbingMind) {
		songName = scr_LocalText("mus_Dist");
		songCredits = "Kappa Nerd";
		songLength = "2:19";
	}

	///-----Disturbing the Mind (Girly Mix)-----///
	if audio_is_playing(mus_DisturbingMindGirly) {
		songName = scr_LocalText("mus_Dist");
		songCredits = "Kappa Nerd";
		songLength = "2:19";
	}
#endregion


#region /////--------Hometown--------/////
	///-----New Night, New Day-----///
	if audio_is_playing(mus_NewDay) {
		songName = scr_LocalText("mus_NewDay");
		songCredits = "Kappa Nerd";
		songLength = "3:16";
	}
	
	
	///-----Sunlight-----///
	if audio_is_playing(mus_Sunlight) {
		songName = scr_LocalText("mus_Sunlight");
		songCredits = "Kappa Nerd";
		songLength = "2:33";
	}
	
	
	///-----Sunlight (Girly Mix)-----///
	if audio_is_playing(mus_SunlightGirly) {
		songName = scr_LocalText("mus_SunlightG");
		songCredits = "Kappa Nerd";
		songLength = "2:33";
	}


	///-----New Day, New Night-----///
	if audio_is_playing(mus_NewNight) {
		songName = scr_LocalText("mus_NewNight");
		songCredits = "Kappa Nerd";
		songLength = "3:03";
	}


	///-----Moonlight-----///
	if audio_is_playing(mus_Moonlight) {
		songName = scr_LocalText("mus_Moonlight");
		songCredits = "Kappa Nerd";
		songLength = "2:16";
	}


	///-----Moonlight (Girly Mix)-----///
	if audio_is_playing(mus_MoonlightGirly) {
		songName = scr_LocalText("mus_MoonlightG");
		songCredits = "Kappa Nerd";
		songLength = "2:16";
	}
#endregion


#region /////--------Results Themes--------/////
	#region ///-----Kappa-----///
		//Shit
		if audio_is_playing(mus_NextTime) {
			songName = scr_LocalText("mus_NextTime");
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}

		//Good
		if audio_is_playing(mus_StandProud) {
			songName = scr_LocalText("mus_Stand");
			songCredits = "Kappa Nerd";
			songLength = "0:48";
		}

		//Sick
		if audio_is_playing(mus_HonorarySonic) {
			songName = scr_LocalText("mus_Sonic");
			songCredits = "Kappa Nerd";
			songLength = "0:47";
		}
	#endregion


	#region ///-----Sarah-----///
		//Shit
		if audio_is_playing(mus_DidYourBest) {
			songName = scr_LocalText("mus_YourBest");
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}

		//Good
		if audio_is_playing(mus_KnewYouHadIt) {
			songName = scr_LocalText("mus_InYou");
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}

		//Sick
		if audio_is_playing(mus_HeartsAround) {
			songName = scr_LocalText("mus_Hearts");
			songCredits = "Kappa Nerd";
			songLength = "1:12";
		}
	#endregion


	#region ///-----Lone-----///
		//Shit
		if audio_is_playing(mus_Diminuendo) {
			songName = scr_LocalText("mus_Diminuendo");
			songCredits = "Kappa Nerd";
			songLength = "0:43";
		}
		
		//Good
		if audio_is_playing(mus_Allegro) {
			songName = scr_LocalText("mus_Allegro");
			songCredits = "Kappa Nerd";
			songLength = "0:43";
		}
		
		//Sick
		if audio_is_playing(mus_Crescendo) {
			songName = scr_LocalText("mus_Crescendo");
			songCredits = "Kappa Nerd";
			songLength = "0:48";
		}
	#endregion
	

	#region ///-----Neegi-----///
		//Sick
		if audio_is_playing(mus_HonorWithin) {
			songName = "Honor Within";
			songCredits = "Kappa Nerd";
			songLength = "0:24";
		}
	#endregion


	#region ///-----Cloee-----///
		//Shit
		if audio_is_playing(mus_NotAllBad) {
			songName = "It's Not All Bad";
			songCredits = "Kappa Nerd";
			songLength = "0:55";
		}
	#endregion
	

	#region ///-----Akira-----///
		//Shit
		if audio_is_playing(mus_Diminished) {
			songName = scr_LocalText("mus_Diminished");
			songCredits = "Kappa Nerd";
			songLength = "0:51";
		}
		
		//Good
		if audio_is_playing(mus_Lighter) {
			songName = scr_LocalText("mus_Lighter");
			songCredits = "Kappa Nerd";
			songLength = "0:47";
		}
		
		//Sick
		if audio_is_playing(mus_LitUp2HOT) {
			songName = scr_LocalText("mus_FeelinNice");
			songCredits = "Kappa Nerd";
			songLength = "1:06";
		}
	#endregion


	#region ///-----Taylor-----///
		//Sick
		if audio_is_playing(mus_FeelDaWind) {
			songName = "Feel Da Wind";
			songCredits = "Kappa Nerd";
			songLength = "0:50";
		}
	#endregion


	#region ///-----Ayana-----///
		//Sick
		if audio_is_playing(mus_D4NG3R) {
			songName = "D-4-N-G-3-R";
			songCredits = "Kappa Nerd";
			songLength = "0:47";
		}
	#endregion


	#region ///-----Rush-----///
		//Shit
		if audio_is_playing(mus_KiddinMe) {
			songName = scr_LocalText("mus_Kiddin");
			songCredits = "Kappa Nerd";
			songLength = "0:48";
		}

		//Good
		if audio_is_playing(mus_NotBad) {
			songName = scr_LocalText("mus_NotBad");
			songCredits = "Kappa Nerd";
			songLength = "0:41";
		}

		//Sick
		if audio_is_playing(mus_TalkinAbout) {
			songName = scr_LocalText("mus_Talkin");
			songCredits = "Kappa Nerd";
			songLength = "1:08";
		}
	#endregion


	#region ///-----Edge-----///
		//Shit
		if audio_is_playing(mus_BrokenChaos) {
			songName = "Broken Chaos";
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}
	#endregion


	#region ///-----Roxxane-----///
		//Shit
		if audio_is_playing(mus_HijoDePuta) {
			songName = "¡HIJO DE PUTA!";
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}
		
		//Shit
		if audio_is_playing(mus_JoderSi) {
			songName = "¡JODER SÍ!";
			songCredits = "Kappa Nerd";
			songLength = "0:41";
		}
		
	#endregion
	
	
	#region ///-----Lucifer-----///
		//Shit
		if audio_is_playing(mus_BeenBetter) {
			songName = scr_LocalText("mus_BeenBetter");
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}

		//Good
		if audio_is_playing(mus_YouStrong) {
			songName = scr_LocalText("mus_YouStrong");
			songCredits = "Kappa Nerd";
			songLength = "1:36";
		}

		//Sick
		if audio_is_playing(mus_HonoraryBlaze) {
			songName = scr_LocalText("mus_Blaze");
			songCredits = "Kappa Nerd";
			songLength = "0:55";
		}
	#endregion
	

	#region ///-----Ivy-----///
		//Shit
		if audio_is_playing(mus_ShotDown) {
			songName = scr_LocalText("mus_Shot");
			songCredits = "Kappa Nerd";
			songLength = "0:32";
		}

		//Good
		if audio_is_playing(mus_ArrightPardner) {
			songName = scr_LocalText("mus_Pardner");
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}

		//Sick
		if audio_is_playing(mus_JUSTICE) {
			songName = scr_LocalText("mus_JUSTICE");
			songCredits = "Kappa Nerd";
			songLength = "1:04";
		}
	#endregion
	
	
#endregion
