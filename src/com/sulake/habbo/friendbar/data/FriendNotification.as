﻿// by nota

//com.sulake.habbo.friendbar.data.FriendNotification

package com.sulake.habbo.friendbar.data
{
    public class FriendNotification implements IFriendNotification 
    {

        public static const TYPE_MESSENGER:int = -1;
        public static const _SafeStr_8542:int = 0;
        public static const _SafeStr_8543:int = 1;
        public static const TYPE_QUEST:int = 2;
        public static const TYPE_PLAYING_GAME:int = 3;
        public static const TYPE_FINISHED_GAME:int = 4;

        private var _SafeStr_6095:int = -1;
        private var _SafeStr_4132:String;
        private var _SafeStr_6096:Boolean;

        public function FriendNotification(_arg_1:int, _arg_2:String, _arg_3:Boolean)
        {
            this._SafeStr_6095 = _arg_1;
            this._SafeStr_4132 = _arg_2;
            this._SafeStr_6096 = _arg_3;
        }

        public static function typeCodeToString(_arg_1:int):String
        {
            switch (_arg_1)
            {
                case -1:
                    return ("instant_message");
                case 0:
                    return ("room_event");
                case 1:
                    return ("achievement");
                case 2:
                    return ("quest");
                case 3:
                    return ("playing_game");
                case 4:
                    return ("finished_game");
                default:
                    return ("unknown");
            };
        }


        public function get typeCode():int
        {
            return (_SafeStr_6095);
        }

        public function set typeCode(_arg_1:int):void
        {
            _SafeStr_6095 = _arg_1;
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function set message(_arg_1:String):void
        {
            _SafeStr_4132 = _arg_1;
        }

        public function get viewOnce():Boolean
        {
            return (_SafeStr_6096);
        }

        public function set viewOnce(_arg_1:Boolean):void
        {
            _SafeStr_6096 = _arg_1;
        }


    }
}//package com.sulake.habbo.friendbar.data

// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_6095 = "_-e12" (String#15108, DoABC#4)
// _SafeStr_6096 = "_-41D" (String#14831, DoABC#4)
// _SafeStr_8542 = "_-4h" (String#38586, DoABC#4)
// _SafeStr_8543 = "_-P1n" (String#41317, DoABC#4)


