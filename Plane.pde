//
class Plane extends ez_Entity {

  public static final int PLANE_STATE_WAIT=10;
  public static final int PLANE_STATE_FLY=20;
  public static final int PLANE_STATE_TOUCHED=30;

  private PVector posInit=null;

  private ez_Label label=null;

  private float gravity=7;
  private float pulse=-3;

  private ez_Animation animation=null;

  private ez_Animation explosion=null;

  private ez_Generator gaz=null;

  Plane(float x, float y) {
    super(x, y, 88, 73);

    posInit= new PVector(x, y);
    setState(PLANE_STATE_WAIT);
    setSpeeds(0, 0);

    label= new ez_Label("fonts/free.ttf", 30);
    label.setText("Press Space Bar ");
    label.setColorText(color(51));

    animation= new ez_Animation("images/flying.png", 90, 75);
    animation.play();

    gaz= new ez_Generator(x, y+20, 100, 150, 150, 210);
    gaz.begin();

    explosion= new ez_Animation("images/explosion.png", 102, 102, 0.02, false);
  }

  void jump() {
    int state= getState();

    //wait
    if (state==PLANE_STATE_WAIT)
    {
      setState(PLANE_STATE_FLY);
      return;
    }

    //fly
    if (state==PLANE_STATE_FLY)
    {
      setSpeedY(pulse);
    }
  }

  //touched
  void touched() {
    
    if(getState()==PLANE_STATE_FLY)
    {
       setState(PLANE_STATE_TOUCHED);
       explosion.play();
    }
   
  }



  void update(float dt) {

    int state=getState();

    if (state==PLANE_STATE_FLY)
    {
      setSpeedY(getSpeedY()+gravity*dt);
      setPositionY(getPositionY()+getSpeedY());
    }

    //limites
    if (getTop() <0)
    {
      setTop(0);
    }

    if (getBottom() > height)
    {
      setBottom(height);
    }

    //animation
    animation.update(dt);

    //explosion
    explosion.update(dt);

    if (state==PLANE_STATE_TOUCHED && explosion.isPlaying()==false)
    {
      setState(PLANE_STATE_WAIT);
      setPosition(posInit.x,posInit.y);
      setSpeeds(0,0);
    }

    //gaz
    gaz.move(getPositionX(), getPositionY()+20);
    gaz.update(dt);


    super.update(dt);
  }


  void render() {
    //super.render();

    //super.renderDebug();

    int state=getState();

    if (state==PLANE_STATE_WAIT)
    {
      label.render(width/2, height/2);
    }

    //animation
    if (state==PLANE_STATE_FLY || state==PLANE_STATE_WAIT)
    {
      gaz.render();
      animation.render(getPositionX(), getPositionY());
    }

    //explosion
    if (state==PLANE_STATE_TOUCHED)
    {
      explosion.render(getPositionX(),getPositionY());
    }
  }
}
