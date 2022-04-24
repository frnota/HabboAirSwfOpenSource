﻿// by nota

//com.sulake.core.window.utils.IEventQueue

package com.sulake.core.window.utils
{
    import flash.events.Event;

    public /*dynamic*/ interface IEventQueue 
    {

        function get length():uint;
        function begin():void;
        function next():Event;
        function remove():void;
        function end():void;
        function flush():void;

    }
}//package com.sulake.core.window.utils

