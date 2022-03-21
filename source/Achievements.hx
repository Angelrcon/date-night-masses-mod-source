import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.text.FlxText;

using StringTools;

class Achievements {
	public static var achievementsStuff:Array<Dynamic> = [ //Name, Description, Achievement save tag, Hidden achievement
		["A New World",					"Play Date-Night Masses for the first time.",							'a_new_world',				false, 'a_new_world'],
		["Happy Ending",				"Beat the Date Week.",													'happy_ending',				false, 'date_week'],
		["In Ruv Suit",					"Beat Sticky Date Week.",												'ruv_suit',			 		false, 'coolmatins'],
		["Best Ending",					"Get the \"Best Ending\".",												'best_ending',				false, 'bestending'],
		["Buy His Membership",			"Get the Membership Ending.",											'buy_his_membership',		false,	'membershipending'],
		["No Tables allowed",			"Beat vibe Check Week.",												'no_tables_allowed',		false,	'kikyotable'],
		["Hi Chat",						"Get the streamer easter egg on the pause menu.",						'hi_chat',			 		false,	'hi_chat'],
		["Best Team",					"Check all team members",												'best_team',				false,	'checkallteam'],
		["Dawn of a New Day",			"Beat Matins on Hard with 10 or less misses.",							'dawn_of_a_new_day',		false,	'matins_10_misses_or_less'],
		["His Guardian Angel",			"Beat Serafim on Hard with 10 or less misses.",							'his_guardian_angel',		false,	'serafim_10_misses_or_less'],
		["Two Harmonies, One Song",		"Beat Harmony on Hard with 10 or less misses.",							'two_harmonies_one_song',	false,	'harmony_10_misses_or_less'],
		["Our Final Hymn",				"Beat Clandestine-Ditty on Hard with 10 or less misses.",				'our_final_hymn',			false,	'cl_10_misses_or_less'],
		["Together Forever",			"Beat Together on Hard with 10 or less misses.",						'together_forever',			false,	'together_10_misses_or_less'],
		["Whitty Reference",			"Beat Rosebass on Hard with 10 or less misses.",						'whitty_reference',			false,	'rosebass'],
		["Certified No Skill Issue",	"Get all \"10 misses or less\" Achievements.",							'no_skill_issue',			false,	'10_or_less_all'],
		["Completionist",				"Get all the Achievements.\n(reload the game if necessary)",			'completionist',			false,	'completionist'],
		["You made her cry",			"Complete a Song with Sarv, Ruv and Health lower than 20%.",			'you_made_her_cry',			false,	'20_or_less'],
		["Ultimate Domination",			"Beat archkikyo with 50 misses or more.",								'ultimate_domination',		false,	'dominance'],
		["POGGERS",						"Get the Pog Chair on the kitchen. (20%)",								'poggers',				 	false,	'poggers'],
		["Choco Approves",				"Get the Wheelchair Ruv background. (10%)",								'choco_approves',			false,	'wheelchair_ruv'],
		["Sorv",						"Get the Sorv portrait (1%).",											'sarv_ronv',				false,	'Sorv'],
		["Ronv",						"Get the Ronv portrait (1%).",											'ruv_ronv',					false,	'ronv']
	];
	public static var achievementsMap:Map<String, Bool> = new Map<String, Bool>();

	public static var henchmenDeath:Int = 0;
	public static function unlockAchievement(name:String):Void {
		FlxG.log.add('Completed achievement "' + name +'"');
		achievementsMap.set(name, true);
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	}

	public static function checkAll(achievesToCheck:Array<String>):Bool {
		for (i in 0...achievesToCheck.length) {
			var achievementName:String = achievesToCheck[i];
			if (!Achievements.isAchievementUnlocked(achievementName)) {
				return false;
			}
		}
		return true;
	}

	public static function isAchievementUnlocked(name:String) {
		if(achievementsMap.exists(name) && achievementsMap.get(name)) {
			return true;
		}
		return false;
	}

	public static function getAchievementIndex(name:String) {
		for (i in 0...achievementsStuff.length) {
			if(achievementsStuff[i][2] == name) {
				return i;
			}
		}
		return -1;
	}

