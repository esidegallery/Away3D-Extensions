package starling.assets
{
	import away3d.textures.StarlingTexture2DBase;

	import starling.assets.AssetFactoryHelper;
	import starling.assets.AssetReference;
	import starling.assets.BitmapTextureFactory;
	import starling.textures.Texture;

	public class Away3DBitmapTextureFactory extends BitmapTextureFactory
	{
		override public function create(reference:AssetReference, helper:AssetFactoryHelper,
                                        onComplete:Function, onError:Function):void
        {
            function onComplete2(name:String, texture:Texture):void
            {
                var a3dTexture:StarlingTexture2DBase = new StarlingTexture2DBase(texture);

                if (reference.textureOptions.onReady !== null)
				{
					reference.textureOptions.onReady(texture);
				}

                onComplete(name, a3dTexture, HybridAssetType.AWAY_3D_TEXTURE);
            }

            super.create(reference, helper, onComplete2, onError);
        }
	}
}