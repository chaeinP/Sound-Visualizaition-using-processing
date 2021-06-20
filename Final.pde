import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim m;
AudioPlayer player;
FFT fft;


PImage starry;

void setup(){
  size(795,660);
  starry = loadImage("Untitled-1.jpg");
 
 background(0);
 //background(starry);
  
 m = new Minim(this);
 player = m.loadFile("Vincent .mp3");
 player.play();
 //player.loop();
 fft = new FFT (player.bufferSize(), player.sampleRate());

}

void draw(){
  //background(starry);
  
 fft.forward(player.mix); 
 
 for(int i=0; i<fft.specSize()/2; i++){
 //println(fft.getBand(i));  
 float x = random(width);
 float y =random(height);
 color c = starry.get(int(x),int(y));
 //noStroke();
 stroke(c);
 fill (c,30);
 //ellipse(x,y,fft.getBand(i),fft.getBand(i));
 
 if (fft.getBand(i)<30){
  noStroke();
  fill(c); 
  ellipse(x,y,0,0); 
 }else{ 

   ellipse(x,y,fft.getBand(i),fft.getBand(i)/4);
 }
 
 }

}
