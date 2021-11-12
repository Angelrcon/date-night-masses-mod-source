import flixel.input.gamepad.FlxGamepad;
import openfl.Lib;
import flixel.FlxG;

class KadeEngineData
{
	public static var trophies_unlocked:Array<Bool> = [false, false, false, false, false, false, false, false, false, false];

    public static function initSave()
    {
        if (FlxG.save.data.weekUnlocked == null)
			FlxG.save.data.weekUnlocked = 7;

		if (FlxG.save.data.fState == null)
			FlxG.save.data.fState = 0;

		if (FlxG.save.data.fState == null)
			FlxG.save.data.fState = 0;

		if (FlxG.save.data.gjUser == null)
			FlxG.save.data.gjUser = "";

		if (FlxG.save.data.gjToken == null)
			FlxG.save.data.gjToken = "";

		if (FlxG.save.data.newInput == null)
			FlxG.save.data.newInput = true;

		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.antialiasing == null)
			FlxG.save.data.antialiasing = true;

		if (FlxG.save.data.missSounds == null)
			FlxG.save.data.missSounds = true;

		if (FlxG.save.data.dfjk == null)
			FlxG.save.data.dfjk = false;
			
		if (FlxG.save.data.accuracyDisplay == null)
			FlxG.save.data.accuracyDisplay = true;

		if (FlxG.save.data.offset == null)
			FlxG.save.data.offset = 0;

		if (FlxG.save.data.songPosition == null)
			FlxG.save.data.songPosition = false;

		if (FlxG.save.data.fps == null)
			FlxG.save.data.fps = false;

		if (FlxG.save.data.changedHit == null)
		{
			FlxG.save.data.changedHitX = -1;
			FlxG.save.data.changedHitY = -1;
			FlxG.save.data.changedHit = false;
		}

		if (FlxG.save.data.fpsRain == null)
			FlxG.save.data.fpsRain = false;

		if (FlxG.save.data.fpsCap == null)
			FlxG.save.data.fpsCap = 120;

		if (FlxG.save.data.fpsCap > 285 || FlxG.save.data.fpsCap < 60)
			FlxG.save.data.fpsCap = 120; // baby proof so you can't hard lock ur copy of kade engine
		
		if (FlxG.save.data.scrollSpeed == null)
			FlxG.save.data.scrollSpeed = 1;

		if (FlxG.save.data.npsDisplay == null)
			FlxG.save.data.npsDisplay = false;

		if (FlxG.save.data.frames == null)
			FlxG.save.data.frames = 10;

		if (FlxG.save.data.accuracyMod == null)
			FlxG.save.data.accuracyMod = 1;

		if (FlxG.save.data.watermark == null)
			FlxG.save.data.watermark = true;

		if (FlxG.save.data.ghost == null)
			FlxG.save.data.ghost = true;

		if (FlxG.save.data.distractions == null)
			FlxG.save.data.distractions = true;
		
	    	if (FlxG.save.data.colour == null)
			FlxG.save.data.colour = true;
		
	        if (FlxG.save.data.stepMania == null)
			FlxG.save.data.stepMania = false;

		if (FlxG.save.data.flashing == null)
			FlxG.save.data.flashing = true;

		if (FlxG.save.data.resetButton == null)
			FlxG.save.data.resetButton = false;

		if (FlxG.save.data.InstantRespawn == null)
			FlxG.save.data.InstantRespawn = false;
		
		if (FlxG.save.data.botplay == null)
			FlxG.save.data.botplay = false;

		if (FlxG.save.data.cpuStrums == null)
			FlxG.save.data.cpuStrums = false;

		if (FlxG.save.data.strumline == null)
			FlxG.save.data.strumline = false;
		
		if (FlxG.save.data.customStrumLine == null)
			FlxG.save.data.customStrumLine = 0;

		if (FlxG.save.data.camzoom == null)
			FlxG.save.data.camzoom = true;

		if (FlxG.save.data.scoreScreen == null)
			FlxG.save.data.scoreScreen = true;

		if (FlxG.save.data.inputShow == null)
			FlxG.save.data.inputShow = false;

		if (FlxG.save.data.optimize == null)
			FlxG.save.data.optimize = false;
		
		if (FlxG.save.data.cacheImages == null)
			FlxG.save.data.cacheImages = false;

		if (FlxG.save.data.editorBG == null)
			FlxG.save.data.editor = false;
		
		if (FlxG.save.data.zoom == null)
			FlxG.save.data.zoom = 1;

		//trophies
		if (FlxG.save.data.trophy1 == null)
			FlxG.save.data.trophy1 = false;
		else if (FlxG.save.data.trophy1) {trophies_unlocked[0] = true;}

		if (FlxG.save.data.trophy2 == null)
			FlxG.save.data.trophy2 = false;
		else if (FlxG.save.data.trophy2) {trophies_unlocked[1] = true;}

		if (FlxG.save.data.trophy3 == null)
			FlxG.save.data.trophy3 = false;
		else if (FlxG.save.data.trophy3) {trophies_unlocked[2] = true;}

		if (FlxG.save.data.trophy4 == null)
			FlxG.save.data.trophy4 = false;
		else if (FlxG.save.data.trophy4) {trophies_unlocked[3] = true;}

		if (FlxG.save.data.trophy5 == null)
			FlxG.save.data.trophy5 = false;
		else if (FlxG.save.data.trophy5) {trophies_unlocked[4] = true;}

		if (FlxG.save.data.trophy6 == null)
			FlxG.save.data.trophy6 = false;
		else if (FlxG.save.data.trophy6) {trophies_unlocked[5] = true;}

		if (FlxG.save.data.trophy7 == null)
			FlxG.save.data.trophy7 = false;
		else if (FlxG.save.data.trophy7) {trophies_unlocked[6] = true;}

		if (FlxG.save.data.trophy8 == null)
			FlxG.save.data.trophy8 = false;
		else if (FlxG.save.data.trophy8) {trophies_unlocked[7] = true;}

		if (FlxG.save.data.trophy9 == null)
			FlxG.save.data.trophy9 = false;
		else if (FlxG.save.data.trophy9) {trophies_unlocked[8] = true;}

		if (FlxG.save.data.trophy10 == null)
			FlxG.save.data.trophy10 = false;
		else if (FlxG.save.data.trophy10) {trophies_unlocked[9] = true;}

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		
		KeyBinds.gamepad = gamepad != null;

		Conductor.recalculateTimings();
		PlayerSettings.player1.controls.loadKeyBinds();
		KeyBinds.keyCheck();

		Main.watermarks = FlxG.save.data.watermark;

		(cast (Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);
	}
}
