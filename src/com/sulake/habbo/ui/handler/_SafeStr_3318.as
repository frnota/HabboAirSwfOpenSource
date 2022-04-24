﻿// by nota

//com.sulake.habbo.ui.handler._SafeStr_3318

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import com.sulake.core.runtime._SafeStr_20;
    import flash.events.Event;

    public class _SafeStr_3318 implements IRoomWidgetHandler 
    {

        private static const INTERNAL_LINK_KEY:String = "internalLink";

        private var _container:IRoomWidgetHandlerContainer;


        public function get type():String
        {
            return ("RWE_INTERNAL_LINK");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function getWidgetMessages():Array
        {
            return (null);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return (["RETWE_REQUEST_INTERNAL_LINK"]);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            switch (_arg_1.type)
            {
                case "RETWE_REQUEST_INTERNAL_LINK":
                    _local_5 = (_arg_1 as RoomEngineToWidgetEvent);
                    if (((!(_arg_1 == null)) && (!(_container.roomEngine == null))))
                    {
                        _local_2 = _container.roomEngine.getRoomObject(_local_5.roomId, _local_5.objectId, _local_5.category);
                        if (_local_2 != null)
                        {
                            _local_4 = _local_2.getModel();
                            _local_3 = _local_4.getStringToStringMap("furniture_data").getValue("internalLink");
                            if (((_local_3 == null) || (_local_3.length == 0)))
                            {
                                _local_3 = _local_4.getString("furniture_internal_link");
                            };
                            if (((!(_local_3 == null)) && (_local_3.length > 0)))
                            {
                                (_container.roomEngine as _SafeStr_20).context.createLinkEvent(_local_3);
                            };
                        };
                    };
                    return;
            };
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            _container = null;
        }

        public function get disposed():Boolean
        {
            return (_container == null);
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_3318 = "_-9E" (String#15742, DoABC#4)


