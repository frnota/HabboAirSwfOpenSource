﻿// by nota

//com.sulake.habbo.tracking._SafeStr_1704

package com.sulake.habbo.tracking
{
    import com.sulake.core.runtime.IUnknown;

    public /*dynamic*/ interface _SafeStr_1704 extends IUnknown 
    {

        function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void;
        function legacyTrackGoogle(_arg_1:String, _arg_2:String, _arg_3:Array=null):void;
        function logError(_arg_1:String):void;
        function chatLagDetected(_arg_1:int):void;
        function trackEventLog(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void;
        function trackEventLogOncePerSession(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void;
        function trackTalentTrackOpen(_arg_1:String, _arg_2:String):void;

    }
}//package com.sulake.habbo.tracking

// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)


