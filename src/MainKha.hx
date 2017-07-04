package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Color;

class MainKha {
    public function new() {
        System.notifyOnRender(render);
        Scheduler.addTimeTask(update, 0, 1 / 60);
    }
    function update(): Void {
        
    }
    function render(framebuffer: Framebuffer): Void {
        var mandelbrot = new Mandelbrot( 1024, 768, 0x0cf0f0f );
        var image = mandelbrot.getKhaImage(); 
        var g2 = framebuffer.g2;
        g2.begin();
        g2.clear(Color.fromValue(0xff000000));
        g2.drawImage( image, 0, 0 );
        g2.end();
    }
}