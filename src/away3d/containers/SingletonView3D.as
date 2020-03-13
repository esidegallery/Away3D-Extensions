package away3d.containers
{
	import away3d.cameras.Camera3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.render.RendererBase;

	/** 
	 * For shared Away3D/Starling contexts, this is the Away3D View3D instance
	 * which is displayed and may be accessed from anywhere as a singleton. 
	 */
	public class SingletonView3D extends View3D
	{
		public static const SINGLETON_INSTANTIATED_ERROR:String = "Cannot change the contructor arguments of a SingletonView3D instance that has already been instantiated.";

		private static var _constructorArgScene:Scene3D = null;
		public static function get constructorArgScene():Scene3D
		{
			return _constructorArgScene;
		}
		public static function set constructorArgScene(value:Scene3D):void
		{
			if (_instance !== null)
			{
				throw new Error(SINGLETON_INSTANTIATED_ERROR);
			}
			_constructorArgScene = value;
		}
	
		private static var _constructorArgCamera:Camera3D = null;
		public static function get constructorArgCamera():Camera3D
		{
			return _constructorArgCamera;
		}
		public static function set constructorArgCamera(value:Camera3D):void
		{
			if (_instance !== null)
			{
				throw new Error(SINGLETON_INSTANTIATED_ERROR);
			}
			_constructorArgCamera = value;
		}

		private static var _constructorArgRenderer:RendererBase = null;
		public static function get constructorArgRenderer():RendererBase
		{
			return _constructorArgRenderer;
		}
		public static function set constructorArgRenderer(value:RendererBase):void
		{
			if (_instance !== null)
			{
				throw new Error(SINGLETON_INSTANTIATED_ERROR);
			}
			_constructorArgRenderer = value;
		}

		private static var _constructorArgForceSoftware:Boolean = false;
		public static function get constructorArgForceSoftware():Boolean
		{
			return _constructorArgForceSoftware;
		}
		public static function set constructorArgForceSoftware(value:Boolean):void
		{
			if (_instance !== null)
			{
				throw new Error(SINGLETON_INSTANTIATED_ERROR);
			}
			_constructorArgForceSoftware = value;
		}

		private static var _constructorArgProfile:String = "baseline";
		public static function get constructorArgProfile():String
		{
			return _constructorArgProfile;
		}
		public static function set constructorArgProfile(value:String):void
		{
			if (_instance !== null)
			{
				throw new Error(SINGLETON_INSTANTIATED_ERROR);
			}
			_constructorArgProfile = value;
		}

		private static var _constructorArgMouseEnabled:Boolean = true;
		public static function get constructorArgMouseEnabled():Boolean
		{
			return _constructorArgMouseEnabled;
		}
		public static function set constructorArgMouseEnabled(value:Boolean):void
		{
			if (_instance !== null)
			{
				throw new Error(SINGLETON_INSTANTIATED_ERROR);
			}
			_constructorArgMouseEnabled = value;
		}

		private static var _instance:SingletonView3D;
		public static function get instance():SingletonView3D
		{
			if (_instance === null) 
			{
				_instance = new SingletonView3D(SingletonLock);
			}
			return _instance;
		}
		
		private var _requiresRender:Boolean;
		/** 
		 * Flags that a call to <code>render()</code> is pending.<br/> 
		 * Setting this alone doesn't result in a call to <code>render()</code>, 
		 * it is the job of the view's owner to determine when to call <code>render()</code>.<br/>
		 * <code>requiresRender</code> will automatically be cleared upon a call to <code>render()</code>.
		 */
		public function setRequiresRender():void
		{
			_requiresRender = true;
		}
		/** Whether a call to <code>render()</code> is pending. */
		public function get requiresRender():Boolean
		{
			return _requiresRender;
		}

		public function SingletonView3D(lock:Class)
		{
			if (lock === SingletonLock)
			{
				super(_constructorArgScene, _constructorArgCamera, _constructorArgRenderer, _constructorArgForceSoftware, _constructorArgProfile, _constructorArgMouseEnabled);
			}
			else
			{
				throw new Error("SingletonView3D is a singleton. Access the instance via instance property.");
			}
		}

		override public function render():void
		{
			_requiresRender = false;
			super.render();
		}
	}
}

class SingletonLock
{
}