package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;

class MenuState extends FlxState
{
	
	var _btnPlay:FlxButton;
	
	override public function create():Void
	{
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
 		add(_btnPlay);
		super.create();
	}

	//Play button is clicked
	function clickPlay():Void
 	{
		//Switched state from current to PlayState
    	FlxG.switchState(new PlayState());
 	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
