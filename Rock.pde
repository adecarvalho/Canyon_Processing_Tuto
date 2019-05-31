//
class Rock extends ez_Entity {

  public static final int ROCK_TYPE_UP=100;
  public static final int ROCK_TYPE_DOWN=110;
  private float speedModule=180;



  Rock(int type) {
    super(0, 0, 1600, 70);

    switch(type)
    {
    case ROCK_TYPE_UP:
      setImage("images/rock_up.png");
      setTop(0);
      setLeft(0);
      break;


    case ROCK_TYPE_DOWN:
      setImage("images/rock_down.png");
      setBottom(height);
      setLeft(0);
      break;


    default:
      break;
    }
    //
    setSpeedX(-speedModule);
    inflate(0, 15);
  }

  void update(float dt) {
    super.update(dt);

    if (getLeft() < -width)
    {
      setLeft(0);
    }
  }

  void render() {
    super.render();

    // super.renderDebug();
  }
}
