﻿// by nota

//com.sulake.habbo.avatar.animation.ISpriteDataContainer

package com.sulake.habbo.avatar.animation
{
    public /*dynamic*/ interface ISpriteDataContainer 
    {

        function get animation():IAnimation;
        function get id():String;
        function get ink():int;
        function get member():String;
        function get hasDirections():Boolean;
        function get hasStaticY():Boolean;
        function getDirectionOffsetX(_arg_1:int):int;
        function getDirectionOffsetY(_arg_1:int):int;
        function getDirectionOffsetZ(_arg_1:int):int;

    }
}//package com.sulake.habbo.avatar.animation

