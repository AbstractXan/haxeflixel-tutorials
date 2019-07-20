package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;

 class Player extends FlxSprite
 {
    public var speed:Float = 200;

    // Update function is called every frame 
    override public function update(elapsed:Float):Void
            {
                // Thus movement logic will run every frame
                movement();
                super.update(elapsed);
            }

    // Constructor        
    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        makeGraphic(16, 16, FlxColor.BLUE);
        
        // Slows down the sprite when no movement
        drag.x = drag.y = 1600;
    }

    function movement():Void
    {
        // Declaring variables
        var _up:Bool = false;
        var _down:Bool = false;
        var _left:Bool = false;
        var _right:Bool = false;

        // When desired ey is pressed
        _up = FlxG.keys.anyPressed([UP, W]);
        _down = FlxG.keys.anyPressed([DOWN, S]);
        _left = FlxG.keys.anyPressed([LEFT, A]);
        _right = FlxG.keys.anyPressed([RIGHT, D]);

        //Cancel out opposite directions
        if (_up && _down)
            _up = _down = false;
        if (_left && _right)
            _left = _right = false;

        // If actually moving, set angle
        if (_up || _down || _left || _right){
            
            // Initialize angle
            var mA:Float = 0;            
            if (_up)
            {
                mA = -90;
                if (_left)
                    mA -= 45;
                else if (_right)
                    mA += 45;
            }
            else if (_down)
            {
                mA = 90;
                if (_left)
                    mA += 45;
                else if (_right)
                    mA -= 45;
            }
            else if (_left)
                mA = 180;
            else if (_right)
                mA = 0;
            
            //Add magnitude to the velocity vector in mA angle direction
            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0, 0), mA);
        }
    }
 }