	public static function loadAchievements():Void {
		if(FlxG.save.data != null) {
			if(FlxG.save.data.achievementsMap != null) {
				achievementsMap = FlxG.save.data.achievementsMap;
			}
			if(FlxG.save.data.achievementsUnlocked != null) {
				FlxG.log.add("Trying to load stuff");
				var savedStuff:Array<String> = FlxG.save.data.achievementsUnlocked;
				for (i in 0...savedStuff.length) {
					achievementsMap.set(savedStuff[i], true);
				}
			}
			if(henchmenDeath == 0 && FlxG.save.data.henchmenDeath != null) {
				henchmenDeath = FlxG.save.data.henchmenDeath;
			}
		}

		// You might be asking "Why didn't you just fucking load it directly dumbass??"
		// Well, Mr. Smartass, consider that this class was made for Mind Games Mod's demo,
		// i'm obviously going to change the "Psyche" achievement's objective so that you have to complete the entire week
		// with no misses instead of just Psychic once the full release is out. So, for not having the rest of your achievements lost on
		// the full release, we only save the achievements' tag names instead. This also makes me able to rename
		// achievements later as long as the tag names aren't changed of course.

		// Edit: Oh yeah, just thought that this also makes me able to change the achievements orders easier later if i want to.
		// So yeah, if you didn't thought about that i'm smarter than you, i think

		// buffoon
	}
}

class AttachedAchievement extends FlxSprite {
	public var sprTracker:FlxSprite;
	private var tag:String;
	public function new(x:Float = 0, y:Float = 0, name:String) {
		super(x, y);

		changeAchievement(name);
		antialiasing = ClientPrefs.globalAntialiasing;
	}

	public function changeAchievement(tag:String) {
		this.tag = tag;
		reloadAchievementImage();
	}

	public function reloadAchievementImage() {
		if(Achievements.isAchievementUnlocked(tag)) {
			loadGraphic(Paths.image('achievementgrid'), true, 150, 150);
			animation.add('icon', [Achievements.getAchievementIndex(tag)], 0, false, false);
			animation.play('icon');
		} else {
			loadGraphic(Paths.image('lockedachievement'));
		}
		scale.set(0.7, 0.7);
		updateHitbox();
	}

	override function update(elapsed:Float) {
		if (sprTracker != null)
			setPosition(sprTracker.x - 130, sprTracker.y + 25);

		super.update(elapsed);
	}
}

class AchievementObject extends FlxSpriteGroup {
	public var onFinish:Void->Void = null;
	var alphaTween:FlxTween;
	public function new(name:String, ?camera:FlxCamera = null)
	{
		super(x, y);
		ClientPrefs.saveSettings();

		var id:Int = Achievements.getAchievementIndex(name);
		var achievementBG:FlxSprite = new FlxSprite(60, 50).makeGraphic(420, 120, FlxColor.BLACK);
		achievementBG.scrollFactor.set();

		var achievementIcon:FlxSprite = new FlxSprite(achievementBG.x + 10, achievementBG.y + 10).loadGraphic(Paths.image('achievementgrid'), true, 150, 150);
		achievementIcon.animation.add('icon', [id], 0, false, false);
		achievementIcon.animation.play('icon');
		achievementIcon.scrollFactor.set();
		achievementIcon.setGraphicSize(Std.int(achievementIcon.width * (2 / 3)));
		achievementIcon.updateHitbox();
		achievementIcon.antialiasing = ClientPrefs.globalAntialiasing;

		var achievementName:FlxText = new FlxText(achievementIcon.x + achievementIcon.width + 20, achievementIcon.y + 16, 280, Achievements.achievementsStuff[id][0], 16);
		achievementName.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT);
		achievementName.scrollFactor.set();

		var achievementText:FlxText = new FlxText(achievementName.x, achievementName.y + 32, 280, Achievements.achievementsStuff[id][1], 16);
		if (achievementName.text == 'A New World' || achievementName.text == 'Happy Ending') {
			achievementText.text += "\ncome check your reward.";
		}
		achievementText.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT);
		achievementText.scrollFactor.set();

		add(achievementBG);
		add(achievementName);
		add(achievementText);
		add(achievementIcon);

		var cam:Array<FlxCamera> = FlxCamera.defaultCameras;
		if(camera != null) {
			cam = [camera];
		}
		alpha = 0;
		achievementBG.cameras = cam;
		achievementName.cameras = cam;
		achievementText.cameras = cam;
		achievementIcon.cameras = cam;
		alphaTween = FlxTween.tween(this, {alpha: 1}, 0.5, {onComplete: function (twn:FlxTween) {
			alphaTween = FlxTween.tween(this, {alpha: 0}, 0.5, {
				startDelay: 2.5,
				onComplete: function(twn:FlxTween) {
					alphaTween = null;
					remove(this);
					if(onFinish != null) onFinish();
				}
			});
		}});
	}

	override function destroy() {
		if(alphaTween != null) {
			alphaTween.cancel();
		}
		super.destroy();
	}
}