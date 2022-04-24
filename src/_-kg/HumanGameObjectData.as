﻿// by nota

//_-kg.HumanGameObjectData

package _-kg
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanGameObjectData extends SnowWarGameObjectData 
    {

        public static const _SafeStr_7359:int = 19;

        private var _name:String;
        private var _mission:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_6381:String;

        public function HumanGameObjectData(_arg_1:int, _arg_2:int)
        {
            super(_arg_1, _arg_2);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get mission():String
        {
            return (_mission);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get sex():String
        {
            return (_SafeStr_6381);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            parseVariables(_arg_1, 19);
            _name = _arg_1.readString();
            _mission = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_6381 = _arg_1.readString();
            _SafeStr_14.log(("Parsed human game object data, variables:" + _SafeStr_7360));
        }

        public function get currentLocationX():int
        {
            return (getVariable(2));
        }

        public function get currentLocationY():int
        {
            return (getVariable(3));
        }

        public function get currentTileX():int
        {
            return (getVariable(4));
        }

        public function get currentTileY():int
        {
            return (getVariable(5));
        }

        public function get bodyDirection():int
        {
            return (getVariable(6));
        }

        public function get hitPoints():int
        {
            return (getVariable(7));
        }

        public function get snowBallCount():int
        {
            return (getVariable(8));
        }

        public function get isBot():int
        {
            return (getVariable(9));
        }

        public function get activityTimer():int
        {
            return (getVariable(10));
        }

        public function get activityState():int
        {
            return (getVariable(11));
        }

        public function get nextTileX():int
        {
            return (getVariable(12));
        }

        public function get nextTileY():int
        {
            return (getVariable(13));
        }

        public function get moveTargetX():int
        {
            return (getVariable(14));
        }

        public function get moveTargetY():int
        {
            return (getVariable(15));
        }

        public function get score():int
        {
            return (getVariable(16));
        }

        public function get team():int
        {
            return (getVariable(17));
        }

        public function get userId():int
        {
            return (getVariable(18));
        }


    }
}//package _-kg

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_6381 = "_-51T" (String#6885, DoABC#3)
// _SafeStr_7359 = "_-XY" (String#8809, DoABC#3)
// _SafeStr_7360 = "_-k1R" (String#9676, DoABC#3)


