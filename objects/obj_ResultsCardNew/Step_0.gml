getCharacterControls();

if !completed {	
	#region //Sonic Rush Spikes
		moveRight = lerp(moveRight, moveRightEnd, 0.4);
		moveUp = lerp(moveUp, moveUpEnd, 0.4);
		moveDown = lerp(moveDown, moveDownEnd, 0.4);
	#endregion
	
	#region //Player
		if leftBackMoveX >= leftBackEndX - 0.1 {
			playerMoveX = lerp(playerMoveX, playerEndX, 0.1);
		}
	#endregion
	
	if !createRank {
		if jump_Key or pause_Key {
			createRank = true;
			playerMoveX = playerEndX;
		}
		
		#region //Side Bar
			leftBackMoveX = lerp(leftBackMoveX, leftBackEndX, 0.2);
		#endregion
		
		#region //Results
			if playerMoveX <= playerEndX + 1 {
				resultsMoveX = lerp(resultsMoveX, resultsEndX, 0.2);
			}
			
			if resultsMoveX >= resultsEndX - 0.5 {
				stageNameMoveX = lerp(stageNameMoveX, stageNameEndX, 0.2);
			}
			
			if stageNameMoveX >= stageNameEndX - 0.5 {
				levelNumberMoveX = lerp(levelNumberMoveX, levelNumberEndX, 0.2);
			}
			
			if levelNumberMoveX >= levelNumberEndX - 0.5 {
				rankMoveX = lerp(rankMoveX, rankEndX, 0.2);
			}
			
			if rankMoveX >= rankEndX - 0.5 {
				timeMoveX = lerp(timeMoveX, timeEndX, 0.1);
			}
		#endregion
		
		#region //Timer BS
			if timeMoveX >= timeEndX - 1 {
				savedSeconds = lerp(savedSeconds, global.seconds, 0.05);
				savedMinutes = lerp(savedMinutes, global.minutes, 0.05);
				
				var _hund = round((savedSeconds * 100) mod 10);
				var _hund2 = (savedMinutes * 100) + savedSeconds;
				
				if soundSeconds != _hund {
					soundSeconds = _hund;
					obj_SFXManager.funkinFav = true;
				}
				
				if _hund2 < global.speedStageData[global.SpeedSelected].totalTime {
					obj_NewTime.visible = true;
				}
				
				savedScore = lerp(savedScore, global.GameScore, 0.05);
				
				var _score = ceil((savedScore));
				
				if soundScore != _score {
					soundScore = _score;
					
					if waitScore > 0 {
						waitScore -= 1;
					}
					
					if waitScore <= 0 {
						obj_SFXManager.menuTap = true;
						waitScore = 2;
					}
				}
				
				ringScore = lerp(ringScore, global.Rings, 0.05);
				enemyScore = lerp(enemyScore, global.EnemyCount, 0.05);
				
				if savedScore > global.speedStageData[global.SpeedSelected].gameScore {
					obj_NewScore.visible = true;
				}
				
				if ringScore > global.speedStageData[global.SpeedSelected].rings {
					obj_NewRings.visible = true;
				}
				
				if enemyScore > global.speedStageData[global.SpeedSelected].enemies {
					obj_NewEnemy.visible = true;
				}
			}
			
			if savedSeconds == global.seconds && savedMinutes == global.minutes {
				createRank = true;
			}
		#endregion
	} else {
		leftBackMoveX = leftBackEndX;
		resultsMoveX = resultsEndX;
		stageNameMoveX = stageNameEndX;
		levelNumberMoveX = levelNumberEndX;
		rankMoveX = rankEndX;
		timeMoveX = timeEndX;
		savedSeconds = global.seconds;
		savedMinutes = global.minutes;
		savedScore = global.GameScore;
		ringScore = global.Rings;
		enemyScore = global.EnemyCount;
		
		var _hund2 = (savedMinutes * 100) + savedSeconds;
				
		if _hund2 < global.speedStageData[global.SpeedSelected].totalTime {
			obj_NewTime.visible = true;
		}
		
		if savedScore > global.speedStageData[global.SpeedSelected].gameScore {
			obj_NewScore.visible = true;
		}
		
		if ringScore > global.speedStageData[global.SpeedSelected].rings {
			obj_NewRings.visible = true;
		}
				
		if enemyScore > global.speedStageData[global.SpeedSelected].enemies {
			obj_NewEnemy.visible = true;
		}
		
		if rankSize > 0 {
			rankSize -= lowerRankSize;
			lowerRankSize += 0.025;
		}
		
		if rankSize <= 0 {
			rankSize = 0;
			
			if !rankShook {
				rankShakeValue = 2;
				rankShook = true;
				obj_SFXManager.rankSlam = true;
				
				if global.Rank == 0 or global.Rank == 1 {
					set_song_ingame(global.PlayerSelection[global.PlayerChar][23][0], 0, 60);
				} else if global.Rank == 2 or global.Rank == 3 or global.Rank == 4 {
					set_song_ingame(global.PlayerSelection[global.PlayerChar][23][1], 0, 60);
				} else if global.Rank == 5 {
					set_song_ingame(global.PlayerSelection[global.PlayerChar][23][2], 0, 60);
				} else if global.Rank == 6 {
					set_song_ingame(global.PlayerSelection[global.PlayerChar][23][3], 0, 60);
				}
				
				save_Speed_Stage(global.saveFile);
				
				if audio_is_playing(resultsMus) {
					audio_stop_sound(resultsMus);
				}
				
				if !instance_exists(obj_ResultsWhiteTrans) {
					instance_create_depth(-100000, 0, 0, obj_ResultsWhiteTrans);
				}
				
				scr_MusicTag();
			} else {
				if jump_Key {
					set_song_ingame(noone, 60, 0);
					completed = true;
					obj_SFXManager.menuConfirm = true;
				}
				
				if action_Key {
					set_song_ingame(noone, 60, 0);
					completed = true;
					retry = true;
					obj_SFXManager.menuPop = true;
					
					global.Jukebox = global.JukeCheck;
				}
				
				if instance_exists(obj_InputRecorder) {
					with(obj_InputRecorder) {
						if other.action1_Key && !other.replayGotSaved {
							other.replayGotSaved = true;
							obj_SFXManager.homingLockOn = true;
							scr_WriteInputRecording(fileName);
							scr_SaveReplayChar(fileName);
						}
					}
				}
				
				with(obj_GhostRecorder) {
					if other.action3_Key && !saveGhost {
						var _dir = working_directory + "/ghosts" + string(global.speedStageData[global.SpeedSelected].folder_Name);
						
						if ds_exists(ghostRecordList, ds_type_list) {
							var _wrapper = ds_map_create();
		
							ds_map_add_list(_wrapper, "root", ghostRecordList);
							
							var _theLot = json_encode(_wrapper);
							var _recordName = _dir + string(global.speedStageData[global.SpeedSelected].record_File) + ".sav";
							
							if file_exists(_recordName) {
								file_delete(_recordName);
							}
							
							var _recordFile = file_text_open_write(_recordName);
							
							file_text_write_string(_recordFile, _theLot);
							file_text_close(_recordFile);
							ds_map_destroy(_wrapper);
						}
						
						obj_SFXManager.clench = true;
						saveGhost = true;
						other.ghostGotSaved = true;
					}
				}
			}
		}
	}
} else {
	if completedTimer > 0 {
		completedTimer -= 1;
	}
	
	if completedTimer <= 0 {
		if instance_exists(obj_GhostRecorder) {
			instance_destroy(obj_GhostRecorder);
		}
		
		if instance_exists(obj_InputRecorder) {
			instance_destroy(obj_InputRecorder);
		}
		
		obj_NewRecordN.visible = false;
		obj_NewTime.visible = false;
		obj_NewScore.visible = false;
		obj_NewRings.visible = false;
		obj_NewEnemy.visible = false;
		
		#region //Sonic Rush Spikes
			moveRight = lerp(moveRight, moveRightStart, 0.1);
			moveUp = lerp(moveUp, moveUpStart, 0.1);
			moveDown = lerp(moveDown, moveDownStart, 0.1);
		#endregion
	
		#region //Player
			playerMoveX = lerp(playerMoveX, -600, 0.1);
		#endregion
	
		#region //Side Bar
			leftBackMoveX = lerp(leftBackMoveX, -2000, 0.1);
		#endregion
		
		#region //Results
			resultsMoveX = lerp(resultsMoveX, 1000, 0.1);
			stageNameMoveX = lerp(stageNameMoveX, 1000, 0.1);
			levelNumberMoveX = lerp(levelNumberMoveX, 1000, 0.1);
			rankMoveX = lerp(rankMoveX, 1000, 0.1);
			timeMoveX = lerp(timeMoveX, 1000, 0.1);
			srBallMoveY = lerp(srBallMoveY, -700, 0.1);
			rankMoveX = lerp(rankMoveX, 1000, 0.1);
			rankAltX = lerp(rankAltX, 1000, 0.1);
		#endregion
		
		if !retry {
			if !global.Freeplay {
				if !instance_exists(obj_RoomTransParent) {
					var instantiated = instance_create_depth(0, 0, -100000000000, obj_RoomTransitionBasicStage);
					
					instantiated.target_x = global.TargetX;
					instantiated.target_y = global.TargetY;
					instantiated.target_rm = global.TargetRM;
				}
			} else {
				if global.MIND {
					global.MIND = false;
				}
				
				if !instance_exists(obj_RoomTransParent) {
					var instantiated = instance_create_depth(0, 0, -100000000000, obj_RushTransition);
					instantiated.target_rm = rm_FreeplayNew;
				}
			}
		} else {
			if restartTimer > 0 {
				restartTimer -= 1;
			} else {
				if !instance_exists(obj_RoomTransParent) {
					with(instance_create_depth(-100000, 0, 0, obj_RushTransition)) {
						target_rm = global.speedStageData[global.SpeedSelected].stage_RM;
						speedStage = true;
					}
				}
			}
		}
	}
}

#region //Background Box
	image_alpha = lerp(image_alpha, 0.5, 0.1);
#endregion

//Animations
if !global.SimplifyVFX {
	srBallRotate += 10;
	
	mindImageIndex += 1 / 12;
	
	srSpikesImageIndex += 1;
	srSpikesImageIndexBack -= 1;
}

if srBallMoveX > 0 {
	srBallMoveX -= 10;
}

if mindImageIndex >= 3 {
	mindImageIndex = 0;
}

if srSpikesImageIndex >= 20 {
	srSpikesImageIndex = 0;
}

if srSpikesImageIndexBack <= 0 {
	srSpikesImageIndexBack = 20;
}

var shake = power(4, 2) * rankShakeValue;

if !global.SimplifyVFX {
	rankShakeX = random_range(-shake, shake);
	rankShakeY = random_range(-shake, shake);
}

if rankShakeValue > 0 {
	rankShakeValue -= 0.25;
}
