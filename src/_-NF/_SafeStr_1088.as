﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1088

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-W1K._SafeStr_1479;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1088 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1479;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1479(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1479
        {
            return (_SafeStr_3740);
        }


    }
}//package _-NF

// _SafeStr_1088 = "_-u1R" (String#10315, DoABC#3)
// _SafeStr_1479 = "_-hd" (String#9502, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)

