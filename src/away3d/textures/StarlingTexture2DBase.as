package away3d.textures
{
	import away3d.textures.Texture2DBase;

	import flash.display3D.Context3D;
	import flash.display3D.textures.TextureBase;

	import starling.textures.Texture;

	/**
	 * Wraps a Starling texture for use in Away3D. Works with bitmap-based Starling textures.
	 */
	public class StarlingTexture2DBase extends Texture2DBase
	{
		/** A reference to a Starling texture previously created*/
   		private var starlingTexture:Texture;

		public function StarlingTexture2DBase(starlingTexture:starling.textures.Texture)
		{
			this.starlingTexture = starlingTexture;
			if (starlingTexture)
			{
				_format = starlingTexture.format;
				_hasMipmaps = starlingTexture.mipMapping;
				_width = starlingTexture.width;
				_height = starlingTexture.height;
			}
			super();
		}

		override protected function createTexture(context:Context3D):TextureBase
		{
			return starlingTexture.base;
		}

		override protected function uploadContent(texture:TextureBase):void
		{
			/** Do nothing. */
		}
	}
}