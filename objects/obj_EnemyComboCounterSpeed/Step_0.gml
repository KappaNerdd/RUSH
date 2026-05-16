if global.DisableHUD or instance_exists(obj_RoomTransParent) or instance_exists(obj_Textbox) or instance_exists(obj_CutsceneParent) or instance_exists(obj_LevelCard) or instance_exists(obj_ResultsCard) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) {
	visible = false;
} else {
	if obj_Player.enemyCombo > 0  {
		createBonus = false;
		
		if !global.SimplifyVFX {
			if visibleTimer > 0 {
				visibleTimer -= 1;
			}
		
			if visibleTimer <= 0 && obj_Player.enemyComboTimer < 100 {
				visibleTimer = 2;
			
				visible = !visible;
			} else if obj_Player.enemyComboTimer > 100 {
				visible = true;
			}
		} else {
			visible = true;
		}
	}
}


with (obj_Player) {
	if enemyCombo <= 0 && enemyCombo < 5 {
		if !global.MIND && global.PlayerChar != 0 {
			other.image_index = 0;
		} else {
			other.sprite_index = other.comboNames[0];
		}
		
		mult = 1;
	} else if enemyCombo >= 5 && enemyCombo < 10 {
		if !global.MIND && global.PlayerChar != 0 {
			other.image_index = 1;
		} else {
			other.sprite_index = other.comboNames[1];
		}
		
		mult = 1.25;
	} else if enemyCombo >= 10 && enemyCombo < 15 {
		if !global.MIND && global.PlayerChar != 0 {
			other.image_index = 2;
		} else {
			other.sprite_index = other.comboNames[2];
		}
		
		mult = 1.5;
	} else if enemyCombo >= 15 && enemyCombo < 20 {
		if !global.MIND && global.PlayerChar != 0 {
			other.image_index = 3;
		} else {
			other.sprite_index = other.comboNames[3];
		}
		
		mult = 1.75;
	} else if enemyCombo >= 20 && enemyCombo < 30 {
		if !global.MIND && global.PlayerChar != 0 {
			other.image_index = 4;
		} else {
			other.sprite_index = other.comboNames[4];
		}
		
		mult = 2;
	} else if enemyCombo >= 30 && enemyCombo < 40 {
		if !global.MIND && global.PlayerChar != 0 {
			other.image_index = 5;
		} else {
			other.sprite_index = other.comboNames[5];
		}
		
		mult = 2.25;
	} else if enemyCombo >= 40 {
		if enemyCombo != 69 {
			if !global.MIND && global.PlayerChar != 0 {
				other.image_index = 6;
			} else {
				other.sprite_index = other.comboNames[6];
			}
			
			mult = 2.5;
		} else {
			if !global.MIND && global.PlayerChar != 0 {
				other.image_index = 7;
			} else {
				other.sprite_index = other.comboNames[7];
			}
			
			mult = 5;
		}
	}
}
