﻿// by nota

//_-Po._SafeStr_234

package _-Po
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_234 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_7503:Array = [];


        public function getMessageArray():Array
        {
            var _local_2:int;
            var _local_1:Array = [];
            _local_1.push(this._SafeStr_7503.length);
            _local_2 = 0;
            while (_local_2 < this._SafeStr_7503.length)
            {
                _local_1.push(this._SafeStr_7503[_local_2]);
                _local_2++;
            };
            return (_local_1);
        }

        public function addRemovedFriend(_arg_1:int):void
        {
            this._SafeStr_7503.push(_arg_1);
        }

        public function dispose():void
        {
            this._SafeStr_7503 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-Po

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_234 = "_-W11" (String#8659, DoABC#3)
// _SafeStr_7503 = "_-yU" (String#10634, DoABC#3)


