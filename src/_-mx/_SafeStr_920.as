﻿// by nota

//_-mx._SafeStr_920

package _-mx
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.util.Byte;

    [SecureSWF(rename="true")]
    public class _SafeStr_920 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_920(_arg_1:int)
        {
            _SafeStr_6600.push(new Byte(_arg_1));
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
}//package _-mx

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_920 = "_-6Z" (String#6993, DoABC#3)


