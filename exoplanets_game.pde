PImage shuttleIMG, backGround, button, backGround2;
String[] fileNames = {"55 Cancri e.png", "GJ 436 b.png","HAT-P-7 b.png","HAT-P-11 b.png", "HD 209458 b.png","Kepler-442 b.png", "Kepler-22 b.png","Kepler-1053-b.png","Proxima Centauri b.png", "TRAPPIST-1 e.png"};
String[] dataNames = {"55 Cancri e.txt", "GJ 436 b.txt", "HAT-P-7 b.txt", "HAT-P-11 b.txt", "HD 209458 b.txt", "Kepler-442 b.txt", "Kepler-22 b.txt", "Kepler-1053-b.txt", "Proxima Centauri b.txt", "TRAPPIST-1 e.txt"};
ArrayList<Planet> planets = new ArrayList<Planet>();
Shuttle shuttle= new Shuttle();
boolean display_planet = false;
int index;
void setup() {
  fullScreen();
  //All images
  shuttleIMG = loadImage("shuttle.png");
  backGround = loadImage("bg.jpeg");
  button = loadImage("button.png"); 
  backGround2 = loadImage("bg 2.jpg");
  
  //creating objects
  for(int i=0;i<10;i++){
    planets.add(new Planet((width-15*95)+i*140,random(100,height),loadImage(fileNames[i]), loadStrings(dataNames[i])));
  }
  
}

void draw() {
  backGround.resize(width,height);
  backGround2.resize(width,height);
  background(backGround); 
  noStroke();
  for(Planet planet : planets)
    planet.display();
  shuttle.display();  
 
  //collision with planets
  for (int i=0;i<planets.size();i++){
        if(shuttle.x+125>planets.get(i).x&&shuttle.x+125<=planets.get(i).x+100&&
        shuttle.y+75>planets.get(i).y+15&&shuttle.y+75<=planets.get(i).y+85&&!display_planet){
          horizontal = false;
          display_planet = true;
          delay(250);
          index=i;
          break;
        }
  }
  if(display_planet){
    background(backGround2);
    image(button,width/2-250, height-350, 500,420);
    Planet planet = planets.get(index);
    image(planet.img, 80, 80, 400,400);
    fill(255);
    textSize(35);
    for(int i=0;i<planet.data.length;i++)
       text(planet.data[i], 200, 550+50*i);
  }
  
}

void mousePressed(){
  if(!display_planet)
     horizontal = true; //related to shuutle motion
  if(display_planet && mouseX > width/2-250 && mouseX < width/2 + 250&& 
      mouseY > height-350 && mouseY < height+70){
    planets.remove(planets.get(index));
    display_planet = false;
    background(backGround); 
    for(Planet planet : planets)
      planet.display();
    shuttle.x=50;  
    shuttle.display();
  }
}
