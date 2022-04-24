﻿// by nota

//com.sulake.habbo.room.object.visualization.avatar.additions.GameClickTarget

package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class GameClickTarget implements IAvatarAddition 
    {

        private static const WIDTH:int = 46;
        private static const HEIGHT:int = 60;
        private static const _SafeStr_8744:int = -23;
        private static const _SafeStr_8745:int = -48;

        private var _SafeStr_3820:int = -1;
        private var _bitmap:BitmapData;
        private var _disposed:Boolean;

        public function GameClickTarget(_arg_1:int)
        {
            _SafeStr_3820 = _arg_1;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _bitmap = null;
                _disposed = true;
            };
        }

        public function animate(_arg_1:IRoomObjectSprite):Boolean
        {
            return (false);
        }

        public function update(_arg_1:IRoomObjectSprite, _arg_2:Number):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!_bitmap)
            {
                _bitmap = new BitmapData(46, 60, true, 0);
            };
            _arg_1.visible = true;
            _arg_1.asset = _bitmap;
            _arg_1.offsetX = -23;
            _arg_1.offsetY = -48;
            _arg_1.alphaTolerance = -1;
        }


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_8744 = "_-h1U" (String#35655, DoABC#4)
// _SafeStr_8745 = "_-9h" (String#38720, DoABC#4)


