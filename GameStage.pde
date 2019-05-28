//
class GameStage extends ez_Stage {

  private Paysage paysage=null;

  private Rock[] tabRock=null;

  private Pillars pillars=null;



  //
  GameStage() {
    super();

    paysage= new Paysage();

    tabRock= new Rock[2];

    tabRock[0]= new Rock(Rock.ROCK_TYPE_UP);
    tabRock[1]= new Rock(Rock.ROCK_TYPE_DOWN);

    pillars= new Pillars();
  }

  //
  void input() {
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
     
  }

  //
  void onEnter(StringDict message) {
  }

  //
  void onExit() {
  }
}
//class end
