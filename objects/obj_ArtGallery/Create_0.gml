depth = -5;

scr_MusicTag();
set_song_ingame(mus_UnwindaBit);

colChoice = false;
colNum = 0;
colTimer = 240;

chosenGallery = false;
galleryChoice = 0;
artChoice = 0;

zoomChoice = false;
zoomAlpha = 1;
zoomed = 0;

galleries = [
	"gall_Art",
	"gall_FanArt",
	"gall_Concept",
	"gall_Unused",
	"gall_Cats",
]

gallArt = [
	[spr_GallRenTaylor, "art_RenTJ"],
	[spr_GallRenTaylorB, "art_RenTJB"],
	[spr_GallRenAyana, "art_RenAA"],
	[spr_GallRenAyanaB, "art_RenAAB"],
	[spr_GallRenRoxxie, "art_RenRG"],
	[spr_GallRenRoxxie2, "art_RenRG2"],
	[spr_GallRenLucifer, "art_RenLC"],
	[spr_GallGradKap, "art_GradKap"],
	[spr_GallRidersKap, "art_RidersK"],
	[spr_GallRidersSar, "art_RidersS"],
	[spr_GallRidersRus, "art_RidersR"],
	[spr_GallRidersIvy, "art_RidersI"],
	[spr_GallSplash010, "art_Splash010"],
	[spr_GallSplash020, "art_Splash020"],
	[spr_GallSplash025, "art_Splash025"],
	[spr_GallSplash030SAGE25, "art_SplashSAGE25030"],
	[spr_GallAlbumV1P1, "art_AlbumV1P1"],
	[spr_GallAlbumV1P2, "art_AlbumV1P2"],
	[spr_GallAlbumV1P2Old, "art_AlbumV1P2Old"],
	[spr_GallAlbumV2P1, "art_AlbumV2P1"],
	[spr_GallAlbumV2P2, "art_AlbumV2P2"],
]

gallFanArt = [
	[spr_FanSarah, "fan_Sarah"],
	[spr_FanPeanutSarah, "fan_PeaSar"],
	[spr_FanSkelKappa, "fan_SkelKap"],
	[spr_FanSkelSarah, "fan_SkelSar"],
	[spr_FanRush, "fan_Rush"],
	[spr_FanSonicRush, "fan_SonicRush"],
	[spr_FanHedgehog, "fan_Hedge"],
	[spr_FanCats, "fan_Cats"],
	[spr_FanKapMINDExit, "fan_MINDExit"],
	[spr_FanMIND, "fan_MIND"],
	[spr_FanKapReels, "fan_KapReels"],
	[spr_FanTitle, "fan_Title"],
	[spr_FanSarFish, "fan_SarFish"],
	[spr_FanKapPussy, "fan_KapPussy"],
	[spr_FanDSCase, "fan_DSCase"],
]

gallConcept = [
	[spr_ConResults, "con_Results"],
]

gallUnused = [
	[spr_UnKapHeadPreRank, "un_KapPre"],
	[spr_UnKapHeadShitRank, "un_KapShit"],
	[spr_UnKapHeadGoodRank, "un_KapGood"],
	[spr_UnKapHeadSICKRank, "un_KapSICK"],
	[spr_UnV1Akira2, "un_V1AK"],
	[spr_UnV1Akira, "un_V1AK2"],
]

gallCats = [
	[spr_Saiyan, "cat_Saiyan"],
	[spr_CatSolar, "cat_Solar"],
]

gallAnim = 0;
gallFrames = 1;

moveTimer = 1;
moveFrames = 12;

extraX = -400;

moveX = 0;
moveY = 0;

gallX = 0;

leftArrow = false;
leftFrames = 0;

rightArrow = false;
rightFrames = 0;