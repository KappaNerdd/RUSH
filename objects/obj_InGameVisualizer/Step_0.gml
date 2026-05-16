getCharacterControls();

#region //Animation
	#region //Menu Check
		var _menu = menu;
		var _dir = working_directory + "/saves/" + string(global.saveFile) + "/";
		var _filename = _dir + string(global.MainDataFile) + string(global.saveFile) + ".sav";
		
		if moveGameplay {
			if moveStory {
				_menu = story;
			} else {
				_menu = gameplay;
			}
		}
		
		if moveExtra {
			_menu = extra;
		}
	#endregion

	#region //Background Shit
		extraScale = lerp(extraScale, 0, 0.15);
		
		if realBPM > 0 {
			realBPM -= delta_time;
		} else {
			realBPM += conBPM;
			
			if !global.SimplifyVFX {
				extraScale = 1;
				
				if !menuChosen {
					menuRet = !menuRet;
				}
			}
		}
	
		if !global.SimplifyVFX {
			backTextX--;
			otherBackTextX++;
		
			if backTextX <= -384 {
				backTextX = baseTextX;
				otherBackTextX = otherBaseTextX;
			}
			
			srSpikesIndex++;
			
			if srSpikesIndex >= 20 {
				srSpikesIndex = 0;
			}
			
			if menuChosen {
				retTimer--;
				
				if retTimer <= 0 {
					retTimer = 5;
					menuRet = !menuRet;
				}
			}
		} else {
			menuRet = true;
		}
		
		if !storyChosen && !goContinue {
			if nerd == 0 {
				global.PlayerChar = 1;
			} else {
				global.PlayerChar = 11;
			}
		}
	#endregion

	#region //Sonic Rush Boss Ball
		if waitTimer <= 30 {
			anotherAngle += 5;
			changedAngle += anotherAngle;
			
			menuAngle = ease(menuAngle, -changedAngle, 0.2, Easings.QUAD_IO);
			renderX = ease(renderX, -changedAngle, 0.2, Easings.QUAD_IO);
		} else {
			menuAngle = lerp(menuAngle, -(360 / array_length(_menu)) * menuChoice, 0.15);
			renderX = lerp(renderX, -800 * menuChoice, 0.15);
			changedAngle = 0;
			anotherAngle = 5;
		}
			
		menuX = lerp(menuX, 0, 0.1);
		menuY = lerp(menuY, 0, 0.1);
		iconScale = lerp(iconScale, 1, 0.1);
	#endregion
#endregion

if !confirm {	
	
} else {
	
}