global.font_main = font_add_sprite_ext(spr_TBAHSFontEnglishLatam, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ÑñÁáÉéÍíÓóÚúÜü¡¿", true, 1);
global.TrickFont = font_add_sprite_ext(spr_TrickComboNumbers, "0123456789", true, 1);
global.TimerFont = font_add_sprite_ext(spr_HUDTimer, "0123456789.:", true, 0);
global.CheckpointTimerFont = font_add_sprite_ext(spr_CheckpointTimer, "0123456789.:", true, 0);
global.CheckpointTimerFontHead = font_add_sprite_ext(spr_CheckpointTimerHead, "0123456789:.", true, 0);
global.LifeFont = font_add_sprite_ext(spr_LifeFont, "/x-+0123456789", true, 0);
global.EnemyComboFont = font_add_sprite_ext(spr_EnemyComboFont, "0123456789.:,", true, -3);
global.EnemyComboFontHead = font_add_sprite_ext(spr_EnemyComboFontHead, "0123456789:.,", true, 0);
global.BoomboxFont = font_add_sprite_ext(spr_BoomboxNum, "0123456789CU", true, -2);

global.ColTime = 0;

recordGIF = false;
gifID = noone;