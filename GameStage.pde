//
class GameStage extends ez_Stage {
 
  private Paysage paysage=null;

  private Rock[] tabRock=null;

  private Pillars pillars=null;

  private Plane plane=null;

  private ez_Label labelPoints=null;
  private ez_Label labelLives=null;

  private int points=0;
  private int lives=3;
  
  private AudioPlayer gameMusic=null;
  
  private AudioSample boom=null;
  private AudioSample ding=null;


  //
  GameStage() {
    super();
    
    gameMusic= gMinim.loadFile("musics/plane.mp3");

    paysage= new Paysage();

    tabRock= new Rock[2];

    tabRock[0]= new Rock(Rock.ROCK_TYPE_UP);
    tabRock[1]= new Rock(Rock.ROCK_TYPE_DOWN);

    pillars= new Pillars();

    plane= new Plane(width/3, height/2);

    //score
    labelPoints= new ez_Label("fonts/free.ttf", 30);
    labelPoints.setColorText(color(51));
    labelPoints.setText("Points");

    labelLives= new ez_Label("fonts/free.ttf", 30);
    labelLives.setColorText(color(51));
    labelLives.setText("Lives");
    
    //sounds
    boom= gMinim.loadSample("sounds/boom.wav",256);
    ding= gMinim.loadSample("sounds/ding.wav",256);
  }

  //collisions
  void collisions() {

    //rock-plane
    for (Rock item : tabRock)
    {
      if (plane.getState()==plane.PLANE_STATE_FLY && plane.isCollide(item))
      {
        lives--;
        
        plane.touched();
        pillars.newWave();
        
        boom.trigger();
      }
    }


    //pillars-plane
    if (pillars.isCollidePlane(plane))
    {
      lives=lives-1;
      
      plane.touched();
      
      boom.trigger();
    }
  }

  void input() {
    if (gInputManager.isKeyPressed(32))
    {
      plane.jump();
    }
  }


  //
  void update(float dt) {

    input();


    paysage.update(dt);

    //rocks
    for (Rock item : tabRock)
    {
      item.update(dt);
    }

    //pillars
    pillars.update(dt);

    //touch left
    if (pillars.isTouchedLeft()==true)
    {
      pillars.newWave();
      
      if(plane.getState()==plane.PLANE_STATE_FLY)
      {
        points++;
        
        ding.trigger();
      }
    }

    //plane
    plane.update(dt);

    //test collisions
    collisions();
    
    //is Game Over
    if(lives <0)
    {
      StringDict msg= new StringDict();
      msg.set("SCORE",str(points));
      gStageManager.changeStage(new ConcluStage(),msg);
    }
  }

  //
  void render() {
    paysage.render();

    pillars.render();


    //rocks
    for (Rock item : tabRock)
    {
      item.render();
    }

    //plane
    plane.render();
    
    //score
    labelPoints.setText("Points: "+points);
    labelPoints.render(30,30);
    
    labelLives.setText("Lives: "+lives);
    labelLives.render(width-150,30);
  }

  //
  void onEnter(StringDict message) {
    if(gameMusic!= null)
    {
      gameMusic.loop();
    }
  }

  //
  void onExit() {
    if(gameMusic!= null)
    {
      gameMusic.close();
    }
    
  }
}
//class end
