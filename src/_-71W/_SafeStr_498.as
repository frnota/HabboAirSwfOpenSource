﻿// by nota

//_-71W._SafeStr_498

package _-71W
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_498 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_498(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_6600.push(_arg_3);
            _SafeStr_6600.push(_arg_2);
            _SafeStr_6600.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-71W

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_498 = "_-51X" (String#6887, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


