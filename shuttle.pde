boolean horizontal = false;
class Shuttle{
  public int x=50,y;
  void display(){
    if(horizontal){ 
      image(shuttleIMG, x, y, 150, 150);
      x+=10;
      if(x >= width+100){
        x=0;
        horizontal = false;
      }
    }
    else{
      image(shuttleIMG, x, mouseY, 150, 150);
      if(x<50)
        x+=10;
      y = mouseY;
    }
  }
  
};
