﻿// by nota

//_-51c._SafeStr_255

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_255 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_255(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int)
        {
            this._SafeStr_6600 = [_arg_1, _arg_2, _arg_3, _arg_4, _arg_5];
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
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
}//package _-51c

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_255 = "_-j1K" (String#9596, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


