﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-JS._SafeStr_575

package _-JS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1405;

    [SecureSWF(rename="true")]
    public class _SafeStr_575 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_575(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1405);
        }

        public function getParser():_SafeStr_1405
        {
            return (this._SafeStr_7012 as _SafeStr_1405);
        }


    }
}//package _-JS

// _SafeStr_1405 = "_-mr" (String#9842, DoABC#3)
// _SafeStr_575 = "_-m1T" (String#9804, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)

