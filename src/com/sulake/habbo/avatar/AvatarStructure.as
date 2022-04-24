﻿// by nota

//com.sulake.habbo.avatar.AvatarStructure

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.avatar.geometry.AvatarModelGeometry;
    import com.sulake.habbo.avatar.actions.AvatarActionManager;
    import com.sulake.habbo.avatar.structure.FigureSetData;
    import com.sulake.habbo.avatar.structure.PartSetsData;
    import com.sulake.habbo.avatar.structure.AnimationData;
    import com.sulake.habbo.avatar.animation.AnimationManager;
    import com.sulake.habbo.avatar.actions.ActionDefinition;
    import flash.utils.Dictionary;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3202;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.animation.AnimationLayerData;
    import com.sulake.habbo.avatar.animation.Animation;
    import com.sulake.habbo.avatar.actions._SafeStr_3292;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3177;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import com.sulake.habbo.avatar.animation.AddDataContainer;
    import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
    import com.sulake.habbo.avatar.structure.animation.AnimationAction;
    import flash.geom.Point;
    import __AS3__.vec.Vector;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.avatar.structure._SafeStr_3125;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.text.TextField;
    import flash.geom.Matrix;
    import flash.display.Shape;
    import flash.display.Stage;
    import com.sulake.habbo.avatar.structure.*;

    public class AvatarStructure extends EventDispatcherWrapper 
    {

        private var _SafeStr_4855:_SafeStr_1702;
        private var _geometry:AvatarModelGeometry;
        private var _SafeStr_4849:AvatarActionManager;
        private var _SafeStr_4851:FigureSetData;
        private var _SafeStr_4850:PartSetsData;
        private var _SafeStr_4193:AnimationData;
        private var _SafeStr_4852:AnimationManager;
        private var _defaultAction:ActionDefinition;
        private var _SafeStr_4853:Dictionary;

        public function AvatarStructure(_arg_1:_SafeStr_1702)
        {
            _SafeStr_4855 = _arg_1;
            _SafeStr_4851 = new FigureSetData();
            _SafeStr_4850 = new PartSetsData();
            _SafeStr_4193 = new AnimationData();
            _SafeStr_4852 = new AnimationManager();
            _SafeStr_4853 = new Dictionary();
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                super.dispose();
                _SafeStr_4855 = null;
                _SafeStr_4851 = null;
                _SafeStr_4850 = null;
                _SafeStr_4193 = null;
                _SafeStr_4853 = null;
            };
        }

        public function init():void
        {
            _SafeStr_4853 = new Dictionary();
        }

        public function initGeometry(_arg_1:XML):void
        {
            if (!_arg_1)
            {
                return;
            };
            _geometry = new AvatarModelGeometry(_arg_1);
        }

        public function initActions(_arg_1:_SafeStr_21, _arg_2:XML):void
        {
            if (!_arg_2)
            {
                return;
            };
            _SafeStr_4849 = new AvatarActionManager(_arg_1, _arg_2);
            _defaultAction = _SafeStr_4849.getDefaultAction();
        }

        public function updateActions(_arg_1:XML):void
        {
            _SafeStr_4849.updateActions(_arg_1);
            _defaultAction = _SafeStr_4849.getDefaultAction();
        }

        public function initPartSets(_arg_1:XML):Boolean
        {
            if (!_arg_1)
            {
                return (false);
            };
            if (_SafeStr_4850.parse(_arg_1))
            {
                _SafeStr_4850.getPartDefinition("ri").appendToFigure = true;
                _SafeStr_4850.getPartDefinition("li").appendToFigure = true;
                return (true);
            };
            return (false);
        }

        public function initAnimation(_arg_1:XML):Boolean
        {
            if (!_arg_1)
            {
                return (false);
            };
            return (_SafeStr_4193.parse(_arg_1));
        }

        public function initFigureData(_arg_1:XML):Boolean
        {
            if (!_arg_1)
            {
                return (false);
            };
            return (_SafeStr_4851.parse(_arg_1));
        }

        public function injectFigureData(_arg_1:XML):void
        {
            _SafeStr_4851.injectXML(_arg_1);
        }

        public function registerAnimations(_arg_1:AssetLibraryCollection, _arg_2:String="fx", _arg_3:int=200):void
        {
            var _local_4:* = null;
            var _local_5:int;
            _local_5 = 0;
            while (_local_5 < _arg_3)
            {
                if (_arg_1.hasAsset((_arg_2 + _local_5)))
                {
                    _local_4 = (_arg_1.getAssetByName((_arg_2 + _local_5)).content as XML);
                    _SafeStr_4852.registerAnimation(this, _local_4);
                };
                _local_5++;
            };
        }

        public function registerAnimation(_arg_1:XML):void
        {
            _SafeStr_4852.registerAnimation(this, _arg_1);
        }

        public function getPartColor(_arg_1:_SafeStr_3164, _arg_2:String, _arg_3:int=0):IPartColor
        {
            var _local_4:Array = _arg_1.getPartColorIds(_arg_2);
            if (((!(_local_4)) || (_local_4.length < _arg_3)))
            {
                return (null);
            };
            var _local_6:ISetType = _SafeStr_4851.getSetType(_arg_2);
            if (_local_6 == null)
            {
                return (null);
            };
            var _local_5:_SafeStr_3202 = _SafeStr_4851.getPalette(_local_6.paletteID);
            if (!_local_5)
            {
                return (null);
            };
            return (_local_5.getColor(_local_4[_arg_3]));
        }

        public function getBodyPartData(_arg_1:String, _arg_2:int, _arg_3:String):AnimationLayerData
        {
            return (_SafeStr_4852.getLayerData(_arg_1, _arg_2, _arg_3) as AnimationLayerData);
        }

        public function getAnimation(_arg_1:String):Animation
        {
            return (_SafeStr_4852.getAnimation(_arg_1) as Animation);
        }

        public function getActionDefinition(_arg_1:String):ActionDefinition
        {
            return (_SafeStr_4849.getActionDefinition(_arg_1));
        }

        public function getActionDefinitionWithState(_arg_1:String):ActionDefinition
        {
            return (_SafeStr_4849.getActionDefinitionWithState(_arg_1));
        }

        public function isMainAvatarSet(_arg_1:String):Boolean
        {
            return (_geometry.isMainAvatarSet(_arg_1));
        }

        public function sortActions(_arg_1:Array):Array
        {
            return (_SafeStr_4849.sortActions(_arg_1));
        }

        public function maxFrames(_arg_1:Array):int
        {
            var _local_2:int;
            for each (var _local_3:_SafeStr_3292 in _arg_1)
            {
                _local_2 = Math.max(_local_2, _SafeStr_4193.getFrameCount(_local_3.definition));
            };
            return (_local_2);
        }

        public function getMandatorySetTypeIds(_arg_1:String, _arg_2:int):Array
        {
            if (!_SafeStr_4853[_arg_1])
            {
                _SafeStr_4853[_arg_1] = new Dictionary();
            };
            if (_SafeStr_4853[_arg_1][_arg_2])
            {
                return (_SafeStr_4853[_arg_1][_arg_2]);
            };
            _SafeStr_4853[_arg_1][_arg_2] = _SafeStr_4851.getMandatorySetTypeIds(_arg_1, _arg_2);
            return (_SafeStr_4853[_arg_1][_arg_2]);
        }

        public function getDefaultPartSet(_arg_1:String, _arg_2:String):_SafeStr_3177
        {
            return (_SafeStr_4851.getDefaultPartSet(_arg_1, _arg_2));
        }

        public function getCanvasOffsets(_arg_1:Array, _arg_2:String, _arg_3:int):Array
        {
            return (_SafeStr_4849.getCanvasOffsets(_arg_1, _arg_2, _arg_3));
        }

        public function getCanvas(_arg_1:String, _arg_2:String):AvatarCanvas
        {
            return (_geometry.getCanvas(_arg_1, _arg_2));
        }

        public function removeDynamicItems(_arg_1:_SafeStr_3138):void
        {
            _geometry.removeDynamicItems(_arg_1);
        }

        public function getActiveBodyPartIds(_arg_1:_SafeStr_3292, _arg_2:_SafeStr_3138):Array
        {
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_14:* = null;
            var _local_12:* = null;
            var _local_9:* = null;
            var _local_11:Array = [];
            var _local_6:Array = [];
            var _local_13:String = _arg_1.definition.geometryType;
            if (_arg_1.definition.isAnimation)
            {
                _local_4 = ((_arg_1.definition.state + ".") + _arg_1.actionParameter);
                _local_8 = (_SafeStr_4852.getAnimation(_local_4) as Animation);
                if (_local_8 != null)
                {
                    _local_11 = _local_8.getAnimatedBodyPartIds(0, _arg_1.overridingAction);
                    if (_local_8.hasAddData())
                    {
                        _local_12 = <item id="" x="0" y="0" z="0" radius="0.01" nx="0" ny="0" nz="-1" double="1" />
                        ;
                        _local_9 = <part />
                        ;
                        for each (var _local_3:AddDataContainer in _local_8.addData)
                        {
                            _local_7 = _geometry.getBodyPart(_local_13, _local_3.align);
                            if (_local_7 != null)
                            {
                                _local_12.@id = _local_3.id;
                                _local_7.addPart(_local_12, _arg_2);
                                _local_9.@["set-type"] = _local_3.id;
                                _local_14 = _SafeStr_4850.addPartDefinition(_local_9);
                                _local_14.appendToFigure = true;
                                if (_local_3.base == "")
                                {
                                    _local_14.staticId = 1;
                                };
                                if (_local_6.indexOf(_local_7.id) == -1)
                                {
                                    _local_6.push(_local_7.id);
                                };
                            };
                        };
                    };
                };
                for each (var _local_10:String in _local_11)
                {
                    _local_7 = _geometry.getBodyPart(_local_13, _local_10);
                    if (_local_7 != null)
                    {
                        if (_local_6.indexOf(_local_7.id) == -1)
                        {
                            _local_6.push(_local_7.id);
                        };
                    };
                };
            }
            else
            {
                _local_11 = _SafeStr_4850.getActiveParts(_arg_1.definition);
                for each (var _local_5:String in _local_11)
                {
                    _local_7 = _geometry.getBodyPartOfItem(_local_13, _local_5, _arg_2);
                    if (_local_7 != null)
                    {
                        if (_local_6.indexOf(_local_7.id) == -1)
                        {
                            _local_6.push(_local_7.id);
                        };
                    };
                };
            };
            return (_local_6);
        }

        public function getBodyPartsUnordered(_arg_1:String):Array
        {
            return (_geometry.getBodyPartIdsInAvatarSet(_arg_1));
        }

        public function getBodyParts(_arg_1:String, _arg_2:String, _arg_3:int):Array
        {
            var _local_4:Number = AvatarDirectionAngle._SafeStr_4854[_arg_3];
            return (_geometry.getBodyPartsAtAngle(_arg_1, _local_4, _arg_2));
        }

        public function getFrameBodyPartOffset(_arg_1:_SafeStr_3292, _arg_2:int, _arg_3:int, _arg_4:String):Point
        {
            var _local_5:AnimationAction = _SafeStr_4193.getAction(_arg_1.definition);
            if (_local_5)
            {
                return (_local_5.getFrameBodyPartOffset(_arg_2, _arg_3, _arg_4));
            };
            return (AnimationAction.DEFAULT_OFFSET);
        }

        public function getParts(_arg_1:String, _arg_2:_SafeStr_3164, _arg_3:_SafeStr_3292, _arg_4:String, _arg_5:int, _arg_6:Array, _arg_7:_SafeStr_3138, _arg_8:_SafeStr_24=null):Vector.<AvatarImagePartContainer>
        {
            var _local_37:* = null;
            var _local_26:* = null;
            var _local_28:* = null;
            var _local_27:* = null;
            var _local_47:* = null;
            var _local_14:* = null;
            var _local_30:* = null;
            var _local_41:* = null;
            var _local_23:* = null;
            var _local_21:* = null;
            var _local_45:* = null;
            var _local_48:int;
            var _local_15:* = null;
            var _local_36:* = null;
            var _local_24:* = null;
            var _local_17:* = null;
            var _local_18:* = null;
            var _local_43:* = null;
            var _local_34:* = null;
            var _local_10:* = null;
            var _local_29:Boolean;
            var _local_13:* = null;
            var _local_19:Boolean;
            var _local_39:* = null;
            var _local_22:Boolean;
            var _local_31:* = null;
            var _local_44:int;
            var _local_32:int;
            var _local_25:* = null;
            var _local_11:Boolean;
            var _local_12:Number;
            var _local_42:* = null;
            var _local_16:* = null;
            if (_arg_3 == null)
            {
                return (null);
            };
            var _local_9:Array = _SafeStr_4850.getActiveParts(_arg_3.definition);
            var _local_46:Array = [];
            var _local_35:Array = [0];
            var _local_38:AnimationAction = _SafeStr_4193.getAction(_arg_3.definition);
            if (_arg_3.definition.isAnimation)
            {
                _local_27 = ((_arg_3.definition.state + ".") + _arg_3.actionParameter);
                _local_37 = (_SafeStr_4852.getAnimation(_local_27) as Animation);
                if (_local_37 != null)
                {
                    _local_35 = getPopulatedArray(_local_37.frameCount(_arg_3.overridingAction));
                    for each (_local_47 in _local_37.getAnimatedBodyPartIds(0, _arg_3.overridingAction))
                    {
                        if (_local_47 == _arg_1)
                        {
                            _local_14 = _geometry.getBodyPart(_arg_4, _local_47);
                            if (_local_14 != null)
                            {
                                for each (_local_30 in _local_14.getDynamicParts(_arg_7))
                                {
                                    _local_9.push(_local_30.id);
                                };
                            };
                        };
                    };
                };
            };
            var _local_20:Array = _geometry.getParts(_arg_4, _arg_1, _arg_5, _local_9, _arg_7);
            var _local_33:Array = _arg_2.getPartTypeIds();
            for each (_local_41 in _local_33)
            {
                if (_arg_8 != null)
                {
                    if (_arg_8[_local_41] != null) continue;
                };
                _local_48 = _arg_2.getPartSetId(_local_41);
                _local_15 = _arg_2.getPartColorIds(_local_41);
                _local_36 = _SafeStr_4851.getSetType(_local_41);
                if (_local_36)
                {
                    _local_24 = _SafeStr_4851.getPalette(_local_36.paletteID);
                    if (_local_24)
                    {
                        _local_17 = _local_36.getPartSet(_local_48);
                        if (_local_17)
                        {
                            _arg_6 = _arg_6.concat(_local_17.hiddenLayers);
                            for each (_local_18 in _local_17.parts)
                            {
                                if (_local_20.indexOf(_local_18.type) > -1)
                                {
                                    if (_local_38 != null)
                                    {
                                        _local_21 = _local_38.getPart(_local_18.type);
                                        if (_local_21 != null)
                                        {
                                            _local_45 = _local_21.frames;
                                        }
                                        else
                                        {
                                            _local_45 = _local_35;
                                        };
                                    }
                                    else
                                    {
                                        _local_45 = _local_35;
                                    };
                                    _local_43 = _arg_3.definition;
                                    if (_local_9.indexOf(_local_18.type) == -1)
                                    {
                                        _local_43 = _defaultAction;
                                    };
                                    _local_28 = _SafeStr_4850.getPartDefinition(_local_18.type);
                                    _local_34 = ((_local_28 == null) ? _local_18.type : _local_28.flippedSetType);
                                    if (_local_34 == "")
                                    {
                                        _local_34 = _local_18.type;
                                    };
                                    if (((_local_15) && (_local_15.length > (_local_18.colorLayerIndex - 1))))
                                    {
                                        _local_10 = _local_24.getColor(_local_15[(_local_18.colorLayerIndex - 1)]);
                                    };
                                    _local_29 = (_local_18.colorLayerIndex > 0);
                                    _local_23 = new AvatarImagePartContainer(_arg_1, _local_18.type, _local_18.id.toString(), _local_10, _local_45, _local_43, _local_29, _local_18.paletteMap, _local_34);
                                    _local_46.push(_local_23);
                                };
                            };
                        };
                    };
                };
            };
            var _local_40:Vector.<AvatarImagePartContainer> = new Vector.<AvatarImagePartContainer>();
            for each (_local_26 in _local_20)
            {
                _local_19 = false;
                _local_39 = null;
                _local_22 = ((_arg_8) && (_arg_8[_local_26]));
                for each (_local_13 in _local_46)
                {
                    if (_local_13.partType == _local_26)
                    {
                        if (_local_22)
                        {
                            _local_39 = _local_13.color;
                        }
                        else
                        {
                            _local_19 = true;
                            if (_arg_6.indexOf(_local_26) == -1)
                            {
                                _local_40.push(_local_13);
                            };
                        };
                    };
                };
                if (!_local_19)
                {
                    if (_local_22)
                    {
                        _local_31 = _arg_8[_local_26];
                        _local_44 = 0;
                        _local_32 = 0;
                        while (_local_32 < _local_31.length)
                        {
                            _local_44 = (_local_44 + _local_31.charCodeAt(_local_32));
                            _local_32++;
                        };
                        if (_local_38 != null)
                        {
                            _local_21 = _local_38.getPart(_local_26);
                            if (_local_21 != null)
                            {
                                _local_45 = _local_21.frames;
                            }
                            else
                            {
                                _local_45 = _local_35;
                            };
                        }
                        else
                        {
                            _local_45 = _local_35;
                        };
                        _local_23 = new AvatarImagePartContainer(_arg_1, _local_26, _local_31, _local_39, _local_45, _arg_3.definition, (!(_local_39 == null)), -1, _local_26, false, 1);
                        _local_40.push(_local_23);
                    }
                    else
                    {
                        if (_local_9.indexOf(_local_26) > -1)
                        {
                            _local_25 = _geometry.getBodyPartOfItem(_arg_4, _local_26, _arg_7);
                            if (_arg_1 == _local_25.id)
                            {
                                _local_28 = _SafeStr_4850.getPartDefinition(_local_26);
                                _local_11 = false;
                                _local_12 = 1;
                                if (_local_28.appendToFigure)
                                {
                                    _local_42 = "1";
                                    if (_arg_3.actionParameter != "")
                                    {
                                        _local_42 = _arg_3.actionParameter;
                                    };
                                    if (_local_28.hasStaticId())
                                    {
                                        _local_42 = _local_28.staticId.toString();
                                    };
                                    if (_local_37 != null)
                                    {
                                        _local_16 = _local_37.getAddData(_local_26);
                                        if (_local_16 != null)
                                        {
                                            _local_11 = _local_16.isBlended;
                                            _local_12 = _local_16.blend;
                                        };
                                    };
                                    if (_local_38 != null)
                                    {
                                        _local_21 = _local_38.getPart(_local_26);
                                        if (_local_21 != null)
                                        {
                                            _local_45 = _local_21.frames;
                                        }
                                        else
                                        {
                                            _local_45 = _local_35;
                                        };
                                    }
                                    else
                                    {
                                        _local_45 = _local_35;
                                    };
                                    _local_23 = new AvatarImagePartContainer(_arg_1, _local_26, _local_42, null, _local_45, _arg_3.definition, false, -1, _local_26, _local_11, _local_12);
                                    _local_40.push(_local_23);
                                };
                            };
                        };
                    };
                };
            };
            return (_local_40);
        }

        public function get figureData():_SafeStr_3125
        {
            return (_SafeStr_4851);
        }

        public function get animationManager():AnimationManager
        {
            return (_SafeStr_4852);
        }

        public function get renderManager():_SafeStr_1702
        {
            return (_SafeStr_4855);
        }

        private function getPopulatedArray(_arg_1:int):Array
        {
            var _local_3:int;
            var _local_2:Array = [];
            _local_3 = 0;
            while (_local_3 < _arg_1)
            {
                _local_2.push(_local_3);
                _local_3++;
            };
            return (_local_2);
        }

        public function displayGeometry(_arg_1:Stage):void
        {
            var _local_7:* = null;
            var _local_11:Number;
            var _local_12:Number;
            var _local_9:Number;
            var _local_14:* = null;
            var _local_4:BitmapData = new BitmapData(960, 540, false, 0xFFFFFFFF);
            var _local_10:Bitmap = new Bitmap(_local_4);
            _arg_1.addChild(_local_10);
            var _local_3:Number = (_local_4.width / 2);
            var _local_2:Number = (_local_4.height / 2);
            var _local_5:Number = 200;
            var _local_13:TextField = new TextField();
            var _local_6:Matrix = new Matrix();
            for each (var _local_8:String in _geometry.getBodyPartIdsInAvatarSet("full"))
            {
                _local_7 = _geometry.getBodyPart("vertical", _local_8);
                _SafeStr_14.log(("Drawing bodypart : " + _local_8));
                if (_local_7 != null)
                {
                    _local_11 = (_local_7.location.x * _local_5);
                    _local_12 = (_local_7.location.z * _local_5);
                    _local_9 = (_local_7.radius * _local_5);
                    _local_14 = new Shape();
                    _local_14.graphics.lineStyle(1, 0xFFFF0000, 1);
                    _local_14.graphics.drawCircle((_local_3 + _local_11), (_local_2 + _local_12), _local_9);
                    _local_4.draw(_local_14);
                    _local_13.text = _local_8;
                    _local_13.textColor = 0xFFFF0000;
                    _local_6.identity();
                    _local_6.tx = ((((_local_3 + _local_11) + _local_9) - _local_13.textWidth) - 5);
                    _local_6.ty = ((_local_2 + _local_12) - 5);
                    _local_4.draw(_local_13, _local_6);
                }
                else
                {
                    _SafeStr_14.log(("Could not draw bodypart : " + _local_8));
                };
            };
        }

        public function getItemIds():Array
        {
            var _local_2:* = null;
            var _local_1:* = null;
            if (_SafeStr_4849)
            {
                _local_2 = _SafeStr_4849.getActionDefinition("CarryItem").params;
                _local_1 = [];
                for (var _local_3:String in _local_2)
                {
                    _local_1.push(_local_3);
                };
                return (_local_1);
            };
            return ([]);
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1702 = "_-E0" (String#5991, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3125 = "_-u1g" (String#5880, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_3202 = "_-P1H" (String#6065, DoABC#4)
// _SafeStr_3292 = "_-91r" (String#2734, DoABC#4)
// _SafeStr_3353 = "_-Ye" (String#6452, DoABC#4)
// _SafeStr_4193 = "_-1j" (String#1833, DoABC#4)
// _SafeStr_4849 = "_-en" (String#6486, DoABC#4)
// _SafeStr_4850 = "_-JA" (String#5594, DoABC#4)
// _SafeStr_4851 = "_-W1C" (String#4235, DoABC#4)
// _SafeStr_4852 = "_-a0" (String#7497, DoABC#4)
// _SafeStr_4853 = "_-VL" (String#5720, DoABC#4)
// _SafeStr_4854 = "_-kR" (String#18051, DoABC#4)
// _SafeStr_4855 = "_-N1w" (String#3875, DoABC#4)


