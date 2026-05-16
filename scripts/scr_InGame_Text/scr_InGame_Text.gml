// @param text_id
function scr_game_text(_text_id) { //("<" = Color) ("<~" = Wavy) ("<^" = Shake)
	
	switch(_text_id) {
		#region /////--------CHAPTER TITLES--------/////
			//Prologue /// Mind
			case "prologue":
				scr_text("PROLOGUE /// MIND");
					scr_text_float(0, 16);
			break;
		#endregion
		
		
		
		#region /////--------MIND--------/////
		
		#region //Test Room Bullshit
		///-----TEST ROOMS-----///
			case "Kappa NPC":
				scr_text("...", "false", "Sarah_Neutral_Normal");
				scr_text("...", "true", "Sarah_Neutral_Normal");
				scr_text("Bitch, who the fuck are you??", "false", "Sarah_Neutral_Normal");
				scr_text("Dumbass, I'm YOU!", "true", "Sarah_Neutral_Normal");
				scr_text("What DUMB SHIT y'all yellin' about now?", "true", "Kappa_Neutral_Normal");
				scr_text("Prolly some fuck fuck-shit.", "false", "Lone_Neutral_Normal");
				scr_text("We always be talkin' about some fuck-shit.", "true", "Sarah_Neutral_Normal");
				scr_text("'Tis a thing we are known to do.", "true", "Sophi_Neutral_Normal");
				scr_text("Well shut the fuck up.", "false", "Scott_Neutral_Normal");
			break;
			
			
			case "Sarah NPC":
				scr_text("Hiya, Kappa!", "Sarah_Neutral_Normal");
					scr_text_float(0, 11);
				
				scr_text("I hope you're doing well.", "Sarah_Neutral");
				scr_text("You don't talk much, but I hope you're taking care of yourself.", "Sarah_Neutral");
				scr_text("Self-care is very important.", "Sarah_Neutral");
			break;
			
			
			case "Lone NPC":
				scr_text("Hello, Kappa.", "Lone_Neutral");
				scr_text("If you ever need help putting your hair in a bun, just let me know.", "Lone_Neutral");
				scr_text("I can also teach it to, if you like.", "Lone_Neutral");
			break;
			
			
			case "Sophia NPC":
				scr_text("Good morning, dear.", "Sophia_Neutral");
				scr_text("Always make sure to never overwork yourself.", "Sophia_Neutral");
				scr_text("Make sure to take a break or two and let yourself rest.", "Sophia_Neutral");
			break;
			
			
			case "Scott NPC":
				scr_text("Heya, Kappa, what's up?", "Scott_Neutral");
			
				scr_option("Nothing much.", "Scott NPC - Nothin'");
				scr_option("Just wanted to chat.", "Scott NPC - Chat");
				scr_option("...", "Scott NPC - ...");
			break;
			
			
			case "Scott NPC - Nothin'":
				scr_text("OK then. Let me know if you need anything.", "Scott_Neutral");
			break;
			
			case "Scott NPC - Chat":
				scr_text("It's nice to hear you want to socialize.", "Scott_Neutral");
				scr_text("Though, it'll have to be some other time.", "Scott_Neutral");
				scr_text("I'm currently working on some new clothes for your sisters.", "Scott_Neutral");
				scr_text("If you ever want any new clothes, let me know.", "Scott_Neutral");
			break;
			
			case "Scott NPC - ...":
				scr_text("Still not much of a talker, huh?", "Scott_Neutral");
				scr_text("That's fine. No need to push yourself.", "Scott_Neutral");
				scr_text("I'm always around if you need something. You just gotta let me know.", "Scott_Neutral");
				scr_text("Make sure you have fun!", "Scott_Neutral");
			break;
			
			
			case "Brock NPC":
				scr_text("Ayy, Kappa! It's been a minute.", "Brock_Neutral");
				scr_text("Hope you've been keepin' up with your training.", "Brock_Neutral");
				scr_text("Always gotta be ready for anything!", "Brock_Neutral");
			break;
			
			
			case "Neegi NPC":
				scr_text("Heya, Kappa. Hope you're doin' well.", "Neegi_Neutral");
				scr_text("That new Martial Arts tournament is comin' up soon.", "Neegi_Neutral");
				scr_text_color(9, 31, c_yellow, c_yellow, c_yellow, c_yellow);
				
				scr_text("I'm assuming you're participating with me?", "Neegi_Neutral");
			
				scr_option("Yeah, I am.", "Neegi NPC - Yes");
				scr_option("No. Not this year's.", "Neegi NPC - No");
			break;
			
			case "Neegi NPC - Yes":
				scr_text("I thought so.", "Neegi_Neutral");
				scr_text("I'll be waiting for you there once the day comes.", "Neegi_Neutral");
			break;
			
			case "Neegi NPC - No":
				scr_text("Oh... really...?", "Neegi_Neutral");
				scr_text("Damn. And I was hopin' to go against you in one, since it's been a couple years since we last fought for real.", "Neegi_Neutral");
				scr_text("That's fine. Next year works for me.", "Neegi_Neutral");
			break;
			
			
			case "Cloe NPC":
				scr_text("I just got a new polaroid camera while you guys were gone.", "Cloe_Neutral");
				scr_text("We'll be taking a TON of pictures with this. As long as I'm able to afford film, that is.", "Cloe_Neutral");
					scr_text_float(18, 20);
					scr_text_color(18, 20, c_yellow, c_yellow, c_yellow, c_yellow);
			break;
			
			
			case "Akira NPC":
				scr_text("Yo. I got my spray cans on me right now.", "Akira_Neutral");
				scr_text("You wanna hit up the local harbor and paint some shit on the cargo?", "Akira_Neutral");
			
				scr_option("Sure.", "Akira NPC - Yes");
				scr_option("Maybe some other time.", "Akira NPC - No");
			break;
			
			case "Akira NPC - Yes":
				scr_text("Sick! I'll meet you there.", "Akira_Neutral");
			break;
			
			case "Akira NPC - No":
				scr_text("Ah. Aight.", "Akira_Neutral");
				scr_text("I'm always down to go, just let me know.", "Akira_Neutral");
			break;
			
			
			///-----Save Dialogue Test-----///
			case "SAVE 1":
				scr_text("What would you like to do?", "No One"); //Hah. UNDERTALE YELLOW Neutral reference.
			
				scr_option("Save.", "Save1");
				scr_option("Rest.", "Rest1");
			break;
			
			case "Save1":
				instance_destroy();
				instance_create_depth(x, y, depth, obj_SavBox);
			break;
			
			case "Rest1":
				scr_text("Unable to as of now.", "No One");
			break;
		#endregion
			
	
		#region ///-----Head-----///
			
				//---Cutscenes---//
			
				//New Game
				case "newGame":
					scr_text("(...)", "false", "Kappa_Confused_Head");
					scr_text("(Man, my head hurts...)", "false", "Kappa_Confused_Head");
					scr_text("(Hm?)", "false", "Kappa_LookUp_Head");
					scr_text("(God damn it.)", "false", "Kappa_LookUp_Head");
					scr_text("(I fell asleep in the car.)", "false", "Kappa_Think_Head");
					scr_text("", "false", "Kappa_Neutral_Head");
					scr_text("", "false", "Kappa_Waiting_Head");
					scr_text("", "false", "Kappa_LookUp_Head");
					scr_text("(This place looks a lil' different though.)", "false", "Kappa_LookUp_Head");
					scr_text("(I've actually got a place to stand on this time.)", "false", "Kappa_Neutral_Head");
					scr_text("(There's also decent structures everywhere.)", "false", "Kappa_LookUp_Head");
					scr_text("(Maybe there's somethin' new out here.)", "false", "Kappa_Neutral_Head");
					scr_text("(Better to check than stay here.)", "false", "Kappa_Prepare_Head");
				break;
				
				
				//---Saves---//
				
				//Generic (HeadTextbox)
				case "HeadSaveGen":
					scr_text("What would you like to do?", "false", "No One")
					
					scr_option("Save", "SaveHead");
					scr_option("Continue", "ContinueHead");
				break;
				
				case "SaveHead":
					instance_destroy();
					instance_create_depth(x, y, depth, obj_SavBox);
				break;
			
				case "ContinueHead":
					instance_destroy();
				break;
				
				
				//rm_HeadOverworld2
				case "HeadSave1":
					scr_text("(Huh.) \n<rRed.> <oOrange.> <yYellow.> <gGreen.> <aAqua.> <bBlue.> <pPurple.> <mMagenta.> <1<;Rainbow> <:Gray.> <~Wavy.> <^Shake.> <@Circle.> <*Scale.> \n<r`Half-Red.> <o`Half-Orange.> <y`Half-Yellow.> <g`Half-Green.> <a`Half-Aqua.> <b`Half-Blue.> <p`Half-Purple.> <m`Half-Magenta.> <;`Half-Rainbow> <:`Half-Gray.>", "false", ["Kappa_Neutral_Head", "Kappa_LookUp_Head"]);
					scr_text("Doin' more checks here.", "true", ["Sarah_Neutral_Normal"]);
					scr_text("Yet <1another> check <2here.> \n<0(KYS!)>", "true", ["Kappa_Think_Head", "Kappa_Shocked_Head", "Kappa_Prepare_Head"]);
					
					//Options
					scr_option("Yes", "HeadSave1 - Yes");
					scr_option("No", "HeadSave1 - No");
				break;
				
				//Options Yes
				case "HeadSave1 - Yes":
					instance_destroy();
					instance_create_depth(x, y, depth, obj_SavBox);
				break;
					
				//Options No	
				case "HeadSave1 - No":
					instance_destroy();
				break;
				
				
				//rm_HeadOverworld4
					case "HeadSave2":
						scr_text("(Oh! Another one.)", "false", "Kappa_LookUp_Head");
						scr_text("(This'll be a recurring thing I suppose.)", "false", "Kappa_LookUp_Head");
						
						
						//Options
						scr_option("Save", "HeadSave2 - Save");
						scr_option("Continue", "HeadSave2 - Continue");
					break;
					
					//Option Save
					case "HeadSave2 - Save":
						instance_destroy();
						instance_create_depth(x, y, depth, obj_SavBox);
					break;
					
					//Option Continue
					case "HeadSave2 - Continue":
						instance_destroy();
					break;
				
				
				
				///-----Hints-----///
				
				//rm_HeadOverworld2 - Stage Hint
				case "StageHint":
					scr_text("This is a STAGE DOOR.", "false", "No One");
						scr_text_color(10, 19, c_red, c_red, c_red, c_red);
						
					scr_text("If you stand in front of it, you'll see the info for that very stage.", "false", "No One");
					scr_text("With Stages comes a RANKING system, which is a visual indicator of how well you played in any given stage.", false, "No One");
						scr_text_color(20, 26, c_white, c_white, c_yellow, c_yellow);
					
					scr_text("There are 2 variations of Stages: SPEED and ACTION.", "false", "No One");
						scr_text_color(34, 38, c_white, c_white, c_blue, c_blue);
						scr_text_color(44, 49, c_white, c_white, c_red, c_red);
					
					scr_text("For now, there are only SPEED Stages, which focus on fast movement and platforming.", "false", "No One");
						scr_text_color(24, 28, c_white, c_white, c_blue, c_blue);
					
					scr_text("You'll be timed while in a Speed Stage, which will then determine your rank.", "false", "No One");
					scr_text("Nothing else matters other than going fast.", "false", "No One");
					scr_text("With that being said, go try out this Stage right here.", "false", "No One");
					scr_text("(NOTE: Stages save in a file separate from your main file. So make sure to save on your own.)", "false", "No One");
				break;
				
				case "EnemyHint":
					scr_text("These are enemies.", "false", "No One");
					scr_text("Enemies are also one of many things that can cause damage to you.", "false", "No One");
					scr_text("For a lot of enemies, as long as you're not running into them without sliding or boosting, you won't take damage.", "false", "No One");
					scr_text("While in the air, most actions will let you damage the enemy as well.", "false", "No One");
					scr_text("Killing an enemy will reward you with boost energy and increase your ENEMY COMBO.", "false", "No One");
					scr_text("The higher your ENEMY COMBO is, the more boost energy you gain upon killing another enemy.", "false", "No One");
					scr_text("Try killing these enemies right here.", "false", "No One");
				break;
				
				case "BeamHint":
					scr_text("These are death beams.", "false", "No One");
					scr_text("Death beams are one of the many things that causes damage to you.", "false", "No One");
					scr_text("A warning will pop up before it appears, also showing how much space the beam will occupy.", "false", "No One");
					scr_text("Take too much damage from it, along with many other things, you'll die and lose an extra life.", "false", "No One");
					scr_text("Be careful.", "false", "No One");
					scr_text("(NOTE: You can jump out of your hurt state if you've been falling for a small bit.)")
				break;
				
				case "RushTrickHint":
					scr_text("This is a spring.", "false", "No One");
					scr_text("Once you run into a spring, it'll launch you in the direction it's facing.", "false", "No One");
					scr_text("Getting launched from a spring will make you twirl.", "false", "No One");
					scr_text("If something makes you twirl, you can perform Rush Tricks.", "false", "No One");
						scr_text_color(46, 56, c_white, c_blue, c_blue, c_blue);
						
					scr_text("Spam your " + string(obj_CustomJumpKeySpeed.keyText) + " to perform RUSH TRICKS, increase your boost energy, and increase your RUSH TRICK COMBO.", "false", "No One");
					scr_text("Once you have a RUSH TRICK COMBO higher than 1, you can finish doing RUSH TRICKS by pressing " + string(obj_CustomAct1KeySpeed.keyText) + " .", "false", "No One");
					scr_text("Upon finishing, you gain an immense amount of boost energy depending on how many RUSH TRICK COMBO icons there are.", "false", "No One");
					scr_text("You can also press " + string(obj_CustomAct3KeySpeed.keyText) + " and hold a direction to do a DIRECTIONAL TRICK, which launches you and resets your RUSH TRICKS, letting you do more.", "false", "No One");
					scr_text("If you hold no direction, you'll be launched opposite of the direction you're facing.", "false", "No One");
					scr_text("Give all this a try.", "false", "No One");
				break;
				
				case "BoostHint":
					scr_text("Initiating a boost will send you at top-speed in the direction you're facing.", "false", "No One");
					scr_text("It can also be initiated after stomping the ground.", "false", "No One");
					scr_text("While boosting, your acceleration speed is tripled.", "false", "No One");
					scr_text("It also adds onto the effect slopes have to your momentum.", "false", "No One");
					scr_text("You also won't lose speed at the peak of your height while in the air.", "false", "No One");
					scr_text("Once you lose boost energy or you're too slow, your boost will end on its own.", "false", "No One");
				break;
				
				
				case "StageHintAct":
					scr_text("ACTION stages focus on fighting and combos.", "false", "No One");
						scr_text_color(0, 5, c_white, c_white, c_red, c_red);
					
					scr_text("Instead of being timed, you need to build up score to increase your rank.", "false", "No One");
					scr_text("The only way to build up score is to constantly deal damage.", "false", "No One");
					scr_text("On top of that, score is always draining, so you want to be engaged for the most part.", "false", "No One");
					scr_text("You're usually in 1-on-1 fights in Action stages, but there might be exceptions.", "false", "No One");
					scr_text("But keep in-mind that spamming the same move will deal less 'n' less damage AND will give you significantly less points for your score.", "false", "No One");
					scr_text("So try to be versatile.", "false", "No One");
				break;
				
				
				///-----Forced-----///
				
				//rm_HeadOverworld2
				case "Hate":
					global.statData[1].head_Overworld2_Check1 = true;
				
					scr_text("\"Hate.\"", "false", "No One Ghost");
					scr_text("People like to say that hate is a strong word.", "false", "No One Ghost");
					scr_text("People objectify hate as if it's powerful.", "false", "No One Ghost");
					scr_text("A word that some would deem most others use often, but incorrectly. Or at the very least way too loosely.", "false", "No One Ghost");
					scr_text("(Who-)", "false", "Kappa_LookUp_Head");
					scr_text("(Who the hell is talkin-)", "true", "Kappa_LookUp_Head");
					scr_text("The fact that you can use it so loosely is alarming.", "false", "No One Ghost");
					scr_text("For such a short word, it really is powerful, all things considered.", "false", "No One Ghost");
					scr_text("(...)", "false", "Kappa_LookUp_Head");
					scr_text("(...)", "false", "Kappa_Think_Head");
				break;
				
				
				//rm_HeadOverworld6
				case "LotstoHate":
					global.statData[1].head_Overworld6_Check1 = true;
				
					scr_text("...", "false", "No One Ghost");
					scr_text("Y'know... It takes a lot to truly hate someone.", "false", "No One Ghost");
					scr_text("I mean, they'd have to do something horrible. HEINOUS even.", "false", "No One Ghost");
					scr_text("And if it's towards you, then that only objectifies and warrants the hate even more.", "false", "No One Ghost");
					scr_text("...", "false", "No One Ghost");
					scr_text("So why does it take so very little to hate yourself?", "false", "No One Ghost");
					scr_text("Especially if it's for something you didn't even do?", "false", "No One Ghost");
					scr_text("At least... you think you didn't do anything.", "false", "No One Ghost");
					scr_text("Or is not doing anything just as bad?", "false", "No One Ghost");
					scr_text("Maybe worse.", "false", "No One Ghost");
				break;
				
				
				//rm_HeadOverworld7
				case "HeySaiyan":
					scr_text("", "false", "Kappa_Neutral_Head");
					scr_text("(Hi, Saiyan.)", "false", "Kappa_Neutral_Head");
					scr_text("(How you doin', bub-ba?)", "false", "Kappa_Neutral_Head");
				break;
				
				case "ByeSaiyan":
					global.statData[1].head_Overworld7_Check1 = true;
				
					scr_text("(...)", "false", "Kappa_Think_Head");
					scr_text("(I hope you're doin' alright.)", "false", "Kappa_Think_Head");
				break;
				
				
				//rm_HeadOverworld9
				case "Pace":
					scr_text("(Man, feels good to run around here.)", "false", "Kappa_Neutral_Head");
					scr_text("(Nice to know I haven't gotten slower in the past few years.)", "false", "Kappa_LookUp_Head");
					scr_text("(Gotta really thank Blur for teachin' me everything.)", "false", "Kappa_Waiting_Head");
					scr_text("(It's a decent playground to practice my new moves.)", "false", "Kappa_Neutral_Head");
					scr_text("(REALLY get's the adrenaline PUMPIN'!)", "false", "Kappa_LetsGetActive_Head");
						scr_text_shake(18, 36);
						scr_text_color(18, 27, c_red, c_red, c_red, c_red);
					
					scr_text("", "false", "Kappa_LetsGetActive_Head");
					scr_text("", "false", "Kappa_Think_Head");
					scr_text("(Even so...)", "false", "Kappa_Think_Head");
					scr_text("(I don't want to stay here forever.)", "false", "Kappa_Think_Head");
					scr_text("(From what I got off before I fell asleep, we should be almost home.)", "false", "Kappa_LookUp_Head");
					scr_text("(Sarah or Lone'll likely wake me up in a few.)", "false", "Kappa_Neutral_Head");
					scr_text("(I'll likely go chill near a tree once I'm done runnin' around.)", "false", "Kappa_Neutral_Head");
					scr_text("(But guess I ain't done, so I need to keep movin'.)", "false", "Kappa_Neutral_Head");
				break;
				
				
				//rm_HeadOverworld10
				case "WaitHead":
					scr_text("", "false", "Kappa_Think_Head");
					scr_text("", "false", "Kappa_Neutral_Head");
					scr_text("(The hell's that up ahead?)", "false", "Kappa_Neutral_Head");
				break;
				
				case "Recognition":
					scr_text("", "false", "Kappa_Think_Head");
					scr_text("(Huh.)", "false", "Kappa_Think_Head");
					scr_text("(This is my mother's.)", "false", "Kappa_Think_Head");
					scr_text("(Looks a bit beat up.)", "false", "Kappa_Neutral_Head");
					scr_text("(Not terrible, but I can see a couple dents.)", "false", "Kappa_Think_Head");
					scr_text("(...)", "false", "Kappa_Neutral_Head");
				break;
				
				case "SaiyanMeow":
					scr_text("(Hmm?)", "false", "Kappa_Neutral_Head");
					scr_text("(Saiyan?)", "false", "Kappa_Neutral_Head");
					scr_text("(Whatchu see over there?)", "false", "Kappa_Neutral_Head");
				break;
				
				case "EndofMind":
					scr_text("(Ah.)", "false", "Kappa_Neutral_Head");
					scr_text("(A cliff.)", "false", "Kappa_Think_Head");
					scr_text("(There's nothin' up ahead either.)", "false", "Kappa_Waiting_Head");
					scr_text("(Guess I'm done here.)", "false", "Kappa_Think_Head");
					scr_text("(Other than this car bein' here, I had fun.)", "false", "Kappa_Neutral_Head");
					scr_text("(That last tree shouldn't take long to get back to.)", "false", "Kappa_Prepare_Head");
					scr_text("(I think I saw a couple shortcuts too, so it'll take even less time.)", "false", "Kappa_Prepare_Head");
				break;
				
				case "ByeSaiyan2":
					scr_text("(There goes Saiyan again.)", "false", "Kappa_Think_Head");
					scr_text("(Bye, bub.)", "false", "Kappa_Neutral_Head");
				break;
				
				case "DODGE":
					scr_text("('THE HELL?!)", "false", "Kappa_FightStance_Head");
				break;
				
				case "Explosion":
					scr_text("(SHIT!)", "false", "Kappa_Shocked_Head");
					scr_text("(I NEED TO DIP, NOW!)", "false", "Kappa_Shocked_Head");
				break;
				
				case "Explosion2":
					scr_text("(GOD-)", "false", "Kappa_Shocked_Head");
				break;
				
				case "Run":
					scr_text("(!)", "false", "Kappa_Think_Head");
					scr_text("(There's ground down there!)", "false", "Kappa_Prepare_Head");
				break;
	#endregion
				
				
		#region //rm_SarahProto
				case "kappa.":
					scr_text("...Kappa.", "false", "No One Ghost");
						scr_text_color(0, 8, c_grey, c_grey, c_grey, c_grey);
						scr_text_float(0, 8);
				break;
				
				case "Kappa...":
					scr_text("...", "false", "No One Ghost");
						scr_text_color(0, 2, c_white, c_grey, c_grey, c_grey);
						scr_text_float(0, 2);
						
					scr_text("...Kappa?", "false", "No One Ghost");
						scr_text_color(0, 8, c_white, c_white, c_white, c_grey);
						scr_text_float(0, 8);
				break;
				
				case "MF WAKE UP":
					scr_text("...", "false", "Sarah_NoOne");
					scr_text("Hey! Kappa!", "false", "Sarah_NoOne");
					scr_text("Wake up, bro-bro.", "false", "Sarah_NoOne");
					scr_text("We're almost home.", "false", "Sarah_NoOne");
				break;
		#endregion
				
		
		#endregion
		
		
		#region /////--------Hometown--------/////
		
		//---Cutscenes---//
			
				//Hometown Intro Sunrise
				case "HometownIntro":
					scr_text("Kaapppppaaaaa.", "false", "Sarah_Confused_Normal");
						scr_text_float(0, 13);
					
					scr_text("Wakey-wakey, sleepyhead.", "false", "Sarah_Giddy_Normal");
					scr_text("C'mon, kiddo. We're nearin' the town.", "true", "Scott_Neutral_Normal");
					scr_text("", "false", "Kappa_HeadHurt_Normal");
					scr_text("...", "false", "Kappa_Neutral_Normal");
					scr_text("Oo, he's up!", "false", "Sarah_Giddy_Normal");
					scr_text("Good morning, Kappa.", "true", "Lone_Neutral_Normal");
					scr_text("Good morning, dear.", "true", "Sophi_Neutral_Normal");
					scr_text("Mornin' kid! You were out like a light.", "true", "Scott_Neutral_Normal");
					scr_text("Your sisters have been trying to wake you up for a decent bit.", "true", "Scott_Neutral_Normal");
					scr_text("Nearly tried everything under the sun to get you up, haha.", "true", "Scott_Neutral_Normal");
					scr_text("I even tried using Saiyan.", "false", "Lone_Saiyan_Normal");
					scr_text("All 3 of the cats for that matter.", "false", "Lone_Saiyan_Normal");
					scr_text("You didn't move at all.", "false", "Lone_Saiyan_Normal");
					scr_text("You're usually not a heavy sleeper.", "false", "Sarah_Confused_Normal");
					scr_text("Did... something happen while you were asleep?", "false", "Lone_Neutral_Normal");
					scr_text("", "true", "Kappa_Neutral_Normal");
					scr_text("Rather not say.", "true", "Kappa_Neutral_Normal");
					scr_text("Are you suuurrrreeeee?", "false", "Sarah_Giddy_Normal");
						scr_text_float(8, 21);
						
					scr_text(" ", "true", "Kappa_ThumbsUp_Normal");
					scr_text("You do still seem a little drowsy, though.", "false", "Sarah_Confused_Normal");
					scr_text("...", "false", "Sarah_Confused_Normal");
					scr_text("I got it!", "false", "Sarah_Giddy_Normal");
					scr_text("Let's wake you up a little faster and stand on the van.", "false", "Sarah_Giddy_Normal");
					scr_text("Oo, I want to come too.", "true", "Lone_Neutral_Normal");
					scr_text("Please make sure to be careful you three.", "true", "Sophi_Neutral_Normal");
					scr_text("You kids may be powerful, but it's still best to be cautious.", "true", "Sophi_Neutral_Normal");
					scr_text("We will, Mama.", "false", "Sarah_Neutral_Normal");
					scr_text("Bye-bye, Saiyan. I have to go.", "false", "Lone_Saiyan_Normal");
					
				break;
				
				case "HometownIntro2":
					scr_text("Wow!", "false", "Lone_Neutral_Normal");
						scr_text_float(0, 3);
					
					scr_text("The sunrise is so beautiful!", "false", "Lone_Neutral_Normal");
					scr_text("Especially over the water, affecting its color.", "false", "Lone_Neutral_Normal");
					scr_text("", "false", "Sarah_Confused_Normal");
					scr_text("Oo, Kappa! Look!", "false", "Sarah_Giddy_Normal");
					scr_text("I can see HOMETOWN up ahead.", "false", "Sarah_Giddy_Normal");
						scr_text_color(10, 17, c_yellow, c_yellow, c_yellow, c_yellow);
					
					scr_text("It's still really far, but I can see it.", "false", "Sarah_Neutral_Normal");
					scr_text("So that's where you all lived originally?", "true", "Lone_Neutral_Normal");
					scr_text("Yeah! It's also where all our friends live.", "false", "Sarah_Giddy_Normal");
					scr_text("Well- hopefully they should still live there.", "false", "Sarah_Confused_Normal");
					scr_text("We haven't seen them in the past 4 years.", "false", "Sarah_Neutral_Normal");
					scr_text("We unfortunately couldn't keep contact with them since we didn't own phones at the time.", "false", "Sarah_Confused_Normal");
					scr_text("I can't wait to see them again.", "false", "Sarah_Giddy_Normal");
					scr_text("Knowing them, they're probably already waiting for you guys.", "true", "Scott_Neutral_Normal");
					scr_text("You're probably right.", "false", "Sarah_Neutral_Normal");
					scr_text("They might have improved their energy-sensing.", "false", "Sarah_Confused_Normal");
					scr_text("Speaking of:", "true", "Sophi_Neutral_Normal");
					scr_text("Kids, you're way better at this whole \"energy-sensing\" thing than me or your father...", "true", "Sophi_Neutral_Normal");
					scr_text("Based on you sensing your friends, how long do you think we have until we get there?", "true", "Sophi_Neutral_Normal");
					scr_text("I'm honestly the weakest of us 3 when it comes to sensing for energy.", "false", "Lone_Neutral_Normal");
					scr_text("I also don't know who I'm sensing for, so I can't make an estimate.", "false", "Lone_Neutral_Normal");
					scr_text("Sarah?", "false", "Lone_Neutral_Normal");
					scr_text("Hmm...", "false", "Sarah_Confused_Normal");
						scr_text_float(0, 5);
						
					scr_text("...", "false", "Sarah_Confused_Normal");
					scr_text("I can't really give an accurate time either since we're so far.", "false", "Sarah_Confused_Normal");
					scr_text("I can sense them, just not to a point where I can give an estimate myself.", "false", "Sarah_Confused_Normal");
					scr_text("Kappa?", "false", "Sarah_Neutral_Normal");
					scr_text("...", "false", "Kappa_Thinking_Normal");
					scr_text("An hour.", "false", "Kappa_Neutral_Normal");
					scr_text("Wow! Just like that?", "false", "Sarah_Confused_Normal");
					scr_text(" ", "false", "Kappa_ThumbsUp_Normal");
					scr_text("Arright. An hour it is.", "true", "Scott_Neutral_Normal");
					scr_text("Strap in, kids. We're almost there.", "true", "Scott_Neutral_Normal");
					scr_text("Oo! Kappa! Lone! Let's take a picture.", "false", "Sarah_Giddy_Normal");
					scr_text("OK.", "false", "Lone_Neutral_Normal");
					scr_text(" ", "false", "Kappa_ThumbsUp_Normal");
					scr_text("Ready?", "false", "Sarah_Neutral_Normal");
					scr_text("", "false", "Sarah_Neutral_Normal");
					scr_text("Mmmm...", "false", "Sarah_Confused_Normal");
					scr_text("It's kinda hard to get a good angle...", "false", "Sarah_Confused_Normal");
					scr_text("If you want, I can take the picture for you all.", "true", "Sophi_Neutral_Normal");
					scr_text("We'd really appreciate that, Mama. Thank you.", "false", "Sarah_Neutral_Normal");
				break;
				
				case "HometownIntro2.5":
					scr_text("You kids ready?", "true", "Sophi_Neutral_Normal");
					scr_text("Mmm-hmm.", "false", "Lone_Neutral_Normal");
					scr_text("Yep!", "false", "Sarah_Neutral_Normal");
					scr_text(" ", "false", "Kappa_ThumbsUp_Normal");
					scr_text("Make sure to strike a nice pose.", "true", "Sophi_Neutral_Normal");
					scr_text("Oo! Heart! Heart!", "false", "Sarah_Giddy_Normal");
					scr_text("Let's do our finger heart pose!", "false", "Sarah_Giddy_Normal");
					scr_text("3.", "true", "Sophi_Neutral_Normal");
					scr_text("2.", "true", "Sophi_Neutral_Normal");
					scr_text("1.", "true", "Sophi_Neutral_Normal");
				break;
				
				case "HometownIntro3":
					scr_text("...", "true", "Lucifer_Thinking_Normal");
					scr_text("He really is back.", "true", "Lucifer_Thinking_Normal");
					scr_text("I knew something felt off.", "true", "Lucifer_Thinking_Normal");
					scr_text("And just as father said, he has a new family now.", "true", "Lucifer_Thinking_Normal");
					scr_text("...", "true", "Lucifer_Thinking_Normal");
					scr_text("Who knew I'd be put back into this situation 7 years later...", "true", "Lucifer_Thinking_Normal");
					scr_text("I didn't think he'd ever come back.", "true", "Lucifer_Thinking_Normal");
					scr_text("I thought his mother's death was enough of a warning.", "true", "Lucifer_Thinking_Normal");
					scr_text("Guess not.", "true", "Lucifer_Thinking_Normal");
					scr_text("", "true", "Lucifer_Thinking_Normal");
					scr_text("Father's going to be pissed.", "true", "Lucifer_NoOne");
				break;
		
		#endregion
		
				
		#region ///-----Character Tutorials-----///
				
				//Kappa Head
				case "kappaTut":
					scr_text("Welcome to the CHARACTER TUTORIAL.", "false", "No One Ghost");
					scr_text("Kappa's tutorial is gonna be focused on the general gameplay loop and a lot of the mechanics that every character gets to interact with.", "false", "No One Ghost");
					scr_text("Start movin' around and get a feel.", "false", "No One Ghost");
				break;
				
				case "kappaTutEnd":
					scr_text("That's it for the general mechanics.", "false", "No One Ghost");
					scr_text("You can leave CHARACTER TUTORIALs via the pause menu.", "false", "No One Ghost");
					scr_text("Go out there and rock some bull!", "false", "No One Ghost");
				break;
				
				
				//Slopes
				case "slopeTut":
					scr_text("Slopes can either help or deteriorate your moment and influnce your movement when you jump off 'em.", "false", "No One Ghost");
					scr_text("Make sure to screw around with 'em a bit and use 'em to your advantage.", "false", "No One Ghost");
				break;
				
				//Rush Mode
				case "rushModeTut":
					scr_text("If you max out your boost meter via tricks or checkpoints, you'll enter Rush Mode.", "false", "No One Ghost");
					scr_text("While in Rush Mode, your boost meter no longer depletes when you boost and a new meter shows up showing how long Rush Mode is lasting.", "false", "No One Ghost");
					scr_text("Anything that gives you boost while in Rush Mode will instead max out the timer, letting you maintain it.", "false", "No One Ghost");
					scr_text("Once Rush Mode ends, your boost meter gradually decreases to your 2nd set of the meter.", "false", "No One Ghost");
					scr_text("Do with this info as you will.", "false", "No One Ghost");
				break;
				
				
				//Sarah
				case "sarahTut":
					scr_text("Welcome to the CHARACTER TUTORIAL.", "false", "No One Ghost");
					scr_text("This is Sarah Suki. A sweet girl with a lotta spirit.", "false", "No One Ghost");
					scr_text("Her acceleration speed is average, but specializes in verticality.", "false", "No One Ghost");
					scr_text("Get to movin'.", "false", "No One Ghost");
				break;
				
				
				//Ivy
				case "ivyTut":
					scr_text("Welcome to the CHARACTER TUTORIAL.", "false", "No One Ghost");
					scr_text("This is Ivy. A small kid that owns a 6-Shooter and has a sense of justice.", "false", "No One Ghost");
					scr_text("Because of how small they are, her acceleration and jump height are a lil' bit of a struggle 'n' they can't double jump.", "false", "No One Ghost");
					scr_text("But that's where his revolver comes into play, each bullet in the chamber being stronger than the last.", "false", "No One Ghost");
					scr_text("You can also reload her revolver. Depending on how much is left in the chamber, the time taken to reload will be reduced, reloading in mid-air taking longer.", "false", "No One Ghost");
					scr_text("Give their gun a go.", "false", "No One Ghost");
				break;
				
				case "ivyStompTut":
					scr_text("Ivy's stomp takes a bit to charge up, but you slam down really fast.", "false", "No One Ghost");
					scr_text("Your momentum also never stops, letting your stomp be pre-prepped.", "false", "No One Ghost");
				break;
				
				case "ivyFullChargeTut":
					scr_text("If you hold your shoot button down, you can charge it. Let go of the button after it's fully charged and your revolver shot gets powerful, but in most cases will deplete your entire chamber.", "false", "No One Ghost");
				break;
				
				case "ivyFullShootAir":
					scr_text("If your revolver is fully charged, while in the air, hold the Jump button, release your shoot button and you'll gain immense height depending on how many bullets you had.", "false", "No One Ghost");
				break;
				
				case "ivyFullHShoot":
					scr_text("If your revolver is fully charged, while in the air, just let go of your shoot button and you'll fly through the air at increasing speeds.", "false", "No One Ghost");
					scr_text("You'll keep flying until your revolver runs out of bullets or if you run into something", "false", "No One Ghost");
					scr_text("If you're boosting while doing this action, your acceleration speed get affected, letting you gain speed even faster.", "false", "No One Ghost");
				break;
		#endregion
	}
	
}