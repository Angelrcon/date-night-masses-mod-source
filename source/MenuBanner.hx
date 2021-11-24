package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class MenuBanner extends FlxSpriteGroup
{
	public var targetY:Float = 0;
	public var week:FlxSprite;
	public var flashingInt:Int = 0;
	public var weekNum:Int = 0;

	public function new(weekNum:Int = 0)
	{
		super();
		this.weekNum = weekNum;
		week = new FlxSprite(0, 56).loadGraphic(Paths.image('weekBanners/week' + weekNum, 'date-night masses'));
		week.antialiasing = FlxG.save.data.antialiasing;
		add(week);
	}

	private var isFlashing:Bool = false;

	public function startFlashing():Void
	{
		isFlashing = true;
	}

	// if it runs at 60fps, fake framerate will be 6
	// if it runs at 144 fps, fake framerate will be like 14, and will update the graphic every 0.016666 * 3 seconds still???
	// so it runs basically every so many seconds, not dependant on framerate??
	// I'm still learning how math works thanks whoever is reading this lol
	var fakeFramerate:Int = Math.round((1 / FlxG.elapsed) / 10);

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		// y = FlxMath.lerp(y, (targetY * 120) + 480, 0.17 * (60 / FlxG.save.data.fpsCap));

		// if (isFlashing)
		//	flashingInt += 1;

		// if (flashingInt % fakeFramerate >= Math.floor(fakeFramerate / 2))
		//	week.color = 0xFF33ffff;
		// else if (FlxG.save.data.flashing)
		//	week.color = FlxColor.WHITE;
	}
}
