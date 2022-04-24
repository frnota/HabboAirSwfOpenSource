﻿// by nota

//com.sulake.habbo.friendbar.view.utils.MessengerIcon

package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.events.TimerEvent;

    public class MessengerIcon extends Icon 
    {

        private static const _SafeStr_8583:int = 500;

        private var _assets:_SafeStr_21;

        public function MessengerIcon(_arg_1:_SafeStr_21, _arg_2:_SafeStr_3264)
        {
            _assets = _arg_1;
            alignment = (0x01 | 0x08);
            image = (_arg_1.getAssetByName("icon_messenger_png") as BitmapDataAsset);
            canvas = _arg_2;
        }

        override public function notify(_arg_1:Boolean):void
        {
            super.notify(_arg_1);
            image = (_assets.getAssetByName(((_arg_1) ? "icon_messenger_notify_1_png" : "icon_messenger_png")) as BitmapDataAsset);
            toggleTimer(_arg_1, 500);
        }

        override public function hover(_arg_1:Boolean):void
        {
            super.hover(_arg_1);
        }

        override public function enable(_arg_1:Boolean):void
        {
            super.enable(_arg_1);
            canvas.visible = _arg_1;
        }

        override protected function onTimerEvent(_arg_1:TimerEvent):void
        {
            if (_SafeStr_4135)
            {
                _frame = ((_frame == 1) ? 0 : 1);
                image = (_assets.getAssetByName((("icon_messenger_notify_" + _frame) + "_png")) as BitmapDataAsset);
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.utils

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4135 = "_-C1J" (String#5687, DoABC#4)
// _SafeStr_8583 = "_-12q" (String#29454, DoABC#4)


