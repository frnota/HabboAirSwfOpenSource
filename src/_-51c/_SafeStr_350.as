﻿// by nota

//_-51c._SafeStr_350

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_350 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_350(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Array)
        {
            this._SafeStr_6600.push(_arg_1);
            this._SafeStr_6600.push(_arg_2);
            this._SafeStr_6600.push(_arg_3);
            this._SafeStr_6600.push(_arg_4);
            this._SafeStr_6600.push((_arg_5.length / 2));
            this._SafeStr_6600 = this._SafeStr_6600.concat(_arg_5);
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
// _SafeStr_350 = "_-713" (String#7009, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


