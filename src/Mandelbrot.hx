package;

import hxPixels.Pixels;

#if luxe
import luxe.Sprite;
import phoenix.Texture;
import luxe.options.ResourceOptions;
import phoenix.RenderTexture;
#elseif flash 
import flash.display.Bitmap;
import flash.display.BitmapData;
#elseif kha
import kha.Image;
import kha.graphics4.TextureFormat;
#end

@:access(Pixels.width)
@:access(Pixels.height)
@:forward
abstract Mandelbrot( Pixels ) from Pixels to Pixels {
    inline static var MAX_ITER = 0xff;
    public static var count = 10000;
    public inline function new( width_: Int, height_: Int, color: Int ){
        //pixels = image;
        var width = width_;
        var height = height_;
        this = new Pixels( width, height );
        var step_x = 3.0 / (width-1);
        var step_y = 2.0 / (height-1);
        for (i in 0...height) {
            var ci = i * step_y - 1.0;
            for (j in 0...width) {
                var k = 0;
                var zr = 0.0;
                var zi = 0.0;
                var cr = j * step_x - 2.0;
                while (k <= MAX_ITER && (zr*zr + zi*zi) <= 4) {
                    var temp = zr*zr - zi*zi + cr;
                    zi = 2*zr*zi + ci;
                    zr = temp;
                    k ++;
                }
                paint(j, i, k, color );
            }
        }
    }
    #if luxe
    @:to
    public function toLuxeSprite():Sprite {
        // TODO: change the color settings for render texture
        var renderTexture = new RenderTexture({ id: Std.string('id' + count++ )
                                            ,   width: this.width
                                            ,   height: this.height }); 
        this.applyToLuxeTexture( renderTexture ); // explicitly flush data
        var sprite = new Sprite({
            texture: renderTexture,
            pos: Luxe.screen.mid
            } );
            trace( sprite );
        return sprite;
    } 
    #elseif flash
    @:to
    public function toFlashBitmap():Bitmap {
        var bd = new BitmapData( this.width, this.height, false );
        this.applyToBitmapData( bd ); // explicitly flush data
        var bitmap = new Bitmap( bd );
        flash.Lib.current.stage.addChild( bitmap );
        return bitmap;
    } 
    #elseif kha
    public function getKhaImage():Image {
        var image = Image.fromBytes( this.bytes, this.width, this.height, TextureFormat.RGBA32 );
        return image;
    }
    #end
    inline function paint(x, y, iter, color ) {
        var red = iter > MAX_ITER? 0 : iter * color;
        this.setPixel32(x, y, red ); // using pixels here!
    }
}