﻿// by nota

//_-p1Y._SafeStr_619

package _-p1Y
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_619 implements IMessageComposer 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_3693:int = 0;
        private var _SafeStr_7491:String;

        public function _SafeStr_619(_arg_1:int, _arg_2:String, _arg_3:int=0)
        {
            _SafeStr_4128 = _arg_1;
            _SafeStr_3693 = _arg_3;
            _SafeStr_7491 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4128, _SafeStr_3693, _SafeStr_7491]);
        }


    }
}//package _-p1Y

// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_619 = "_-PJ" (String#8262, DoABC#3)
// _SafeStr_7491 = "_-dp" (String#9248, DoABC#3)


