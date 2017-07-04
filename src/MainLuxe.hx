package;
import luxe.Input;
import luxe.Sprite;
import phoenix.Texture;
class MainLuxe extends luxe.Game {
    
    override function ready() {
        var mandelbrot = new Mandelbrot( 1024, 768, 0x0cf0f0f );
        trace( mandelbrot);
        var sprite: Sprite = mandelbrot;
        trace( sprite );
    } //ready

    override function onmousemove( event:MouseEvent ) {
        // mousemove update
    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update( delta:Float ) {
        // delta frame rate.
        // frame update
        
    } //update

    override function config( config:luxe.GameConfig ) {

        #if luxe_doc_sample
            config.window.width = 1024;
            config.window.height = 768;
        #end

        return config;

    } //config
    
} //Main