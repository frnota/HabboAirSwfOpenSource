﻿// by nota

//com.sulake.habbo.catalog.marketplace.MarketplaceConfirmationDialog

package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets.ILimitedItemGridOverlayWidget;
    import com.sulake.habbo.window.widgets.IRarityItemGridOverlayWidget;
    import com.sulake.habbo.catalog.HabboCatalog;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Matrix;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;

    public class MarketplaceConfirmationDialog implements _SafeStr_3140 
    {

        private var _marketplace:MarketPlaceLogic;
        private var _catalog:IHabboCatalog;
        private var _roomEngine:IRoomEngine;
        private var _window:_SafeStr_3263;
        private var _offer:MarketPlaceOfferData;

        public function MarketplaceConfirmationDialog(_arg_1:MarketPlaceLogic, _arg_2:IHabboCatalog, _arg_3:IRoomEngine)
        {
            _marketplace = _arg_1;
            _catalog = _arg_2;
            _roomEngine = _arg_3;
        }

        public function dispose():void
        {
            _marketplace = null;
            _catalog = null;
            _roomEngine = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _offer = null;
        }

        public function showConfirmation(_arg_1:int, _arg_2:MarketPlaceOfferData):void
        {
            var _local_9:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_10:* = null;
            var _local_6:* = null;
            var _local_12:* = null;
            var _local_4:* = null;
            var _local_11:* = null;
            if (!_arg_2)
            {
                return;
            };
            _offer = _arg_2;
            if ((((!(_marketplace)) || (!(_catalog))) || (!(_catalog.localization))))
            {
                return;
            };
            if (_window)
            {
                _window.dispose();
            };
            _window = (createWindow("marketplace_purchase_confirmation") as _SafeStr_3263);
            _window.procedure = eventHandler;
            _window.center();
            var _local_8:ITextWindow = (_window.findChildByName("header_text") as ITextWindow);
            if (_local_8)
            {
                if (_arg_1 == 1)
                {
                    _local_8.text = "${catalog.marketplace.confirm_header}";
                };
                if (_arg_1 == 2)
                {
                    _local_8.text = "${catalog.marketplace.confirm_higher_header}";
                };
            };
            _local_8 = (_window.findChildByName("item_name") as ITextWindow);
            if (_local_8)
            {
                _local_8.text = (("${" + _marketplace.getNameLocalizationKey(_arg_2)) + "}");
            };
            _local_8 = (_window.findChildByName("item_price") as ITextWindow);
            if (_local_8)
            {
                _local_9 = _catalog.localization.getLocalization("catalog.marketplace.confirm_price");
                _local_9 = _local_9.replace("%price%", _offer.price);
                _local_8.text = _local_9;
            };
            _local_8 = (_window.findChildByName("item_average_price") as ITextWindow);
            if (_local_8)
            {
                _local_3 = _catalog.localization.getLocalizationRaw("catalog.marketplace.offer_details.average_price");
                if (_local_3)
                {
                    _local_9 = _local_3.raw;
                    _local_9 = _local_9.replace("%days%", _marketplace.averagePricePeriod.toString());
                    _local_5 = ((_offer.averagePrice == 0) ? " - " : _offer.averagePrice.toString());
                    _local_9 = _local_9.replace("%average%", _local_5);
                    _local_8.text = _local_9;
                }
                else
                {
                    _local_8.visible = false;
                };
            };
            _local_8 = (_window.findChildByName("offer_count") as ITextWindow);
            if (_local_8)
            {
                _local_3 = _catalog.localization.getLocalizationRaw("catalog.marketplace.offer_details.offer_count");
                if (_local_3)
                {
                    _local_9 = _local_3.raw;
                    _local_9 = _local_9.replace("%count%", _offer.offerCount);
                    _local_8.text = _local_9;
                }
                else
                {
                    _local_8.visible = false;
                };
            };
            if (_arg_2.isUniqueLimitedItem)
            {
                _local_7 = _window.findChildByName("unique_item_background_bitmap");
                _local_7.visible = true;
                _local_10 = _SafeStr_3199(_window.findChildByName("unique_item_overlay_widget"));
                _local_6 = ILimitedItemGridOverlayWidget(_local_10.widget);
                _local_10.visible = true;
                _local_6.serialNumber = _arg_2.stuffData.uniqueSerialNumber;
                _local_6.animated = true;
            };
            if (((_arg_2.stuffData) && (_arg_2.stuffData.rarityLevel >= 0)))
            {
                _local_12 = _SafeStr_3199(_window.findChildByName("rarity_item_overlay_widget"));
                _local_4 = IRarityItemGridOverlayWidget(_local_12.widget);
                _local_12.visible = true;
                _local_4.rarityLevel = _arg_2.stuffData.rarityLevel;
            };
            setImage();
            if ((_catalog as HabboCatalog).getBoolean("disclaimer.credit_spending.enabled"))
            {
                setDisclaimerAccepted(false);
            }
            else
            {
                _local_11 = _window.findChildByName("disclaimer");
                _window.height = (_window.height - _local_11.height);
                _local_11.dispose();
                setDisclaimerAccepted(true);
            };
        }

        private function setImage():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if ((((!(_offer)) || (!(_window))) || (!(_roomEngine))))
            {
                return;
            };
            if (!_offer.image)
            {
                if (_offer.furniType == 1)
                {
                    _local_1 = _roomEngine.getFurnitureIcon(_offer.furniId, this);
                }
                else
                {
                    if (_offer.furniType == 2)
                    {
                        _local_1 = _roomEngine.getWallItemIcon(_offer.furniId, this);
                    };
                };
                if (((_local_1) && (_local_1.data)))
                {
                    _offer.image = (_local_1.data as BitmapData);
                    _offer.imageCallback = _local_1.id;
                };
            };
            if (_offer.image != null)
            {
                _local_2 = (_window.findChildByName("item_image") as _SafeStr_3264);
                if (_local_2)
                {
                    if (_local_2.bitmap)
                    {
                        _local_2.bitmap.dispose();
                        _local_2.bitmap = null;
                    };
                    _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
                    _local_2.bitmap.draw(_offer.image, new Matrix(1, 0, 0, 1, ((_local_2.width - _offer.image.width) / 2), ((_local_2.height - _offer.image.height) / 2)));
                };
            };
        }

        private function eventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1)) || (!(_arg_2))))
            {
                return;
            };
            if (((!(_arg_1.type == "WME_CLICK")) && (!(_arg_1.type == "WME_DOUBLE_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "spending_disclaimer":
                    setDisclaimerAccepted(_SafeStr_3158(_arg_2).isSelected);
                    return;
                case "buy_button":
                    _catalog.buyMarketPlaceOffer(_offer.offerId);
                    hide();
                    return;
                case "header_button_close":
                case "cancel_button":
                    hide();
                    return;
            };
        }

        private function hide():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (((_offer) && (_offer.imageCallback == _arg_1)))
            {
                _offer.image = _arg_2;
                setImage();
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function createWindow(_arg_1:String):_SafeStr_3109
        {
            if ((((!(_catalog)) || (!(_catalog.assets))) || (!(_catalog.windowManager))))
            {
                return (null);
            };
            var _local_3:XmlAsset = (_catalog.assets.getAssetByName(_arg_1) as XmlAsset);
            if (((!(_local_3)) || (!(_local_3.content))))
            {
                return (null);
            };
            var _local_2:XML = (_local_3.content as XML);
            if (!_local_2)
            {
                return (null);
            };
            return (_catalog.windowManager.buildFromXML(_local_2));
        }

        private function setDisclaimerAccepted(_arg_1:Boolean):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("buy_button");
            if (_local_2 == null)
            {
                return;
            };
            if (_arg_1)
            {
                _local_2.enable();
            }
            else
            {
                _local_2.disable();
            };
        }


    }
}//package com.sulake.habbo.catalog.marketplace

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)


