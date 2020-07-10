package starling.assets
{
	import com.esidegallery.signals.promises.SimplePromise;

	import starling.utils.execute;

	public class Away3DAssetManager extends AssetManager
	{
		public function Away3DAssetManager(scaleFactor:Number = 1)
		{
			super(scaleFactor);
			
			registerFactory(new Away3DATFTextureFactory, 1);
			registerFactory(new Away3DBitmapTextureFactory, 1);
		}

		private var _loadingPromise:SimplePromise;
		/** The Promise associated with the most recent call to <code>loadQueue()</code>, if still loading. */
		public function get loadingPromise():SimplePromise
		{
			return _loadingPromise;
		}

		override public function loadQueue(onComplete:Function, onError:Function = null, onProgress:Function = null):void
		{
			var promise:SimplePromise = new SimplePromise;
			_loadingPromise = promise;

			var self:AssetManager = this;
			super.loadQueue(_onComplete, onError, onProgress);
			function _onComplete():void
			{
				_loadingPromise = null;
				promise.dispatch();
				execute(onComplete, self);
			}
		}

		override public function dispose():void
		{
			_loadingPromise = null;
			super.dispose();
		}
	}
}