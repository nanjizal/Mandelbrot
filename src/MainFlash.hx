package;
import flash.display.Bitmap;
import flash.Lib;
class MainFlash{
    inline static var MAX_ITER = 0xff;
    public static function main() {
        var w = Lib.current.stage.stageWidth;
        var h = Lib.current.stage.stageHeight;
        var mandelbrot = new Mandelbrot( w, h, 0x0cf0f0f );
        trace( mandelbrot);
        var bitmap: Bitmap = mandelbrot;
    }
}