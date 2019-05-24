//
class Paysage {
  
  private PImage img=null;
  private PVector position=null;
  private float speed=0;
  

  Paysage() {
    img= loadImage("images/paysage.png");
    position= new PVector(0,0);
    speed=1;
  }

  void update(float dt) {
    position.x -=speed;// position.x= position.x - speed
    
    if(position.x < -width)
    {
      position.x=0;
    }
  }
  
  void render(){
    if(img!= null)
    {
      image(img,position.x,position.y);
    }
  }
}
