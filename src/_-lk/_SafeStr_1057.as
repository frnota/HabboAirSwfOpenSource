﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-lk._SafeStr_1057

package _-lk
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1057 implements IMessageParser 
    {

        private var _SafeStr_4028:int;
        private var _duration:int;
        private var _SafeStr_6048:Boolean;


        public function flush():Boolean
        {
            _SafeStr_4028 = 0;
            _duration = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4028 = _arg_1.readInteger();
            _duration = _arg_1.readInteger();
            _SafeStr_6048 = _arg_1.readBoolean();
            return (true);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get duration():int
        {
            return (_duration);
        }

        public function get isPermanent():Boolean
        {
            return (_SafeStr_6048);
        }


    }
}//package _-lk

// _SafeStr_1057 = "_-6X" (String#6992, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_6048 = "_-Vc" (String#8644, DoABC#3)

