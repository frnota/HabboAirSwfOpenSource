﻿// by nota

//_-TT._SafeStr_1377

package _-TT
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1377 implements IMessageParser 
    {

        private var _boxColor:String;
        private var _keyColor:String;


        public function flush():Boolean
        {
            _boxColor = null;
            _keyColor = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _boxColor = _arg_1.readString();
            _keyColor = _arg_1.readString();
            return (true);
        }

        public function get boxColor():String
        {
            return (_boxColor);
        }

        public function get keyColor():String
        {
            return (_keyColor);
        }


    }
}//package _-TT

// _SafeStr_1377 = "_-My" (String#8046, DoABC#3)


