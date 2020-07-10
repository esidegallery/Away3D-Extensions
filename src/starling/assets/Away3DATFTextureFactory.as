package starling.assets
{
	import away3d.textures.ATFTexture;

	import flash.utils.ByteArray;

	import starling.assets.AssetFactory;
	import starling.assets.AssetFactoryHelper;
	import starling.assets.AssetReference;
	import starling.textures.AtfData;
	
	public class Away3DATFTextureFactory extends AssetFactory
	{
		/** Creates a new instance. */
        public function Away3DATFTextureFactory()
        {
            addExtensions("atf"); // not used, actually, since we can parse the ATF header, anyway.
        }

        /** @inheritDoc */
        override public function canHandle(reference:AssetReference):Boolean
        {
            return (reference.data is ByteArray && AtfData.isAtfData(reference.data as ByteArray));
        }

		/** @inheritDoc */
        override public function create(reference:AssetReference, helper:AssetFactoryHelper,
                                        onComplete:Function, onError:Function):void
        {
			helper.executeWhenContextReady(createTexture);

			function createTexture():void
            {
				var texture:ATFTexture;

				try 
				{ 
					texture = new ATFTexture(reference.data as ByteArray); 
				}
                catch (e:Error) 
				{ 
					onError(e.message); 
				}

				reference.data = null; // Prevent closures from keeping reference.

				if (reference.textureOptions.onReady !== null)
				{
					reference.textureOptions.onReady(texture);
				}
				onComplete(reference.name, texture, HybridAssetType.AWAY_3D_TEXTURE);
			}
		}
	}
}