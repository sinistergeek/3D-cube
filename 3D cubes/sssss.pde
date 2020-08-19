import peasy.*;
int OFF_MAX = 300;
PeasyCam cam;

void settings(){

System.setProperty("jogl.disable.openglcore", "true");
smooth(8);
size(1080,1060,P3D);
}
void  setup(){

cam = new PeasyCam(this,1000);

cam.setMinimumDistance(50);
cam.setMaximumDistance(5000);

}
void draw(){
 
  background(0);
  translate(width/2,height/2,0);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  rotateZ(frameCount * 0.01);
  for(int x = -OFF_MAX; x<= OFF_MAX; x+=50){
    for(int y = -OFF_MAX; y<= OFF_MAX; y+=50){
      for(int z = -OFF_MAX; z<= OFF_MAX; z+=50){
    pushMatrix();
    translate(x,y,z);
   rotateX(frameCount * 0.02);
  rotateY(frameCount * 0.02);
  rotateZ(frameCount * 0.02);
  
  fill(colorFromOffset(x),colorFromOffset(y),colorFromOffset(z));
  
    box((float)(20 + (Math.sin(frameCount/20.0)) * 15));
    popMatrix();
  }
    }
  }
}


int colorFromOffset(int offset){
return (int) ((offset + OFF_MAX)/(2.8 *OFF_MAX) * 255);

}
