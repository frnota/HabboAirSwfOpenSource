﻿// by nota

//com.sulake.habbo.toolbar.extensions.purse.indicators.SeasonalCurrencyIndicator

package com.sulake.habbo.toolbar.extensions.purse.indicators
{
    import com.sulake.habbo.toolbar.extensions.purse.CurrencyIndicatorBase;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.localization._SafeStr_17;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.purse.PurseEvent;

    public class SeasonalCurrencyIndicator extends CurrencyIndicatorBase 
    {

        private static const BG_COLOR_LIGHT:uint = 4286084205;
        private static const BG_COLOR_DARK:uint = 4283781966;
        private static const ICON_ANIMATION:Array = ["toolbar_credit_icon_0", "toolbar_credit_icon_1", "toolbar_credit_icon_2", "toolbar_credit_icon_1", "toolbar_credit_icon_0"];

        private var _catalog:IHabboCatalog;
        private var _SafeStr_4712:int = -1;
        private var _toolbar:HabboToolbar;

        public function SeasonalCurrencyIndicator(_arg_1:HabboToolbar, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:IHabboCatalog, _arg_5:_SafeStr_17)
        {
            super(_arg_2, _arg_3);
            _toolbar = _arg_1;
            _catalog = _arg_4;
            this.bgColorLight = 4286084205;
            this.bgColorDark = 4283781966;
            this.textElementName = "amount";
            this.amountZeroText = _arg_5.getLocalization("purse.snowflakes.zero.amount.text", "Info");
            createWindow("purse_indicator_seasonal_xml", null);
            window.findChildByName("seasonal_icon").style = _SafeStr_3226.getIconStyleFor(getDisplayedActivityPointType(), _arg_1, true);
            setAmount(0);
            _arg_1.extensionView.attachExtension("purse_seasonal_currency", window, 5);
            registerUpdateEvents(_arg_4.events);
        }

        private function getDisplayedActivityPointType():int
        {
            return (_toolbar.getInteger("seasonalcurrencyindicator.currency", 1));
        }

        private function getCatalogPageName():String
        {
            return (_toolbar.getProperty("seasonalcurrencyindicator.page"));
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (!_arg_1)
            {
                return;
            };
            _arg_1.addEventListener("catalog_purse_activity_point_balance", onBalance);
        }

        override protected function onContainerClick(_arg_1:WindowMouseEvent):void
        {
            _catalog.openCatalogPage(getCatalogPageName());
        }

        public function onBalance(_arg_1:PurseEvent):void
        {
            if (_arg_1.activityPointType == getDisplayedActivityPointType())
            {
                setAmount(_arg_1.balance);
                if (_SafeStr_4712 != -1)
                {
                    animateChange(_SafeStr_4712, _arg_1.balance);
                };
                _SafeStr_4712 = _arg_1.balance;
            };
        }

        override protected function setAmount(_arg_1:int, _arg_2:int=-1):void
        {
            var _local_3:String = _arg_1.toString();
            if (_arg_1 == 0)
            {
                _local_3 = this.amountZeroText;
                setTextUnderline(true);
            }
            else
            {
                setTextUnderline(false);
            };
            setText(_local_3);
        }


    }
}//package com.sulake.habbo.toolbar.extensions.purse.indicators

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_17 = "_-94" (String#5077, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_4712 = "_-O1J" (String#5664, DoABC#4)


