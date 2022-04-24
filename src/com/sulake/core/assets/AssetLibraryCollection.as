﻿// by nota

//com.sulake.core.assets.AssetLibraryCollection

package com.sulake.core.assets
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import __AS3__.vec.Vector;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import com.sulake.core.utils._SafeStr_39;
    import flash.events.Event;
    import com.sulake.core.utils._SafeStr_43;
    import flash.net.URLRequest;

    public class AssetLibraryCollection extends EventDispatcherWrapper implements _SafeStr_21 
    {

        protected var _SafeStr_8016:Vector.<_SafeStr_21>;
        protected var _SafeStr_8014:Array;
        protected var _SafeStr_8001:LoaderContext;
        protected var _SafeStr_8015:AssetLibrary;
        protected var _manifest:XML;
        protected var _name:String;
        private var _SafeStr_4002:uint = 0;

        public function AssetLibraryCollection(_arg_1:String)
        {
            _name = _arg_1;
            _manifest = null;
            _SafeStr_8016 = new Vector.<_SafeStr_21>();
            _SafeStr_8014 = [];
            _SafeStr_8001 = new LoaderContext(false, ApplicationDomain.currentDomain, null);
        }

        public function get url():String
        {
            return ("");
        }

        public function get name():String
        {
            return (_name);
        }

        public function get isReady():Boolean
        {
            return (_SafeStr_8014.length == 0);
        }

        public function get numAssets():uint
        {
            return (getNumAssets());
        }

        public function get nameArray():Array
        {
            return (getAssetNameArray());
        }

        public function get manifest():XML
        {
            return ((_manifest) ? _manifest : _manifest = new XML());
        }

        public function get loaderContext():LoaderContext
        {
            return (_SafeStr_8001);
        }

        public function set loaderContext(_arg_1:LoaderContext):void
        {
            _SafeStr_8001 = _arg_1;
        }

        private function get binLibrary():_SafeStr_21
        {
            if (!_SafeStr_8015)
            {
                _SafeStr_8015 = new AssetLibrary("bin");
                _SafeStr_8016.splice(0, 0, _SafeStr_8015);
            };
            return (_SafeStr_8015);
        }

        public function loadFromFile(_arg_1:_SafeStr_39, _arg_2:Boolean=false):void
        {
            if (loaderContext == null)
            {
                loaderContext = _SafeStr_8001;
            };
            var _local_3:_SafeStr_21 = new AssetLibrary(("lib-" + _SafeStr_4002++));
            _SafeStr_8014.push(_local_3);
            _local_3.loadFromFile(_arg_1, _arg_2);
            _arg_1.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", loadEventHandler);
            _arg_1.addEventListener("LIBRARY_LOADER_EVENT_ERROR", loadEventHandler);
            _arg_1.addEventListener("LIBRARY_LOADER_EVENT_PROGRESS", loadEventHandler);
        }

        public function loadFromResource(_arg_1:XML, _arg_2:Class):Boolean
        {
            return (binLibrary.loadFromResource(_arg_1, _arg_2));
        }

        public function unload():void
        {
            while (_SafeStr_8014.length > 0)
            {
                (_SafeStr_8014.pop() as _SafeStr_21).dispose();
            };
            while (_SafeStr_8016.length > 0)
            {
                (_SafeStr_8016.pop() as _SafeStr_21).dispose();
            };
        }

        override public function dispose():void
        {
            var _local_2:uint;
            var _local_1:* = null;
            var _local_3:uint;
            if (!disposed)
            {
                super.dispose();
                _local_2 = _SafeStr_8016.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_1 = _SafeStr_8016.pop();
                    _local_1.dispose();
                    _local_3++;
                };
                _SafeStr_8015 = null;
            };
        }

        private function loadEventHandler(_arg_1:_SafeStr_43):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:uint;
            if (_arg_1.type == "LIBRARY_LOADER_EVENT_COMPLETE")
            {
                _local_3 = (_arg_1.target as _SafeStr_39);
                _local_4 = 0;
                while (_local_4 < _SafeStr_8014.length)
                {
                    _local_2 = (_SafeStr_8014[_local_4] as _SafeStr_21);
                    if (_local_2.url == _local_3.url)
                    {
                        _SafeStr_8014.splice(_local_4, 1);
                        break;
                    };
                    _local_4++;
                };
                _SafeStr_8016.push(_local_2);
                _local_3.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE", loadEventHandler);
                _local_3.removeEventListener("LIBRARY_LOADER_EVENT_ERROR", loadEventHandler);
                _local_3.removeEventListener("LIBRARY_LOADER_EVENT_PROGRESS", loadEventHandler);
                if (_SafeStr_8014.length == 0)
                {
                    dispatchEvent(new Event("AssetLibraryLoaded"));
                };
            };
        }

        public function hasAssetLibrary(_arg_1:String):Boolean
        {
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                if (_local_2.name == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function getAssetLibraryByName(_arg_1:String):_SafeStr_21
        {
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                if (_local_2.name == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getAssetLibraryByUrl(_arg_1:String):_SafeStr_21
        {
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                if (_local_2.url == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getAssetLibraryByPartialUrl(_arg_1:String):_SafeStr_21
        {
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                if (((_local_2.url) && (!(_local_2.url.indexOf(_arg_1) === -1))))
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function addAssetLibrary(_arg_1:_SafeStr_21):void
        {
            if (_SafeStr_8016.indexOf(_arg_1) == -1)
            {
                _SafeStr_8016.push(_arg_1);
            };
        }

        public function loadAssetFromFile(_arg_1:String, _arg_2:URLRequest, _arg_3:String=null, _arg_4:String=null, _arg_5:String=null, _arg_6:int=-1):AssetLoaderStruct
        {
            return (binLibrary.loadAssetFromFile(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6));
        }

        public function getAssetByName(_arg_1:String):IAsset
        {
            var _local_3:* = null;
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                _local_3 = _local_2.getAssetByName(_arg_1);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        public function getAssetsByName(_arg_1:String):Array
        {
            var _local_4:* = null;
            var _local_2:Array = [];
            for each (var _local_3:_SafeStr_21 in _SafeStr_8016)
            {
                _local_4 = _local_3.getAssetByName(_arg_1);
                if (_local_4 != null)
                {
                    _local_2.push(_local_4);
                };
            };
            return (_local_2);
        }

        public function getAssetByContent(_arg_1:Object):IAsset
        {
            var _local_3:* = null;
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                _local_3 = _local_2.getAssetByContent(_arg_1);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        public function getAssetByIndex(_arg_1:uint):IAsset
        {
            var _local_2:uint;
            var _local_3:uint;
            for each (var _local_4:_SafeStr_21 in _SafeStr_8016)
            {
                _local_2 = (_local_2 + _local_4.numAssets);
                if (_local_2 <= _arg_1)
                {
                    return (_local_4.getAssetByIndex((_arg_1 - _local_3)));
                };
                _local_3 = _local_2;
            };
            return (null);
        }

        public function getAssetIndex(_arg_1:IAsset):int
        {
            var _local_2:int;
            var _local_4:int;
            for each (var _local_3:_SafeStr_21 in _SafeStr_8016)
            {
                _local_4 = _local_3.getAssetIndex(_arg_1);
                if (_local_4 != -1)
                {
                    return (_local_2 + _local_4);
                };
                _local_2 = (_local_2 + _local_3.numAssets);
            };
            return (-1);
        }

        public function hasAsset(_arg_1:String):Boolean
        {
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                if (_local_2.hasAsset(_arg_1))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function setAsset(_arg_1:String, _arg_2:IAsset, _arg_3:Boolean=true):Boolean
        {
            return (binLibrary.setAsset(_arg_1, _arg_2, _arg_3));
        }

        public function createAsset(_arg_1:String, _arg_2:AssetTypeDeclaration):IAsset
        {
            return (binLibrary.createAsset(_arg_1, _arg_2));
        }

        public function removeAsset(_arg_1:IAsset):IAsset
        {
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                if (_local_2.removeAsset(_arg_1) == _arg_1)
                {
                    return (_arg_1);
                };
            };
            return (null);
        }

        public function registerAssetTypeDeclaration(_arg_1:AssetTypeDeclaration, _arg_2:Boolean=true):Boolean
        {
            return (binLibrary.registerAssetTypeDeclaration(_arg_1, _arg_2));
        }

        public function getAssetTypeDeclarationByMimeType(_arg_1:String, _arg_2:Boolean=true):AssetTypeDeclaration
        {
            var _local_3:* = null;
            if (_arg_2)
            {
                return (binLibrary.getAssetTypeDeclarationByMimeType(_arg_1, true));
            };
            for each (var _local_4:_SafeStr_21 in _SafeStr_8016)
            {
                _local_3 = _local_4.getAssetTypeDeclarationByMimeType(_arg_1, false);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        public function getAssetTypeDeclarationByClass(_arg_1:Class, _arg_2:Boolean=true):AssetTypeDeclaration
        {
            var _local_3:* = null;
            if (_arg_2)
            {
                return (binLibrary.getAssetTypeDeclarationByClass(_arg_1, true));
            };
            for each (var _local_4:_SafeStr_21 in _SafeStr_8016)
            {
                _local_3 = _local_4.getAssetTypeDeclarationByClass(_arg_1, false);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        public function getAssetTypeDeclarationByFileName(_arg_1:String, _arg_2:Boolean=true):AssetTypeDeclaration
        {
            var _local_3:* = null;
            if (_arg_2)
            {
                return (binLibrary.getAssetTypeDeclarationByFileName(_arg_1, true));
            };
            for each (var _local_4:_SafeStr_21 in _SafeStr_8016)
            {
                _local_3 = _local_4.getAssetTypeDeclarationByFileName(_arg_1, false);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        private function getNumAssets():uint
        {
            var _local_1:uint;
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                _local_1 = (_local_1 + _local_2.numAssets);
            };
            return (_local_1);
        }

        private function getAssetNameArray():Array
        {
            var _local_2:Array = [];
            for each (var _local_1:_SafeStr_21 in _SafeStr_8016)
            {
                _local_2 = _local_2.concat(_local_1.nameArray);
            };
            return (_local_2);
        }

        public function getManifests():Array
        {
            var _local_2:Array = [];
            for each (var _local_1:_SafeStr_21 in _SafeStr_8016)
            {
                _local_2.push(_local_1.manifest);
            };
            return (_local_2);
        }

        private function buildManifest():XML
        {
            var _local_3:XML = new XML("<manifest><library></library></manifest>");
            var _local_1:XMLList = _local_3.child("library");
            if (_SafeStr_8015)
            {
                applyManifestNodes(_local_1, _SafeStr_8015);
            };
            for each (var _local_2:_SafeStr_21 in _SafeStr_8016)
            {
                applyManifestNodes(_local_1, _local_2);
            };
            return (_local_3);
        }

        private function applyManifestNodes(_arg_1:XMLList, _arg_2:_SafeStr_21):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:XMLList = _arg_2.manifest.library.children();
            for each (var _local_6:XML in _local_5)
            {
                _local_3 = _arg_1.child(_local_6.name())[0];
                if (!_local_3)
                {
                    _arg_1.appendChild(new XML((("<" + _local_6.name()) + "/>")));
                    _local_3 = _arg_1.child(_local_6.name())[0];
                };
                _local_4 = _local_6.children();
                for each (var _local_7:XML in _local_4)
                {
                    _local_3.appendChild(_local_7);
                };
            };
        }


    }
}//package com.sulake.core.assets

// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_39 = "_-N4" (String#8085, DoABC#3)
// _SafeStr_4002 = "_-iP" (String#9558, DoABC#3)
// _SafeStr_43 = "_-gV" (String#9427, DoABC#3)
// _SafeStr_8001 = "_-A1G" (String#7217, DoABC#3)
// _SafeStr_8014 = "_-N1l" (String#8075, DoABC#3)
// _SafeStr_8015 = "_-jJ" (String#9622, DoABC#3)
// _SafeStr_8016 = "_-912" (String#7151, DoABC#3)


