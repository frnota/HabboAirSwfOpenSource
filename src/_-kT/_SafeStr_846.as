﻿// by nota

//_-kT._SafeStr_846

package _-kT
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_846 implements IMessageComposer 
    {

        private var _SafeStr_7366:Array = [];

        public function _SafeStr_846(_arg_1:String, _arg_2:String)
        {
            _SafeStr_7366.push(_arg_1);
            _SafeStr_7366.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_7366);
        }

        public function dispose():void
        {
            _SafeStr_7366 = null;
        }


    }
}//package _-kT

// _SafeStr_7366 = "_-y1M" (String#10586, DoABC#3)
// _SafeStr_846 = "_-L1i" (String#7954, DoABC#3)


