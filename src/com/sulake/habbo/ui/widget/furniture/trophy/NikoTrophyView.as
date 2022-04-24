﻿// by nota

//com.sulake.habbo.ui.widget.furniture.trophy.NikoTrophyView

package com.sulake.habbo.ui.widget.furniture.trophy
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NikoTrophyView implements ITrophyView 
    {

        private var _SafeStr_4811:int;
        private var _SafeStr_4981:TrophyFurniWidget;
        private var _window:_SafeStr_3133;

        public function NikoTrophyView(_arg_1:TrophyFurniWidget, _arg_2:int)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_4811 = _arg_2;
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4981 = null;
        }

        public function showInterface():Boolean
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_8:IAsset = _SafeStr_4981.assets.getAssetByName("niko_trophy");
            var _local_1:XmlAsset = XmlAsset(_local_8);
            if (_local_1 == null)
            {
                return (false);
            };
            if (_window == null)
            {
                _window = (_SafeStr_4981.windowManager.buildFromXML((_local_1.content as XML)) as _SafeStr_3133);
            };
            _window.center();
            _local_2 = _window.findChildByName("header_button_close");
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onCloseElem);
            };
            _local_4 = (_window.findChildByName("html_textbox") as ITextWindow);
            if (_local_4 != null)
            {
                switch (_SafeStr_4811)
                {
                    case 20:
                        _local_4.text = _SafeStr_4981.localizations.getLocalization("niko.trophy.description.gold");
                        break;
                    case 10:
                        _local_4.text = _SafeStr_4981.localizations.getLocalization("niko.trophy.description.silver");
                    default:
                };
            };
            _local_6 = (_window.findChildByName("store_link") as ITextLinkWindow);
            if (_local_6 != null)
            {
                _local_6.addEventListener("WME_CLICK", onAppstoreLink);
            };
            _local_3 = (_window.findChildByName("date") as ITextWindow);
            if (_local_3 != null)
            {
                _SafeStr_4981.localizations.registerParameter("trophy.niko.date", "date", _SafeStr_4981.date);
                _local_3.text = _SafeStr_4981.localizations.getLocalization("trophy.niko.date");
            };
            _local_7 = (_window.findChildByName("preview_image") as IStaticBitmapWrapperWindow);
            if (_local_7 != null)
            {
                if (_SafeStr_4811 == 20)
                {
                    _local_7.assetUri = "${image.library.url}niko/niko_trophy_gold.png";
                }
                else
                {
                    _local_7.assetUri = "${image.library.url}niko/niko_trophy_silver.png";
                };
            };
            _local_7 = (_window.findChildByName("store_image") as IStaticBitmapWrapperWindow);
            if (_local_7 != null)
            {
                _local_7.assetUri = (("${image.library.url}niko/" + _SafeStr_4981.configuration.getProperty("niko.trophy.appstore.image")) + ".png");
            };
            var _local_9:IRegionWindow = (_window.findChildByName("appstore_region") as IRegionWindow);
            if (_local_9)
            {
                _local_9.addEventListener("WME_CLICK", onAppstoreLink);
            };
            return (true);
        }

        public function disposeInterface():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function onAppstoreLink(_arg_1:WindowMouseEvent):void
        {
            var _local_2:String = _SafeStr_4981.configuration.getProperty("niko.appstore.link.url");
            HabboWebTools.openWebPage(_local_2, "habboMain");
        }

        private function onCloseElem(_arg_1:WindowMouseEvent):void
        {
            disposeInterface();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.trophy

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4811 = "_-r1b" (String#3566, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


