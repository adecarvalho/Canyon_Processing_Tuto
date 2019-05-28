//
class GameStage extends ez_Stage {

  private Paysage paysage=null;

  private Rock[] tabRock=null;

  private Pillars pillars=null;

  private Plane plane=null;


  //
  GameStage() {
    super();

    paysage= new Paysage();

    tabRock= new Rock[2];

    tabRock[0]= new Rock(Rock.ROCK_TYPE_UP);
    tabRock[1]= new Rock(Rock.ROCK_TYPE_DOWN);

    pillars= new Pillars();

    plane= new Plane(width/3, height/2);
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
      //score
      pillars.newWave();
    }

    //plane
    plane.update(dt);
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
  }

  //
  void onEnter(StringDict message) {
  }

  //
  void onExit() {
  }
}
//class end
