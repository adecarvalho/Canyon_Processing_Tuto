//
class Pillar extends ez_Entity {

  public static final int PILLAR_TYPE_UP=200;
  public static final int PILLAR_TYPE_DOWN=210;

  private boolean touchLeft=false;

  Pillar(int type) {
    super(0, 0, 108, 239);

    switch(type)
    {
    case PILLAR_TYPE_UP:
      setImage("images/pillar_haut.png");
      setRight(width);
      setTop(0);
      break;

    case PILLAR_TYPE_DOWN:
      setImage("images/pillar_bas.png");
      setBottom(height);
      setRight(width);
      break;

    default:
      break;
    }
    //
    inflate(30,20);
  }

  boolean isTouchLeft() {
    return touchLeft;
  }

  void move(float speed) {
    setSpeedX(-speed);
  }

  void reset() {
    touchLeft=false;
    setSpeedX(0);
    setRight(width);
  }

  void update(float dt) {
    super.update(dt);
    
    if(getRight() <= 0)
    {
      touchLeft=true;
    }
  }

  void render() {
    super.render();

    super.renderDebug();
  }
}
