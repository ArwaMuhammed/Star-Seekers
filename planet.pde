class Planet{
  public float x,y,speed;
  PImage img;
  String[] data;
  Planet(float x, float y, PImage img, String[] data){
    this.x=x;
    this.y=y;
    this.img=img;
    this.data=data;
    this.speed=random(2,4.5);
  }
  void display(){
      image(img,x,y,100,100);
      y-=speed;
      if(y<=-100)
        y=height;
     
  } 
   

};
