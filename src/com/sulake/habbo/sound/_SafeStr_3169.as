﻿// by nota

//com.sulake.habbo.sound._SafeStr_3169

package com.sulake.habbo.sound
{
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface _SafeStr_3169 
    {

        function getRoomItemPlaylist(_arg_1:int=-1):_SafeStr_3348;
        function getSongDiskInventorySize():int;
        function getSongDiskInventoryDiskId(_arg_1:int):int;
        function getSongDiskInventorySongId(_arg_1:int):int;
        function getSongInfo(_arg_1:int):ISongInfo;
        function getSongIdPlayingAtPriority(_arg_1:int):int;
        function playSong(_arg_1:int, _arg_2:int, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Number=0.5, _arg_6:Number=0.5):Boolean;
        function stop(_arg_1:int):void;
        function addSongInfoRequest(_arg_1:int):void;
        function requestSongInfoWithoutSamples(_arg_1:int):void;
        function requestUserSongDisks():void;
        function onSongLoaded(_arg_1:int):void;
        function updateVolume(_arg_1:Number):void;
        function samplesUnloaded(_arg_1:Array):void;
        function get samplesIdsInUse():Array;
        function get events():IEventDispatcher;
        function dispose():void;

    }
}//package com.sulake.habbo.sound

// _SafeStr_3169 = "_-KZ" (String#5121, DoABC#4)
// _SafeStr_3348 = "_-Fw" (String#4529, DoABC#4)


