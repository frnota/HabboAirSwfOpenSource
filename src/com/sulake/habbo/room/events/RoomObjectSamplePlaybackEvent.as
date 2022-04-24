﻿// by nota

//com.sulake.habbo.room.events.RoomObjectSamplePlaybackEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectSamplePlaybackEvent extends RoomObjectFurnitureActionEvent 
    {

        public static const ROOM_OBJECT_INITIALIZED:String = "ROPSPE_ROOM_OBJECT_INITIALIZED";
        public static const ROOM_OBJECT_DISPOSED:String = "ROPSPE_ROOM_OBJECT_DISPOSED";
        public static const PLAY_SAMPLE:String = "ROPSPE_PLAY_SAMPLE";
        public static const CHANGE_PITCH:String = "ROPSPE_CHANGE_PITCH";

        private var _SafeStr_4841:int;
        private var _SafeStr_4407:Number;

        public function RoomObjectSamplePlaybackEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:int, _arg_4:Number=1, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_5, _arg_6);
            _SafeStr_4841 = _arg_3;
            _SafeStr_4407 = _arg_4;
        }

        public function get sampleId():int
        {
            return (_SafeStr_4841);
        }

        public function get pitch():Number
        {
            return (_SafeStr_4407);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4407 = "_-E1T" (String#3270, DoABC#4)
// _SafeStr_4841 = "_-81Q" (String#5100, DoABC#4)


