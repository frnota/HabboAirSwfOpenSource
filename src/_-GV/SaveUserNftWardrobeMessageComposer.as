﻿// by nota

//_-GV.SaveUserNftWardrobeMessageComposer

package _-GV
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SaveUserNftWardrobeMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function SaveUserNftWardrobeMessageComposer(_arg_1:int)
        {
            _SafeStr_6600.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-GV

// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


