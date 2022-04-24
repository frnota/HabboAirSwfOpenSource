﻿// by nota

//com.sulake.habbo.navigator.UserCountRenderer

package com.sulake.habbo.navigator
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;

    public class UserCountRenderer 
    {

        public static const USERCOUNT_ELEMENT_NAME:String = "usercount";

        private var _navigator:_SafeStr_1697;

        public function UserCountRenderer(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
        }

        public function dispose():void
        {
            _navigator = null;
        }

        public function refreshUserCount(_arg_1:int, _arg_2:_SafeStr_3133, _arg_3:int, _arg_4:String, _arg_5:int, _arg_6:int):void
        {
            var _local_9:_SafeStr_3133 = _SafeStr_3133(_arg_2.findChildByName("usercount"));
            if (_local_9 == null)
            {
                _local_9 = _SafeStr_3133(_navigator.getXmlWindow("grs_usercount"));
                _local_9.name = "usercount";
                _local_9.x = _arg_5;
                _local_9.y = _arg_6;
                _arg_2.addChild(_local_9);
            };
            IInteractiveWindow(_local_9).toolTipCaption = _arg_4;
            var _local_7:ITextWindow = ITextWindow(_local_9.findChildByName("txt"));
            _local_7.text = ("" + _arg_3);
            var _local_8:String = this.getBgColor(_arg_1, _arg_3);
            refreshBg(_local_9, _local_8);
            _local_9.visible = true;
        }

        private function getBgColor(_arg_1:int, _arg_2:int):String
        {
            if (_arg_2 == 0)
            {
                return ("b");
            };
            if (isOverBgColorLimit(_arg_1, _arg_2, "red", 92))
            {
                return ("r");
            };
            if (isOverBgColorLimit(_arg_1, _arg_2, "orange", 80))
            {
                return ("o");
            };
            if (isOverBgColorLimit(_arg_1, _arg_2, "yellow", 50))
            {
                return ("y");
            };
            return ("g");
        }

        private function isOverBgColorLimit(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):Boolean
        {
            var _local_7:String = ("navigator.colorlimit." + _arg_3);
            var _local_6:int = _navigator.getInteger(_local_7, _arg_4);
            var _local_5:int = int(((_arg_1 * _local_6) / 100));
            return (_arg_2 >= _local_5);
        }

        private function refreshBg(_arg_1:_SafeStr_3133, _arg_2:String):void
        {
            var _local_3:* = null;
            var _local_4:_SafeStr_3264 = _SafeStr_3264(_arg_1.findChildByName("usercount_bg"));
            if (_local_4.tags[0] != _arg_2)
            {
                _local_4.tags.splice(0, _local_4.tags.length);
                _local_4.tags.push(_arg_2);
                _local_3 = ("usercount_fixed_" + _arg_2);
                _local_4.bitmap = _navigator.getButtonImage(_local_3);
                _local_4.disposesBitmap = false;
                _local_4.invalidate();
            };
        }

        private function refreshIcon(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean):void
        {
            _navigator.refreshButton(_arg_1, _arg_2, _arg_3, null, 0);
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)


