﻿// by nota

//_-XO._SafeStr_946

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_946 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_946(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-XO

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_946 = "_-91a" (String#7169, DoABC#3)


